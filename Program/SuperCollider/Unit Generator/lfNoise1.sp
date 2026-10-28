/* lfNoise1 */
[1 .. 5].collect { :n |
	eqPan2(
		sinOsc(n * 100, 0) * (lfNoise1(6) + line(1, -1, 30)).max(0),
		rand(-1, 1)
	)
}.mix * 0.025

/* lfNoise1 */
let freq = linLin(lfNoise1(1), -1, 1, 220, 440);
sinOsc(freq, 0) * 0.1
