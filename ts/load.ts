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

// "package" is a reserved word, c.f. https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar
type Package = [string, string[]];

// Fetch files asynchronously, then evaluate in sequence.
export async function loadPackageSequence(packageArray: Package[]): Promise<void> {
	const sourceTextArray = [];
	const resolvedFileNameArray = [];
	packageArray.forEach(function(aPackage: Package) {
		const packageName = aPackage[0];
		aPackage[1].forEach(function(fileName: string) {
			const resolvedFileName = resolveFileName(fileName);
			resolvedFileNameArray.push(resolvedFileName);
			sourceTextArray.push(new evaluate.SourceText(packageName, fileName, null));
		});
	});
	const fetchedTextArray = await Promise.all(resolvedFileNameArray.map(function (resolvedFileName) {
		return fetch(resolvedFileName, { cache: 'no-cache' }).then(response => response.text());
	}));
	fetchedTextArray.map(function(text, index) {
		sourceTextArray[index].text = text;
	});
	await evaluate.evaluateSourceTextArrayInSequence(sourceTextArray);
}

export function addLoadUrlMethods(): void {
	addMethod('Array', 'Kernel', 'loadPackageSequence', 1, loadPackageSequence, '<primitive: loader>');
}

export async function loadUrl(fileName: string): Promise<void> {
	await evaluate.evaluateUrl(resolveFileName(fileName));
}
