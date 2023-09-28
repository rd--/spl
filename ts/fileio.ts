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
export async function primitiveReadLocalPackages(qualifiedPackageNames: string[]): Promise<void> {
	const packageArray = await kernel.initializeLocalPackages(qualifiedPackageNames);
	const resolvedFileNameArray: string[] = [];
	packageArray.forEach(pkg => {
		const resolvedFileName = load.resolveFileName(pkg.url);
		resolvedFileNameArray.push(resolvedFileName);
	});
	const fetchedTextArray = await Promise.all(resolvedFileNameArray.map(function(fileName: string) {
		return Deno.readTextFile(fileName);
	}));
	fetchedTextArray.map(function(text, index) {
		packageArray[index].text = text;
		packageArray[index].requires = kernel.parsePackageRequires(text);
	});
}

export function addLoadFileMethods(): void {
	kernel.addMethod('Array', 'Kernel', 'primitiveReadLocalPackages', 1, primitiveReadLocalPackages, '<primitive: package reader>');
	kernel.addMethod('Array', 'Kernel', 'primitiveLoadPackageSequence', 1, kernel.primitiveLoadPackageSequence, '<primitive: package loader>');
}
