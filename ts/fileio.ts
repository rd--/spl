import * as evaluate from './evaluate.ts'
import * as kernel from './kernel.ts'
import * as load from './load.ts'
import * as rewrite from './rewrite.ts'

export async function evaluateFile(fileName: string, packageName: string) {
	// console.debug(`evaluateFile: ${fileName} ${packageName}`);
	return await Deno.readTextFile(fileName).then(function(text) {
		return evaluate.evaluateFor(packageName, text);
	});
}

export async function rewriteFile(fileName: string) {
	// console.debug(`rewriteFile: ${fileName}`);
	return await Deno.readTextFile(fileName).then(rewrite.rewriteString);
}

// Fetch files asynchronously, store at packageIndex
export async function readLocalPackages(qualifiedPackageNames: string[]): Promise<void> {
	const packageArray = await kernel.initializeLocalPackages(qualifiedPackageNames);
	const resolvedFileNameArray = [];
	packageArray.forEach(pkg => {
		const resolvedFileName = load.resolveFileName(pkg.url);
		resolvedFileNameArray.push(resolvedFileName);
	});
	const fetchedTextArray = await Promise.all(resolvedFileNameArray.map(fileName => Deno.readTextFile(fileName)));
	fetchedTextArray.map(function(text, index) {
		packageArray[index].text = text;
		packageArray[index].requires = kernel.parsePackageRequires(text);
	});
}

export function addLoadFileMethods(): void {
	kernel.addMethod('Array', 'Kernel', 'readLocalPackages', 1, readLocalPackages, '<primitive: reader>');
	kernel.addMethod('Array', 'Kernel', 'loadPackageSequence', 1, kernel.loadPackageSequence, '<primitive: loader>');
}
