import { fetch_utf8 } from '../lib/jssc3/ts/kernel/io.ts'

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

// Fetch files asynchronously, then evaluate in sequence.
export async function loadUrlSequence(fileNameArray: string[]): Promise<void> {
	const resolvedFileNameArray = fileNameArray.map(resolveFileName);
	const fetchedTextArray = await Promise.all(resolvedFileNameArray.map(fetch_utf8));
	fetchedTextArray.forEach(evaluateString);
}

export function addLoadUrlMethods(): void {
	addMethod('Array', 'loadUrlSequence', 1, loadUrlSequence, '<primitive: loader>');
}

export async function loadUrl(fileName: string): Promise<void> {
	await evaluateUrl(resolveFileName(fileName));
}

export async function loadUrlArrayInSequence(urlArray: string[]): Promise<void> {
	for(let url of urlArray) {
		await loadUrl(url);
	}
}

/*


	addMethod('String', 'loadPath', 1, setLoadPath, '<primitive: loader>');
	addMethod('String', 'loadUrl', 1, loadUrl, '<primitive: loader>');
	addMethod('String', 'load', 1, loadUrl, '<primitive: loader>');
	addMethod('Array', 'loadSequence', 1, loadUrlSequence, '<primitive: loader>');

*/
