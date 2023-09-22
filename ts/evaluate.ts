import * as rewrite from './rewrite.ts'

export function evaluateFor(packageName: string, text: string): void {
	// console.debug(`evaluateFor: ${packageName}, ${text}`);
	var errText = function(err: Error, toEval: string) {
		return `evaluateFor: eval: ${err}: ${packageName}: ${text}: ${toEval}`;
	};
	if(text.trim().length > 0) {
		try {
			rewrite.context.packageName = packageName;
			const toEval = rewrite.rewriteString(text);
			rewrite.context.packageName = '*UnknownPackage*';
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
	// console.debug('evaluateFor: empty?');
}

export async function evaluateUrlFor(packageName: string, url: string): Promise<void> {
	// console.debug(`evaluateUrlFor: ${packageName} ${url}`);
	await fetch(url, { cache: 'no-cache' }).then(response => response.text()).then(text => evaluateFor(packageName, text));
}
