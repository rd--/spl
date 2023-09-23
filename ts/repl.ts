import { readLines } from "https://deno.land/std/io/buffer.ts";

import * as evaluate from './evaluate.ts'

export async function interact<T>(processLine: (line: string) => T): Promise<void> {
	for await (const line of readLines(Deno.stdin)) {
		processLine(line);
	}
}

// Read and evaluate input per line.  Empty lines are not evaluated.
export async function perLine(verbose: boolean): Promise<void> {
	await interact(function(line: string) {
		const withoutBlanks = line.trim();
		if(withoutBlanks.length > 0) {
			if(verbose) {
				console.log(withoutBlanks);
			}
			const answer = evaluate.evaluateFor('Repl', withoutBlanks);
			console.log(answer);
		}
	});
}
