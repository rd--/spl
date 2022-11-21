import { existsSync } from "https://deno.land/std/fs/mod.ts"

import { consoleDebug } from '../lib/jssc3/ts/kernel/error.ts'

import { evaluateString } from './eval.ts'
import { addMethod } from './kernel.ts'
import { resolveFileName, setLoadPath } from './load.ts'
import { rewriteString } from './rewrite.ts'

export async function readTextFile(fileName: string): Promise<string> {
	consoleDebug(`readFile: ${fileName}`);
	if(fileName && existsSync(fileName)) {
		return await Deno.readTextFile(fileName);
	} else {
		console.error(`readFile: unknown file: ${fileName}`);
		return '';
	}
}

export async function evaluateFile(fileName: string) {
	consoleDebug(`evaluateFile: ${fileName}`);
	return await readTextFile(fileName).then(evaluateString);
}

export async function rewriteFile(fileName: string) {
	consoleDebug(`rewriteFile: ${fileName}`);
	return await readTextFile(fileName).then(rewriteString);
}

export async function loadFile(fileName: string) {
	await evaluateFile(resolveFileName(fileName))
}

export async function loadFileSequence(fileNameArray: string[]): Promise<void> {
	for(let fileName of fileNameArray) {
		await loadFile(fileName);
	}
}

export async function loadFileArrayInSequence(loadPath: string, fileNameArray: string[]): Promise<void> {
	setLoadPath(loadPath);
    for(let fileName of fileNameArray) {
        await loadFile(fileName);
    }
}

export function addLoadFileMethods(): void {
	addMethod('String', 'loadPath', 1, setLoadPath, '<primitive>');
	addMethod('String', 'loadFile', 1, loadFile, '<primitive>');
	addMethod('String', 'load', 1, loadFile, '<primitive>');
	addMethod('Array', 'loadFileSequence', 1, loadFileSequence, '<primitive>');
	addMethod('Array', 'loadSequence', 1, loadFileSequence, '<primitive>');
}
