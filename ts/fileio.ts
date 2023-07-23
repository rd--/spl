import * as evaluate from './evaluate.ts'
import * as kernel from './kernel.ts'
import * as load from './load.ts'
import * as rewrite from './rewrite.ts'

export async function evaluateFile(fileName: string) {
	// console.debug(`evaluateFile: ${fileName}`);
	return await Deno.readTextFile(fileName).then(evaluate.evaluateString);
}

export async function rewriteFile(fileName: string) {
	// console.debug(`rewriteFile: ${fileName}`);
	return await Deno.readTextFile(fileName).then(rewrite.rewriteString);
}

// Fetch files asynchronously, then evaluate in sequence.
export async function loadFileSequence(fileNameArray: string[]): Promise<void> {
	const resolvedFileNameArray = fileNameArray.map(load.resolveFileName);
	const fileTextArray = await Promise.all(resolvedFileNameArray.map(fileName => Deno.readTextFile(fileName)));
	await evaluate.evaluateStringArrayInSequence(fileTextArray);
}

export function addLoadFileMethods(): void {
	kernel.addMethod('Array', 'loadUrlSequence', 1, loadFileSequence, '<primitive>');
}
