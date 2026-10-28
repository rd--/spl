/* String wander-cluster (Jmcc) #6 */
{
	let note1 = 50 + iRand(0, 50);
	let note2 = (note1 + iRand(0, 15) - 7).fold(50, 120);
	let delay = 1 / note2.midiCps;
	eqPan(
		combC(
			whiteNoise() * 0.008, 0.01,
			delay,
			delay * 1000
		),
		rand(-1, 1)
	)
}.overlapTextureProgram(4 / 3, 4 / 3, 6)
