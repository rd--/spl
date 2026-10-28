/* Tremulate (Jmcc) #1 */
{
	let amp = 0.max(lfNoise2([rand(30, 90)] # 4) * 0.1);
	eqPan(
		sinOsc(rand(500, 900) * [1.0 1.2 1.5 1.8], 0) * amp,
		{ rand(-1, 1) } ! 4
	).sum.combN(0.1, 0.1, 1)
}.xFadeTextureProgram(2, 0.5)
