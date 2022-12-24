import * as flags from 'https://deno.land/std/flags/mod.ts'

import { osc } from '../lib/osc.js/src/osc.js'

import * as udp from '../lib/jssc3/ts/kernel/udp.ts'
import * as scUdp from '../lib/jssc3/ts/sc3/scsynth-udp.ts'

import * as sc from '../lib/jssc3/ts/sc3.ts'

import * as ev from './eval.ts'
import * as io from './fileio.ts'
import * as sl from './sl.ts'
import * as ld from './load.ts'
import * as rw from './rewrite.ts'
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
	console.log(`  SPL_DIR=${getSplDir()}`);
}

async function rewriteFile(fileName: string): Promise<void> {
	console.log(await io.rewriteFile(fileName));
}

declare global {
	var sc: Record<string, unknown>;
	var globalScsynth: sc.Scsynth;
	var playUgen: (aUgen: sc.Signal) => void;
}

const cliScynth = scUdp.scsynthUdp(scUdp.defaultScsynthUdp);

async function loadSpl(opt: flags.Args, lib: string[]): Promise<void> {
	const loadPath = opt.dir || getSplDir() || './';
	console.log(`loadSpl: opt.dir=${opt.dir}, getSplDir=${getSplDir()}, loadPath=${loadPath}`);
	io.addLoadFileMethods();
	sl.assignGlobals();
	await io.loadFileArrayInSequence(loadPath, ['kernel.sl', 'std.sl'].concat(lib));
	if(opt.sc) {
		globalThis.sc = sc;
		globalThis.globalScsynth = cliScynth;
		globalThis.playUgen = (ugenGraph) => sc.playUgen(globalThis.globalScsynth, ugenGraph, 1);
	}
}

async function replPerLine(opt: flags.Args, lib: string[]): Promise<void> {
	await loadSpl(opt, lib);
	repl.perLine();
}

async function runFile(fileName: string, opt: flags.Args): Promise<void> {
	await loadSpl(opt);
	console.log(await io.evaluateFile(fileName))
}

function scEvalText(splText: string): void {
	ev.evaluateString(splText);
}

async function scEvalFile(fileName: string): Promise<void> {
	const splText = await io.readTextFile(fileName);
	scEvalText(splText);
}

function scPlayText(splText: string): void {
	const ugenGraph = ev.evaluateString(splText);
	sc.playUgen(cliScynth, ugenGraph, 1);
}

async function scPlayFile(fileName: string): Promise<void> {
	const splText = await io.readTextFile(fileName);
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
				console.error(`scUdpServer: message: '${datagramText}', err: ${err}`);
			}
		}
	});
}

declare global {
	var osc: {};
}

async function scCmd(cmd: string, opt: flags.Args): Promise<void> {
	opt.sc = true; // don't require --sc option for sc commands...
	globalThis.osc = osc;
	await loadSpl(opt);
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
cli();
