/* https://sccode.org/1-4Qy ; F0 ; 0293 */
{ :currentTime :a |
	let i = a[1];
	let b = saw(i); /* C.f. lfSaw */
	let d = 1 / i;
	release(
		eqPan(
			sinOscFb(
				duty(d, 0, dseq(1, a * 99 / 2)),
				b
			),
			b
		) / 5,
		0.02, 8, 0.02
	).playAt(currentTime);
	[
		2,
		a + 3 / d % 9
	]
}.scheduleInjecting([4 .. 12])
