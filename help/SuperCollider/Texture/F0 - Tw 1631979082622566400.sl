/* https://twitter.com/redFrik/status/1631979082622566400 ; F0 */
{ :t :i |
	let e = [0 3.084 5.028 6.972 10.056 0 3.084 5.028 6.972 10.056];
	let j = e.atWrap(i - (i // 11) + 1);
	let m = (i // 60 % 2 * -2 + j + 70 - (i // 12 + 1 % 2 * 12));
	let f = m.MidiCps + [0, 2 / 3];
	let d = i // 12 % 3 >> 1;
	let c = (60.MidiCps / f) ^ (1 / 3);
	let n = (d + [1, 1 / 30]).atWrap(i + 1);
	let a = f * 1.5 ^ SinOsc(
		i % 2 * i // [3, 4] % 7 % 6 / 4 * 3 / (1 + d),
		[i, i * 2]
	);
	Release(
		SinOsc(
			SinOsc(f, 0) * a + f,
			0
		) * XLine(0.1, 0.0001, 4 + d) * c,
		0,
		4 + d,
		0
	).playAt(t + 0.5);
	[n, i + 1]
}.scheduleInjecting(0)
