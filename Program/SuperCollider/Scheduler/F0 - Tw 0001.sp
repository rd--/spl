/* https://sccode.org/1-4Qy ; F0 ; 0001 */
let i = 0;
{ :nextDelay |
	let p = sinOsc((i % 9) // 3 * 100 + (i % 9) + 500, 0);
	let o = release(
		pan2(sinOsc(i + 1, p) * 0.03, rand(-1, 1), 1),
		0, 2, 25
	);
	i := i + 1;
	o
}.playEvery {
	2
}
