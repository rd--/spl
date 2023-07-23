import { addMethod } from './kernel.ts'
import * as evaluate from './evaluate.ts'

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
export async function loadUrlSequence(urlArray: string[]): Promise<void> {
	const resolvedUrlArray = urlArray.map(resolveFileName);
	const fetchedTextArray = await Promise.all(resolvedUrlArray.map(function (url) {
		return fetch(url, { cache: 'no-cache' }).then(response => response.text())
	}));
	await evaluate.evaluateStringArrayInSequence(fetchedTextArray);
}

export function addLoadUrlMethods(): void {
	addMethod('Array', 'loadUrlSequence', 1, loadUrlSequence, '<primitive: loader>');
}

export async function loadUrl(fileName: string): Promise<void> {
	await evaluate.evaluateUrl(resolveFileName(fileName));
}
