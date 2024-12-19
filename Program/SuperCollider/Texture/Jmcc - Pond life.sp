/* Pond life ; Jmcc ; #1 */
{
	let f = MulAdd(
		SinOsc(20 + 30.Rand0, 0),
		100 + 300.Rand0,
		500 + LinRand(0, 2000, 0)
	);
	let e = LfPulse(3 / (1 + 8.Rand0), 0, 0.2 + 0.3.Rand0);
	EqPan(
		SinOsc(f, 0) * e,
		1.Rand2
	) * 0.04
}.overlapTextureProgram(8, 8, 4)
