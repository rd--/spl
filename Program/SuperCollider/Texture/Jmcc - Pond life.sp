/* Pond life ; Jmcc ; #1 */
{
	let f = MulAdd(
		SinOsc(20 + Rand(0, 30), 0),
		100 + Rand(0, 300),
		500 + LinRand(0, 2000, 0)
	);
	let e = LfPulse(3 / (1 + Rand(0, 8)), 0, 0.2 + Rand(0, 0.3));
	EqPan(
		SinOsc(f, 0) * e,
		Rand(-1, 1)
	) * 0.04
}.overlapTextureProgram(8, 8, 4)
