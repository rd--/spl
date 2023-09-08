import * as rewrite from './rewrite.ts'

export function evaluateFor(packageName: string, fileName: string, text: string) {
	var errText = function(err, toEval) {
		return `evaluateFor: eval: ${err}: ${packageName}: ${fileName}: ${text}: ${toEval}`;
	};
	if(text.trim().length > 0) {
		try {
			rewrite.context.packageName = packageName;
			const toEval = rewrite.rewriteString(text);
			rewrite.context.packageName = 'UnknownPackage';
			if(toEval.trim().length > 0) {
				try {
					return eval(toEval);
				} catch(err) {
					return console.error(errText(err, toEval));
				}
			}
		} catch (err) {
			return console.error(errText(err, 'rewrite failed'));
		}
	}
	// console.debug('evaluateSourceText: empty?');
	return null;
}

export class SourceText {
	packageName: string;
	fileName: string;
	text: string;
	constructor(packageName: string, fileName: string, text: string) {
		this.packageName = packageName;
		this.fileName = fileName;
		this.text = text;
	}
}

export function evaluateSourceText(src: SourceText) {
	return evaluateFor(src.packageName, src.fileName, src.text);
}

export async function evaluateSourceTextArrayInSequence(srcArray: SourceText[]) {
	for(let src of srcArray) {
		await evaluateSourceText(src);
	}
}

/*
export async function evaluateUrl(url: string) {
	// console.debug(`evaluateUrl: ${url}`);
	await fetch(url, { cache: 'no-cache' }).then(response => response.text()).then(evaluateSourceText);
}
*/
