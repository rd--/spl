/* Tremulate (Jmcc) #1 */
{
	let amp = 0.max(LfNoise2([Rand(30, 90)] # 4) * 0.1);
	EqPan(
		SinOsc(Rand(500, 900) * [1.0 1.2 1.5 1.8], 0) * amp,
		{ Rand(-1, 1) } ! 4
	).sum.CombN(0.1, 0.1, 1)
}.xFadeTextureProgram(2, 0.5)
