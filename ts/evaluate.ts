import * as rewrite from './rewrite.ts';

// True if the input string contains only blanks.
function onlyBlanks(text: string): boolean {
	return text.trim().length == 0;
}

// Evaluate for named context, signals error conditions.
export function evaluateForSignalling(
	packageName: string,
	slText: string,
): unknown {
	// console.debug(`evaluateForSignalling: ${packageName}, ${text}`);
	if (onlyBlanks(slText)) {
		throw new Error('Empty string');
	} else {
		const jsText = rewrite.rewriteStringFor(packageName, slText);
		if (onlyBlanks(jsText)) {
			throw new Error('Empty string after rewrite');
		} else {
			try {
				// console.debug(`eval: ${jsText}`);
				// <https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval#never_use_direct_eval!>
				return eval?.(`"use strict"; ${jsText}`);
			} catch (err) {
				throw new Error('Evaluation failed', { cause: err });
			}
		}
	}
}

// Evaluate for named context, traps error conditions and answers error values.
export function evaluateFor(packageName: string, slText: string): unknown {
	// console.debug(`evaluateFor: ${packageName}, ${slText}`);
	try {
		return evaluateForSignalling(packageName, slText);
	} catch (err) {
		console.error(
			`evaluateFor: ${packageName}: "${slText}": ${err.message}: ${err.cause}`,
		);
		return err;
	}
}

export async function evaluateUrlFor(
	packageName: string,
	url: string,
): Promise<void> {
	// console.debug(`evaluateUrlFor: ${packageName} ${url}`);
	await fetch(url, { cache: 'no-cache' }).then(function (response) {
		return response.text();
	}).then(function (text) {
		return evaluateFor(packageName, text);
	});
}
