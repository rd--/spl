/* String wander-cluster (Jmcc) #6 */
{
	let note1 = 50 + IRand(0, 50);
	let note2 = Fold(note1 + IRand(0, 15) - 7, 50, 120);
	let delay = 1 / note2.MidiCps;
	EqPan(
		CombC(
			WhiteNoise() * 0.008, 0.01,
			delay,
			delay * 1000
		),
		Rand(-1, 1)
	)
}.overlapTextureProgram(4 / 3, 4 / 3, 6)
