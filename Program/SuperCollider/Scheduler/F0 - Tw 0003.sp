/* https://sccode.org/1-4Qy ; F0 ; 0003 */
{ :nextDelay |
	let t = sinOsc(rand(99, 999), 0).abs;
	let o = formlet(
		tDuty(t, 0, t),
		linRand(0, 4000, 0),
		t,
		1 - t
	);
	release(
		[o o],
		0.02, nextDelay, 39
	)
}.playEvery {
	(1 -- 9).atRandom
}
