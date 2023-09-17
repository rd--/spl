import * as kernel from './kernel.ts'
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
export async function loadLocalPackageSequence(localPackageArray: string[]): Promise<void> {
	const packageArray = [];
	const resolvedFileNameArray = [];
	localPackageArray.forEach(aPackageName => {
		const parts = aPackageName.split('-');
		const category = parts[0];
		const name = parts[1];
		const resolvedFileName = resolveFileName('Package/' + category + '/' + name + '.sl');
		const pkg = new evaluate.Package(category, name, [], null, null);
		kernel.system.packageDictionary.set(name, pkg);
		resolvedFileNameArray.push(resolvedFileName);
		packageArray.push(pkg);
	});
	const fetchedTextArray = await Promise.all(resolvedFileNameArray.map(function (resolvedFileName) {
		return fetch(resolvedFileName, { cache: 'no-cache' }).then(response => response.text());
	}));
	fetchedTextArray.map(function(text, index) {
		packageArray[index].text = text;
	});
	await evaluate.evaluatePackageArrayInSequence(packageArray);
}

export function addLoadUrlMethods(): void {
	kernel.addMethod('Array', 'Kernel', 'loadLocalPackageSequence', 1, loadLocalPackageSequence, '<primitive: loader>');
}

export async function loadUrl(fileName: string): Promise<void> {
	await evaluate.evaluateUrl(resolveFileName(fileName));
}
