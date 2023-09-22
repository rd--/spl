import * as evaluate from './evaluate.ts'
import * as kernel from './kernel.ts'

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

// Fetch files asynchronously, store at packageIndex
export async function readLocalPackages(qualifiedPackageNames: string[]): Promise<void> {
	const packageArray = await kernel.initializeLocalPackages(qualifiedPackageNames);
	const resolvedFileNameArray = [];
	packageArray.forEach(pkg => {
		const resolvedFileName = resolveFileName(pkg.url);
		resolvedFileNameArray.push(resolvedFileName);
	});
	const fetchedTextArray = await Promise.all(resolvedFileNameArray.map(function(fileName: string):Promise<string> {
		return fetch(fileName, { cache: 'no-cache' }).then(response => response.text());
	}));
	fetchedTextArray.map(function(text, index) {
		packageArray[index].text = text;
		packageArray[index].requires = kernel.parsePackageRequires(text);
	});
}

export function addLoadUrlMethods(): void {
	kernel.addMethod('Array', 'Kernel', 'readLocalPackages', 1, readLocalPackages, '<primitive: reader>');
	kernel.addMethod('Array', 'Kernel', 'loadPackageSequence', 1, kernel.loadPackageSequence, '<primitive: loader>');
}

export async function loadUrl(packageName: string, fileName: string): Promise<void> {
	await evaluate.evaluateUrlFor(packageName, resolveFileName(fileName));
}
