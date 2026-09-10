/* Random sine waves (Jmcc) #1 */
{
	EqPan(
		Release(FSinOsc(Rand(0, 2000), 0) * 0.02, 2, 5, 2),
		Rand(-1, 1)
	)
}.spawnTextureProgram(9 / 12)
