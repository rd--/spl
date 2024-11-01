/* https://sccode.org/1-4Qy ; F0 ; 0293 */
{ :currentTime :a |
	let i = a[1];
	let b = Saw(i); /* C.f. LfSaw */
	let d = 1 / i;
	Release(
		EqPan(
			SinOscFb(
				Duty(d, 0, Dseq(1, a * 99 / 2)),
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
}.scheduleInjecting(4:12)
