import * as rewrite from './rewrite.ts'

// True if the input string contains only blanks.
function onlyBlanks(text: string): boolean {
	return text.trim().length == 0;
}

// Evaluate for named context, signals error conditions.
export function evaluateForSignalling(packageName: string, text: string): unknown {
	// console.debug(`evaluateForSignalling: ${packageName}, ${text}`);
	if(onlyBlanks(text)) {
		throw new Error('Empty string');
	} else {
		let toEval: string;
		rewrite.context.packageName = packageName;
		try {
			toEval = rewrite.rewriteString(text);
		} catch(err) {
			rewrite.context.packageName = '*UnknownPackage*';
			throw new Error('Rewrite failed', { cause: err });
		}
		rewrite.context.packageName = '*UnknownPackage*';
		if(onlyBlanks(toEval)) {
			throw new Error('Empty string after rewrite');
		} else {
			try {
				// console.debug(`eval: ${toEval}`);
				return eval(toEval);
			} catch(err) {
				throw new Error('Evaluation failed', { cause: err });
			}
		}
	}
}

// Evaluate for named context, traps error conditions and answers error values.
export function evaluateFor(packageName: string, text: string): unknown {
	// console.debug(`evaluateFor: ${packageName}, ${text}`);
	try {
		return evaluateForSignalling(packageName, text);
	} catch(err) {
		console.error(`evaluateFor: ${packageName}: "${text}": ${err.message}: ${err.cause}`);
		return err;
	}
}

export async function evaluateUrlFor(packageName: string, url: string): Promise<void> {
	// console.debug(`evaluateUrlFor: ${packageName} ${url}`);
	await fetch(url, { cache: 'no-cache' }).then(function(response) {
		return response.text();
	}).then(function(text) {
		return evaluateFor(packageName, text);
	});
}
