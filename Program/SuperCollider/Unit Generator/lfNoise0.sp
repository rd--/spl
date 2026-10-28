/* lfNoise0 */
sinOsc(lfNoise0(12) * 600 + 1000, 0) * 0.1

/* lfNoise0 */
combN(
	lpf(lfNoise0(mouseX(300, 2200, 0, 0.2) * [1, 1.1]) * lfPulse(1, 0, 0.3) * 0.1, 800).abs,
	0.2,
	[0.2, 0.17],
	5
)
