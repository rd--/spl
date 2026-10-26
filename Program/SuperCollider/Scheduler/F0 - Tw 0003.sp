/* https://sccode.org/1-4Qy ; F0 ; 0003 */
{ :nextDelay |
	let t = SinOsc(Rand(99, 999), 0).abs;
	let o = Formlet(
		TDuty(t, 0, t),
		LinRand(0, 4000, 0),
		t,
		1 - t
	);
	Release(
		[o o],
		0.02, nextDelay, 39
	)
}.playEvery {
	(1 -- 9).atRandom
}
