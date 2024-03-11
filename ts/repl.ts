import { TextLineStream } from 'https://deno.land/std/streams/text_line_stream.ts';

import * as evaluate from './evaluate.ts';

const stdinStream: ReadableStream = Deno.stdin.readable;

const lineStream: ReadableStream = stdinStream.pipeThrough(
	new TextDecoderStream(),
).pipeThrough(new TextLineStream());

const lineReader: ReadableStreamDefaultReader = lineStream.getReader();

export function interact<T>(
	processLine: (line: string) => T,
): Promise<void> {
	return lineReader.read().then(({ done, value }) => {
		if (done) {
			// console.debug('repl: end of input');
			return;
		}
		{
			// console.debug('repl: next line', value);
			processLine(value);
			return interact(processLine);
		}
	});
}

// Read and evaluate input per line.  Empty lines are not evaluated.
export async function perLine(verbose: boolean): Promise<void> {
	await interact(function (line: string) {
		const withoutBlanks = line.trim();
		if (withoutBlanks.length > 0) {
			if (verbose) {
				console.log(withoutBlanks);
			}
			const answer = evaluate.evaluateFor('Repl', withoutBlanks);
			const answerText = _printString_1(answer);
			console.log(answerText);
		}
	});
}
