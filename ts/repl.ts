import { readLines } from "https://deno.land/std/io/buffer.ts";

import { evaluateString } from './eval.ts'

export async function interact<T>(processLine: (line: string) => T): Promise<void> {
	for await (const line of readLines(Deno.stdin)) {
		processLine(line);
	}
}

export async function perLine() {
	await interact((line: string) => console.log(evaluateString(line)));
}
