import * as flags from 'https://deno.land/std/flags/mod.ts';

import { osc } from '../lib/scsynth-wasm-builds/lib/ext/osc.js';

import * as tcp from '../lib/jssc3/ts/kernel/tcp.ts';
import * as scTcp from '../lib/jssc3/ts/sc3/scSynthTcp.ts';
import * as scUdp from '../lib/jssc3/ts/sc3/scSynthUdp.ts';

import * as sc from '../lib/jssc3/ts/sc3.ts';

import * as evaluate from './evaluate.ts';
import * as fileio from './fileio.ts';
import * as kernel from './kernel.ts';
import * as load from './load.ts';
import * as preferences from './preferences.ts';
import * as sl from './sl.ts';
import * as options from './options.ts';
import * as repl from './repl.ts';

/*
function getCwd(): string {
	return Deno.cwd();
}
*/

function getEnv(variableName: string): string | null {
	return Deno.env.get(variableName) || null;
}

/*
function getEnvOr(variableName: string, defaultValue: string) {
	return getEnv(variableName) || defaultValue;
}
*/

function getSplDirectory(): string {
	return getEnv('SplDirectory') || '?';
}

/*
function getHomeDirectory(): string {
	return getEnv('HOME') || '?';
}
*/

function getSplConfigurationDirectory(): string {
	return '../config';
}

/*
function getSplUserConfigurationDirectory(): string {
	return [getHomeDirectory(), '.config/spl'].join('/');
}
*/

function getSplPreferencesFilename(): string {
	return [getSplConfigurationDirectory(), 'preferences.json'].join('/');
}

async function readSplPreferencesFile(): Promise<string> {
	const fileName = getSplPreferencesFilename();
	return await Deno.readTextFile(fileName).catch(function (err) {
		console.error('readSplPreferencesFile', err);
		return '{}';
	});
}

async function readSplPreferences(): Promise<preferences.Preferences> {
	const preferencesText = await readSplPreferencesFile();
	return JSON.parse(preferencesText);
}

const cliPreferences = await readSplPreferences();
console.log('cliPreferences', getSplPreferencesFilename(), cliPreferences);
sl.system.cache.set('preferences', cliPreferences);

BigInt.prototype.toJSON = function () {
	return this.toString();
};

function help(): void {
	console.log('spl');
	console.log('  replPerLine --dir=loadPath [lib]');
	console.log('  rewriteFile fileName');
	console.log('  runFile fileName --dir=loadPath [lib]');
	console.log('  sc playFile --dir=loadPath');
	console.log('  sc tcpServer --port=portNumber --dir=loadPath');
	console.log('    --strict');
	console.log('    --unsafe');
	console.log('    --verbose');
	console.log(`    SplDirectory=${getSplDirectory()}`);
	console.log(`    ScProtocol=Tcp`);
	console.log(`    ScHostname=127.0.0.1`);
	console.log(`    ScPort=57110`);
}

async function rewriteFile(fileName: string): Promise<void> {
	console.log(await fileio.rewriteFile(fileName));
}

declare global {
	var sc: Record<string, unknown>;
	var globalScSynth: sc.ScSynth;
}

/*
async function scSynthFromEnv(): Promise<sc.ScSynth> {
	const protocol: string = Deno.env.get('ScProtocol') || 'Tcp';
	const hostname: string = Deno.env.get('ScHostname') || '127.0.0.1';
	const port: number = Number(Deno.env.get('ScPort') || '57110');
	console.debug('cli: scSynthFromEnv (await)', protocol, hostname, port);
	if (protocol == 'Tcp') {
		return await scTcp.ScSynthTcp(hostname, port);
	} else {
		return Promise.resolve(scUdp.ScSynthUdp(hostname, port));
	}
}
*/

async function scSynthFromPreferences(
	splPreferences: preferences.Preferences,
): Promise<sc.ScSynth> {
	const protocol: string = preferences.preferencesRead(
		splPreferences,
		'ScSynth.Protocol',
		'Tcp',
	);
	const hostname: string = preferences.preferencesRead(
		splPreferences,
		'ScSynth.Hostname',
		'127.0.0.1',
	);
	const port: number = preferences.preferencesRead(
		splPreferences,
		'ScSynth.Port',
		57110,
	);
	console.debug(
		'cli: scSynthFromPreferences (await)',
		protocol,
		hostname,
		port,
	);
	if (protocol == 'Tcp') {
		return await scTcp.ScSynthTcp(hostname, port);
	} else {
		return Promise.resolve(scUdp.ScSynthUdp(hostname, port));
	}
}

