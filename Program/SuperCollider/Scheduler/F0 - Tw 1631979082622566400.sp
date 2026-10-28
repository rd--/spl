/* https://twitter.com/redFrik/status/1631979082622566400 ; F0 */
{ :currentTime :i |
	let e = [0 3.084 5.028 6.972 10.056 0 3.084 5.028 6.972 10.056];
	let j = e.atWrap(i - (i // 11) + 1);
	let m = (i // 60 % 2 * -2 + j + 70 - (i // 12 + 1 % 2 * 12));
	let f = m.midiCps + [0, 2 / 3];
	let d = i // 12 % 3 >> 1;
	let c = (60.midiCps / f) ^ (1 / 3);
	let a = f * 1.5 ^ sinOsc(
		i % 2 * i // [3, 4] % 7 % 6 / 4 * 3 / (1 + d),
		[i, i * 2]
	);
	release(
		sinOsc(
			sinOsc(f, 0) * a + f,
			0
		) * xLine(0.1, 0.0001, 4 + d) * c,
		0.02, 4 + d, 0
	).playAt(currentTime);
	[
		(d + [1, 1 / 30]).atWrap(i + 1),
		i + 1
	]
}.scheduleInjecting(0)
