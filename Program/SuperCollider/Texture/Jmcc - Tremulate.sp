/* Tremulate (Jmcc) #1 */
{
	let amp = 0.Max(LfNoise2(4 # [Rand(30, 90)]) * 0.1);
	EqPan(
		SinOsc(Rand(500, 900) * [1.0 1.2 1.5 1.8], 0) * amp,
		{ 1.Rand2 } ! 4
	).Sum.CombN(0.1, 0.1, 1)
}.xFadeTextureProgram(2, 0.5)