async function loadSpl(opt: flags.Args, lib: string[]): Promise<void> {
	const loadPath = opt.dir || getSplDirectory() || './';
	console.log(
		`loadSpl: opt.dir=${opt.dir}`,
		`getSplDirectory=${getSplDirectory()}`,
		`loadPath=${loadPath}`,
	);
	fileio.addLoadFileMethods();
	sl.assignGlobals();
	load.setLoadPath(loadPath);
	await fileio.evaluateFile(loadPath + '/Meta/PackageIndex.sl', 'LoadSpl');
	await kernel.primitiveLoadPackageSequence(['Kernel'].concat(lib));
	if (lib.includes('SuperColliderLibrary')) {
		globalThis.sc = sc;
		const cliScSynth = await scSynthFromPreferences(cliPreferences);
		globalThis.globalScSynth = cliScSynth;
	}
}

async function replPerLine(opt: flags.Args, lib: string[]): Promise<void> {
	await loadSpl(opt, lib);
	repl.perLine(opt.verbose);
}

async function runFile(fileName: string, opt: flags.Args): Promise<void> {
	await loadSpl(opt, []);
	console.log(await fileio.evaluateFile(fileName, 'RunFile'));
}

function evaluateInteractive(text: string): unknown {
	try {
		return evaluate.evaluateForSignalling('*Interactive*', text);
	} catch (err) {
		console.error('Spl.Cli: error', err);
	}
}

function scEvalText(splText: string): unknown {
	const answer = evaluateInteractive(splText);
	console.log('scEvalText', answer);
	return answer;
}

async function scEvalFile(fileName: string): Promise<unknown> {
	const splText = await Deno.readTextFile(fileName);
	return scEvalText(splText);
}

async function scPlayFile(fileName: string): Promise<void> {
	const splText = await Deno.readTextFile(fileName);
	scEvalText(`{ ${splText} }.play`);
}

/*
echo '{"command": "evalText", "text": "{ SinOsc(440, 0) * 0.1 }.play"}' | netcat -C -q 1 -u 127.0.0.1 3010
echo '{"command": "playFile", "fileName": "/home/rohan/sw/jssc3/help/graph/jmcc-analog-bubbles.stc"}' | netcat -C -q 1 -u 127.0.0.1 3010
*/

function scTcpServer(portNumber: number): void {
	// console.debug(`scTcpServer: ${portNumber}`);
	const hostname = '0.0.0.0'; /* 127.0.0.1 */
	tcp.tcpServer(
		hostname,
		portNumber,
		function (_unusedConnection, _unusedAddress, datagram) {
			// console.debug(`scTcpServer: ${datagram}`);
			const datagramText = new TextDecoder().decode(datagram);
			if (datagramText.trim().length > 0) {
				// console.debug(`scTcpServer: datagramText: '${datagramText}`);
				try {
					const message = JSON.parse(datagramText);
					// console.debug(`scTcpServer: recv: ${datagram}: ${message}`);
					switch (message.command) {
						case 'evalText':
							scEvalText(message.text);
							break;
						case 'evalFile':
							scEvalFile(message.fileName);
							break;
						case 'playFile':
							scPlayFile(message.fileName);
							break;
						default:
							console.warn(`scTcpServer: unknown command: ${message.command}`);
							break;
					}
				} catch (err) {
					console.error(
						`scTcpServer: message: '${datagramText}', err: ${err} -> ${err.cause}`,
					);
				}
			}
		},
	);
}

declare global {
	var osc: Record<string, any>;
}

async function scCmd(cmd: string, opt: flags.Args): Promise<void> {
	globalThis.osc = osc;
	await loadSpl(opt, ['StandardLibrary', 'SuperColliderLibrary']);
	switch (cmd) {
		case 'playFile':
			scPlayFile(<string> opt._[2]);
			break;
		case 'tcpServer':
			scTcpServer(Number(opt.port));
			break;
		default:
			help();
			break;
	}
}

function cli(): void {
	const args = flags.parse(Deno.args, {
		boolean: ['strict', 'unsafe', 'verbose'],
		string: ['dir', 'port'],
	});
	if (args._.length < 1) {
		help();
	} else {
		if (args.strict) {
			options.slOptions.insertArityCheck = true;
			options.slOptions.uncheckedIndexing = false;
		}
		if (args.unsafe) {
			options.slOptions.insertArityCheck = false;
			options.slOptions.uncheckedIndexing = true;
		}
		// console.debug('slOptions: ', options.slOptions);
		switch (args._[0]) {
			case 'replPerLine':
				replPerLine(args, args._.slice(1));
				break;
			case 'rewriteFile':
				rewriteFile(<string> args._[1]);
				break;
			case 'runFile':
				runFile(<string> args._[1], args);
				break;
			case 'sc':
				scCmd(<string> args._[1], args);
				break;
			case 'help':
				help();
				break;
			default:
				help();
				break;
		}
	}
}

declare global {
	var sl: Record<string, any>;
}

globalThis.sl = sl;
globalThis.sc = sc;

cli();
