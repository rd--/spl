import * as evaluate from './evaluate.ts';
import * as kernel from './kernel.ts';

export const loader: { splDir: string } = {
	splDir: '',
};

export function setSplDir(directoryName: string): void {
	loader.splDir = directoryName;
}

// Resolve non-absolute file names against loader.splDir.
export function resolveFileName(fileName: string): string {
	const resolvedFileName = fileName[0] === '/'
		? fileName
		: `${loader.splDir}/${fileName}`;
	console.log(`resolveFileName: ${resolvedFileName}`);
	return resolvedFileName;
}

export function packageFileName(pkg: kernel.Package): string {
	return pkg.preCompiled
		? ('.cache/' + pkg.name + '.js')
		: ('Package/' + pkg.url);
}

export function primitiveReadLocalBinaryFile(
	fileName: string,
): Promise<Uint8Array> {
	const resolvedFileName = resolveFileName(fileName);
	return fetch(resolvedFileName).then(
		function (response) {
			return response.arrayBuffer().then(
				function (arrayBuffer) {
					return new Uint8Array(arrayBuffer);
				},
			);
		},
	);
}

export function primitiveReadLocalTextFileArray(
	fileNameArray: string[],
): Promise<string[]> {
	const resolvedFileNameArray: string[] = [];
	fileNameArray.forEach(function (fileName: string) {
		resolvedFileNameArray.push(resolveFileName(fileName));
	});
	return Promise.all(
		resolvedFileNameArray.map(function (fileName: string): Promise<string> {
			return fetch(fileName, { cache: 'no-cache' }).then((response) =>
				response.text()
			);
		}),
	);
}

// Fetch files asynchronously, store at packageIndex
export async function primitiveReadLocalPackages(
	qualifiedPackageNames: string[],
): Promise<void> {
	const packageArray = await kernel.initializeLocalPackages(
		qualifiedPackageNames,
	);
	const fileNameArray: string[] = [];
	packageArray.forEach(function (pkg: kernel.Package) {
		// console.debug('primitiveReadLocalPackages', pkg.url);
		return fileNameArray.push(packageFileName(pkg));
	});
	const fetchedTextArray = await primitiveReadLocalTextFileArray(fileNameArray);
	fetchedTextArray.map(function (text, index) {
		packageArray[index].text = text;
		packageArray[index].requires = kernel.parsePackageRequires(text);
	});
}

export function addLoadUrlMethods(): void {
	kernel.addMethodToExistingType(
		'List',
		'Kernel',
		'primitiveReadLocalPackages',
		['self'],
		primitiveReadLocalPackages,
		'<primitive: package reader>',
	);
	kernel.addMethodToExistingType(
		'List',
		'Kernel',
		'primitiveLoadPackageSequence',
		['self'],
		kernel.primitiveLoadPackageSequence,
		'<primitive: package loader>',
	);
	kernel.addMethodToExistingType(
		'String',
		'Kernel',
		'primitiveReadLocalBinaryFile',
		['self'],
		primitiveReadLocalBinaryFile,
		'<primitive: file reader>',
	);
}

export async function loadUrl(
	packageName: string,
	fileName: string,
): Promise<void> {
	await evaluate.evaluateUrlFor(packageName, resolveFileName(fileName));
}
