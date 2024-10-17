/* Random panning sines (Jmcc) #4 */
{
	let n = 8;
	{
		EqPan(
			SinOsc(80 + LinRand(0, 2000, 0), 0),
			LfNoise1(0.4 + 0.8.Rand0)
		) * LfNoise1(0.4 + 0.8.Rand0).MulAdd(0.4, 0.5)
	} !+ n * 0.4 / n
}.xfade(8, 8)
