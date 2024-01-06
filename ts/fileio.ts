import * as evaluate from './evaluate.ts';
import * as host from './host.ts';
import * as kernel from './kernel.ts';
import * as load from './load.ts';
import * as rewrite from './rewrite.ts';

export async function evaluateFile(fileName: string, packageName: string) {
	// console.debug(`evaluateFile: ${fileName} ${packageName}`);
	return await host.readTextFile(fileName).then(function (text) {
		return evaluate.evaluateFor(packageName, text);
	});
}

export async function rewriteFile(fileName: string): Promise<string> {
	// console.debug(`rewriteFile: ${fileName}`);
	return await host.readTextFile(fileName).then(rewrite.rewriteString);
}

// Fetch files asynchronously, store at packageIndex
export function primitiveReadLocalFile(fileName: string): Promise<Uint8Array> {
	const resolvedFileName = load.resolveFileName(fileName);
	return host.readFile(fileName);
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
		const resolvedFileName = load.resolveFileName(pkg.url);
		resolvedFileNameArray.push(resolvedFileName);
	});
	const fetchedTextArray = await Promise.all(
		resolvedFileNameArray.map(function (fileName: string) {
			return host.readTextFile(fileName);
		}),
	);
	fetchedTextArray.map(function (text, index) {
		packageArray[index].text = text;
		packageArray[index].requires = kernel.parsePackageRequires(text);
	});
}

export function addLoadFileMethods(): void {
	kernel.addMethod(
		'Array',
		'Kernel',
		'primitiveReadLocalPackages',
		['self'],
		primitiveReadLocalPackages,
		'<primitive: package reader>',
	);
	kernel.addMethod(
		'Array',
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
