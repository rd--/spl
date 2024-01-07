import * as evaluate from './evaluate.ts';
import * as kernel from './kernel.ts';

export const loader: { loadPath: string } = {
	loadPath: '',
};

export function setLoadPath(directoryName: string): void {
	loader.loadPath = directoryName;
}

// Resolve non-absolute file names against loader.loadPath.
export function resolveFileName(fileName: string): string {
	const resolvedFileName = fileName[0] === '/'
		? fileName
		: `${loader.loadPath}/${fileName}`;
	console.log(`resolveFileName: ${resolvedFileName}`);
	return resolvedFileName;
}

export function preCompiledFileName(fileName: string, preCompiled: boolean): string {
	return preCompiled ? (fileName + '.js') : fileName;
}

export function primitiveReadLocalFile(fileName: string): Promise<Uint8Array> {
	const resolvedFileName = resolveFileName(fileName);
	return fetch(resolvedFileName).then(function (response) {
		return response.arrayBuffer().then(function (arrayBuffer) {
			return new Uint8Array(arrayBuffer);
		});
	});
}

// Fetch files asynchronously, store at packageIndex
export async function primitiveReadLocalPackages(
	qualifiedPackageNames: string[],
	preCompiled: boolean
): Promise<void> {
	const packageArray = await kernel.initializeLocalPackages(
		qualifiedPackageNames,
	);
	const resolvedFileNameArray: string[] = [];
	packageArray.forEach(function (pkg: kernel.Package) {
		// console.debug('primitiveReadLocalPackages', pkg.url);
		const resolvedFileName = resolveFileName(pkg.url);
		pkg.preCompiled = preCompiled;
		return resolvedFileNameArray.push(
			preCompiledFileName(resolvedFileName, preCompiled)
		);
	});
	const fetchedTextArray = await Promise.all(
		resolvedFileNameArray.map(function (fileName: string): Promise<string> {
			return fetch(fileName, { cache: 'no-cache' }).then((response) =>
				response.text()
			);
		}),
	);
	fetchedTextArray.map(function (text, index) {
		packageArray[index].text = text;
		packageArray[index].requires = kernel.parsePackageRequires(text);
	});
}

export function addLoadUrlMethods(): void {
	kernel.addMethod(
		'Array',
		'Kernel',
		'primitiveReadLocalPackages',
		['self', 'preCompiled'],
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

export async function loadUrl(
	packageName: string,
	fileName: string,
): Promise<void> {
	await evaluate.evaluateUrlFor(packageName, resolveFileName(fileName));
}
