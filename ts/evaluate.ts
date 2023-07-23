import { rewriteString } from './rewrite.ts'

export function evaluateString(slString: string) {
	if(slString.trim().length > 0) {
		// console.debug(`evaluateString: sl: ${slString}`);
		try {
			const jsString = rewriteString(slString);
			// console.debug(`evaluateString: js: ${jsString}`);
			if(jsString.trim().length > 0) {
				try {
					return eval(jsString);
				} catch(err) {
					return console.error(`evaluateString: eval: ${err}: ${slString}: ${jsString}`);
				}
			}
		} catch (err) {
			return console.error(`evaluateString: rewrite: ${err}: ${slString}`);
		}
	}
	// console.debug('evaluateString: empty?');
	return null;
}

export async function evaluateStringArrayInSequence(slStringArray: string[]) {
	for(let slString of slStringArray) {
		await evaluateString(slString);
	}
}

export async function evaluateUrl(url: string) {
	// console.debug(`evaluateUrl: ${url}`);
	await fetch(url, { cache: 'no-cache' }).then(response => response.text()).then(evaluateString);
}
