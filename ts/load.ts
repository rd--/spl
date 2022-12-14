import { load_utf8 } from '../lib/jssc3/ts/kernel/io.ts'

import { addMethod } from './kernel.ts'
import { evaluateString, evaluateUrl } from './eval.ts'

export const loader: { loadPath: string } = {
	loadPath: ''
};

export function setLoadPath(directoryName: string): void {
	loader.loadPath = directoryName;
}

export function resolveFileName(fileName: string): string {
	const resolvedName = fileName[0] === '/' ? fileName : `${loader.loadPath}/${fileName}`;
	console.log(`resolveFileName: ${resolvedName}`);
	return resolvedName;
}

export async function loadUrl(fileName: string): Promise<void> {
	await evaluateUrl(resolveFileName(fileName));
}

// Fetch files asynchronously, then evaluate in sequence.
export async function loadUrlSequence(fileNameArray: string[]): Promise<void> {
	const resolvedFileNameArray = fileNameArray.map(resolveFileName);
    const fetchedTextArray = await Promise.all(resolvedFileNameArray.map(load_utf8));
    fetchedTextArray.forEach(evaluateString);
}

export async function loadUrlArrayInSequence(loadPath: string, urlArray: string[]): Promise<void> {
	setLoadPath(loadPath);
	for(let url of urlArray) {
		await loadUrl(url);
	}
}

export function addLoadUrlMethods(): void {
	addMethod('String', 'loadPath', 1, setLoadPath, '<primitive>');
	addMethod('String', 'loadUrl', 1, loadUrl, '<primitive>');
	addMethod('String', 'load', 1, loadUrl, '<primitive>');
	addMethod('Array', 'loadUrlSequence', 1, loadUrlSequence, '<primitive>');
	addMethod('Array', 'loadSequence', 1, loadUrlSequence, '<primitive>');
}
