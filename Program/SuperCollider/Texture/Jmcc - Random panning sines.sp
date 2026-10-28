/* Random panning sines (Jmcc) #4 */
{
	let n = 8;
	{
		eqPan(
			sinOsc(80 + linRand(0, 2000, 0), 0),
			lfNoise1(0.4 + rand(0, 0.8))
		) * lfNoise1(0.4 + rand(0, 0.8)).*+(0.4, 0.5)
	} !+ n * 0.4 / n
}.xFadeTextureProgram(8, 8)
