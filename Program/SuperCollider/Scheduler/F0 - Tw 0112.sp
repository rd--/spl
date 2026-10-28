/* https://sccode.org/1-4Qy ; f0 ; 0112 */
let i = 0;
{ :nextDelay |
	let f = dseq(1, [0 .. 12] * (i % 63 + 99));
	let o = varSaw(
		duty(1 / 12, 0, f) * [1, 1.01],
		0,
		i / 9 % 9 / 9
	) / 9;
	i := i + 1;
	release(o, 0.02, 1, 0.02)
}.playEvery {
	1 / 3
}
