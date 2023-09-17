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

// Fetch files asynchronously, then evaluate in sequence.
export async function loadLocalPackageSequence(localPackageArray: string[]): Promise<void> {
	const packageArray = [];
	const resolvedFileNameArray = [];
	localPackageArray.forEach(aPackageName => {
		const parts = aPackageName.split('-');
		const category = parts[0];
		const name = parts[1];
		const resolvedFileName = load.resolveFileName('Package/' + category + '/' + name + '.sl');
		const pkg = new evaluate.Package(category, name, [], null, null);
		kernel.system.packageDictionary.set(name, pkg);
		resolvedFileNameArray.push(resolvedFileName);
		packageArray.push(pkg);
	});
	const fetchedTextArray = await Promise.all(resolvedFileNameArray.map(fileName => Deno.readTextFile(fileName)));
	fetchedTextArray.map(function(text, index) {
		packageArray[index].text = text;
	});
	await evaluate.evaluatePackageArrayInSequence(packageArray);
}

export function addLoadFileMethods(): void {
	kernel.addMethod('Array', 'Kernel', 'loadLocalPackageSequence', 1, loadLocalPackageSequence, '<primitive>');
}
