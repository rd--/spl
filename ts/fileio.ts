import * as evaluate from './evaluate.ts';
import * as host from './host.ts';
import * as kernel from './kernel.ts';
import * as load from './load.ts';
import * as rewrite from './rewrite.ts';

export function evaluateFile(
	fileName: string,
	packageName: string,
): Promise<unknown> {
	// console.debug(`evaluateFile: ${fileName} ${packageName}`);
	return host.readTextFile(fileName).then(function (text) {
		return evaluate.evaluateFor(packageName, text);
	});
}

export function rewriteFile(fileName: string): Promise<string> {
	// console.debug(`rewriteFile: ${fileName}`);
	return host.readTextFile(fileName).then(rewrite.rewriteString);
}

export function primitiveReadLocalFile(fileName: string): Promise<Uint8Array> {
	const resolvedFileName = load.resolveFileName(fileName);
	// console.debug('primitiveReadLocalFile', fileName, resolvedFileName);
	return host.readFile(resolvedFileName);
}

// Fetch files asynchronously, store at packageIndex
export async function primitiveReadLocalPackages(
	qualifiedPackageNames: string[],
): Promise<void> {
	const packageArray = await kernel.initializeLocalPackages(
		qualifiedPackageNames,
	);
	const resolvedFileNameArray: string[] = [];
	packageArray.forEach((pkg) => {
		const resolvedFileName = load.resolveFileName(load.packageFileName(pkg));
		resolvedFileNameArray.push(resolvedFileName);
	});
	const fetchedTextArray = await Promise.all(
		resolvedFileNameArray.map(function (fileName: string) {
			return host.readTextFile(fileName);
		}),
	);
	fetchedTextArray.map(function (text, index) {
		packageArray[index].text = text;
		packageArray[index].requires = kernel.parsePackageRequires(text); // Note: will be empty for pre-compiled
	});
}

export function addLoadFileMethods(): void {
	kernel.addMethod(
		'List',
		'Kernel',
		'primitiveReadLocalPackages',
		['self'],
		primitiveReadLocalPackages,
		'<primitive: package reader>',
	);
	kernel.addMethod(
		'List',
		'Kernel',
		'primitiveLoadPackageSequence',
		['self'],
		kernel.primitiveLoadPackageSequence,
		'<primitive: package loader>',
	);
	kernel.addMethod(
		'String',
		'Kernel',
		'primitiveReadLocalFile',
		['self'],
		primitiveReadLocalFile,
		'<primitive: file reader>',
	);
}
