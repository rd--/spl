/* Random sine waves (Jmcc) #1 */
{
	EqPan(
		Release(FSinOsc(2000.Rand0, 0), 2, 5, 2),
		1.Rand2
	) * 0.02
}.playEvery(9 / 12)
