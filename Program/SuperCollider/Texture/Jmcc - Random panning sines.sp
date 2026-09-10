/* Random panning sines (Jmcc) #4 */
{
	let n = 8;
	{
		EqPan(
			SinOsc(80 + LinRand(0, 2000, 0), 0),
			LfNoise1(0.4 + Rand(0, 0.8))
		) * LfNoise1(0.4 + Rand(0, 0.8)).MulAdd(0.4, 0.5)
	} !+ n * 0.4 / n
}.xFadeTextureProgram(8, 8)
