import * as flags from 'https://deno.land/std/flags/mod.ts'

import { osc } from '../lib/osc.js/src/osc.js'

import * as udp from '../lib/jssc3/ts/kernel/udp.ts'
import * as scUdp from '../lib/jssc3/ts/sc3/scsynth-udp.ts'

import * as sc from '../lib/jssc3/ts/sc3.ts'

import * as evaluate from './evaluate.ts'
import * as fileio from './fileio.ts'
import * as kernel from './kernel.ts'
import * as load from './load.ts'
import * as sl from './sl.ts'
import { slOptions } from './options.ts'
import * as repl from './repl.ts'

function getSplDir(): string {
	return Deno.env.get('SPL_DIR') || '?';
}

BigInt.prototype.toJSON = function () {
	return this.toString();
};

function help(): void {
	console.log('spl');
	console.log('  replPerLine --dir=loadPath [lib]');
	console.log('  rewriteFile fileName');
	console.log('  runFile fileName --dir=loadPath [lib]');
	console.log('  sc playFile --dir=loadPath');
	console.log('  sc udpServer portNumber --dir=loadPath');
	console.log('    --strict');
	console.log('    --unsafe');
	console.log('    --verbose');
	console.log(`    SPL_DIR=${getSplDir()}`);
}

async function rewriteFile(fileName: string): Promise<void> {
	console.log(await fileio.rewriteFile(fileName));
}

declare global {
	var sc: Record<string, unknown>;
	var globalScSynth: sc.ScSynth;
}

const cliScSynth = scUdp.scSynthUdp(scUdp.defaultScSynthUdp);

async function loadSpl(opt: flags.Args, lib: string[]): Promise<void> {
	const loadPath = opt.dir || getSplDir() || './';
	console.log(`loadSpl: opt.dir=${opt.dir}, getSplDir=${getSplDir()}, loadPath=${loadPath}`);
	fileio.addLoadFileMethods();
	sl.assignGlobals();
	load.setLoadPath(loadPath);
	await fileio.evaluateFile(loadPath + '/Meta/PackageIndex.sl', 'LoadSpl');
	await kernel.primitiveLoadPackageSequence(['Kernel'].concat(lib));
	if(lib.includes('SuperColliderLibrary')) {
		globalThis.sc = sc;
		globalThis.globalScSynth = cliScSynth;
	}
}

async function replPerLine(opt: flags.Args, lib: string[]): Promise<void> {
	await loadSpl(opt, lib);
	repl.perLine(opt.verbose);
}

async function runFile(fileName: string, opt: flags.Args): Promise<void> {
	await loadSpl(opt, []);
	console.log(await fileio.evaluateFile(fileName, 'RunFile'))
}

function evaluateInteractive(text: string): unknown {
	return evaluate.evaluateForSignalling('*Interactive*', text);
}

function scEvalText(splText: string): unknown {
	return evaluateInteractive(splText);
}

async function scEvalFile(fileName: string): Promise<unknown> {
	const splText = await Deno.readTextFile(fileName);
	return scEvalText(splText);
}

function scPlayText(splText: string): void {
	const ugenGraph: sc.Signal = <sc.Signal>evaluateInteractive(splText);
	sc.playUgenAt(cliScSynth, ugenGraph, -1, 1, [], null);
}

async function scPlayFile(fileName: string): Promise<void> {
	const splText = await Deno.readTextFile(fileName);
	scPlayText(splText);
}

/*
echo '{"command": "evalText", "text": "{ SinOsc(440, 0) * 0.1 }.play"}' | netcat -C -q 1 -u 127.0.0.1 3010
echo '{"command": "playText", "text": "SinOsc(440, 0) * 0.1"}' | netcat -C -q 1 -u 127.0.0.1 3010
echo '{"command": "playFile", "fileName": "/home/rohan/sw/jssc3/help/graph/jmcc-analog-bubbles.stc"}' | netcat -C -q 1 -u 127.0.0.1 3010
*/

function scUdpServer(portNumber: number): void {
	// console.debug(`scUdpServer: ${portNumber}`);
	const hostname = '127.0.0.1';
	udp.udpServer(hostname, portNumber, function(connection, address, datagram) {
		// console.debug(`scUdpServer: ${datagram}`);
		const datagramText = new TextDecoder().decode(datagram);
		if(datagramText.trim().length > 0) {
			// console.debug(`scUdpServer: datagramText: '${datagramText}`);
			try {
				const message = JSON.parse(datagramText);
				// console.debug(`scUdpServer: recv: ${datagram}: ${message}`);
				switch(message.command) {
				case 'evalText': scEvalText(message.text); break;
				case 'evalFile': scEvalFile(message.fileName); break;
				case 'playText': scPlayText(message.text); break;
				case 'playFile': scPlayFile(message.fileName); break;
				default: console.warn(`scUdpServer: unknown command: ${message.command}`); break;
				}
			} catch (err) {
				console.error(`scUdpServer: message: '${datagramText}', err: ${err} -> ${err.cause}`);
			}
		}
	});
}

declare global {
	var osc: {};
}

async function scCmd(cmd: string, opt: flags.Args): Promise<void> {
	globalThis.osc = osc;
	await loadSpl(opt, ['StandardLibrary', 'SuperColliderLibrary']);
	switch(cmd) {
	case 'playFile': scPlayFile(<string>opt._[2]); break;
	case 'udpServer': scUdpServer(Number(opt._[2])); break;
	default: help(); break;
	}
}

function cli():void {
	const args = flags.parse(Deno.args, { boolean: true });
	if(args._.length < 1) {
		help();
	} else {
		if(args.strict) {
			slOptions.insertArityCheck = true;
			slOptions.uncheckedIndexing = false;
		}
		if(args.unsafe) {
			slOptions.insertArityCheck = false;
			slOptions.uncheckedIndexing = true;
		}
		// console.log('slOptions: ', slOptions);
		switch(args._[0]) {
		case 'replPerLine': replPerLine(args, args._.slice(1)); break;
		case 'rewriteFile': rewriteFile(<string>args._[1]); break;
		case 'runFile': runFile(<string>args._[1], args); break;
		case 'sc': scCmd(<string>args._[1], args); break;
		case 'help': help(); break;
		default: help(); break;
		}
	}
}

declare global {
	var sl: {};
}

globalThis.sl = sl;
globalThis.sc = sc;
cli();
