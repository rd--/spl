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

// "package" is a reserved word, c.f. https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar
type Package = [string, string[]];

// Fetch files asynchronously, then evaluate in sequence.
export async function loadPackageSequence(packageArray: Package[]): Promise<void> {
	const sourceTextArray = [];
	const resolvedFileNameArray = [];
	packageArray.forEach(aPackage => {
		const packageName = aPackage[0];
		aPackage[1].forEach(fileName => {
			const resolvedFileName = load.resolveFileName(fileName);
			resolvedFileNameArray.push(resolvedFileName);
			sourceTextArray.push(new evaluate.SourceText(packageName, fileName, null));
		});
	});
	const fetchedTextArray = await Promise.all(resolvedFileNameArray.map(fileName => Deno.readTextFile(fileName)));
	fetchedTextArray.map(function(text, index) {
		sourceTextArray[index].text = text;
	});
	await evaluate.evaluateSourceTextArrayInSequence(sourceTextArray);
}

export function addLoadFileMethods(): void {
	kernel.addMethod('Array', 'Kernel', 'loadPackageSequence', 1, loadPackageSequence, '<primitive>');
}
