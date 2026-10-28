/* Random sine waves (Jmcc) #1 */
{
	eqPan(
		release(fSinOsc(rand(0, 2000), 0) * 0.02, 2, 5, 2),
		rand(-1, 1)
	)
}.spawnTextureProgram { 9 / 12 }
