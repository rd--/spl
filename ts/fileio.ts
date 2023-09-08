import * as evaluate from './evaluate.ts'
import * as kernel from './kernel.ts'
import * as load from './load.ts'
import * as rewrite from './rewrite.ts'

export async function evaluateFile(fileName: string, packageName: string) {
	// console.debug(`evaluateFile: ${fileName} ${packageName}`);
	return await Deno.readTextFile(fileName).then(function(text) {
		return evaluate.evaluateFor(packageName, fileName, text);
	});
}

export async function rewriteFile(fileName: string) {
	// console.debug(`rewriteFile: ${fileName}`);
	return await Deno.readTextFile(fileName).then(rewrite.rewriteString);
}

// Fetch files asynchronously, then evaluate in sequence.
export async function loadFileSequence(fileNameArray: string[], packageName: string): Promise<void> {
	const resolvedFileNameArray = fileNameArray.map(load.resolveFileName);
	const fileTextArray = await Promise.all(resolvedFileNameArray.map(fileName => Deno.readTextFile(fileName)));
	const sourceTextArray = resolvedFileNameArray.map(function(fileName, index) {
		return new evaluate.SourceText(packageName, fileName, fileTextArray[index]);
	});
	await evaluate.evaluateSourceTextArrayInSequence(sourceTextArray);
}

export function addLoadFileMethods(): void {
	kernel.addMethod('Array', 'Kernel', 'loadUrlSequence', 2, loadFileSequence, '<primitive>');
}
