import { readLines } from "https://deno.land/std/io/buffer.ts";

import * as evaluate from './evaluate.ts'

export async function interact<T>(processLine: (line: string) => T): Promise<void> {
	for await (const line of readLines(Deno.stdin)) {
		processLine(line);
	}
}

export async function perLine(verbose: boolean) {
	await interact(function(line: string) {
		if(verbose) {
			console.log(line);
		}
		console.log(evaluate.evaluateFor('Repl', 'Interactive', line));
	});
}
