import { consoleDebug } from '../lib/jssc3/ts/kernel/error.ts'
import { load_utf8 } from '../lib/jssc3/ts/kernel/io.ts'

import { rewriteString } from './rewrite.ts'

export function evaluateString(slStr: string) {
	if(slStr.trim().length > 0) {
		consoleDebug(`evaluateString: sl: ${slStr}`);
		try {
			const jsStr = rewriteString(slStr);
			consoleDebug(`evaluateString: js: ${jsStr}`);
			if(jsStr.trim().length > 0) {
				try {
					return eval(jsStr);
				} catch(err) {
					return console.error(`evaluateString: eval: ${err}: ${slStr}: ${jsStr}`);
				}
			}
		} catch (err) {
			return console.error(`evaluateString: rewrite: ${err}: ${slStr}`);
		}
	}
	consoleDebug('evaluateString: empty?');
	return null;
}

export async function evaluateUrl(urlString: string) {
	consoleDebug(`evaluateUrl: ${urlString}`);
	await load_utf8(urlString).then(evaluateString);
}
