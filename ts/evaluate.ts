import { packageName, rewriteString } from './rewrite.ts'

export type SourceText = {
  origin: string;
  text: string;
};

export function evaluateSourceText(src: SourceText) {
	var slString = src.text;
	if(slString.trim().length > 0) {
		// console.debug(`evaluateSourceText: sl: ${slString}`);
		try {
			packageName = src.origin;
			const jsString = rewriteString(slString);
			packageName = 'UnknownPackage';
			if(jsString.trim().length > 0) {
				try {
					return eval(jsString);
				} catch(err) {
					return console.error(`evaluateSourceText: eval: ${err}: ${slString}: ${jsString}`);
				}
			}
		} catch (err) {
			return console.error(`evaluateSourceText: rewrite: ${err}: ${slString}`);
		}
	}
	// console.debug('evaluateSourceText: empty?');
	return null;
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
