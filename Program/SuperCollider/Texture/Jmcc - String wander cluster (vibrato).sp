/* String wander-cluster (Jmcc) #6 ; with vibrato */
{
	let note1 = IRand(50, 100);
	let note2 = (note1 + IRand(0, 15) - 7).fold(50, 120);
	let freq = note2.midiCps;
	let decayTime = 1 / freq * 1000;
	let freq2 = SinOsc(Rand(4, 8), 0) * (0.01 * freq) + freq;
	let delay = 1 / freq2;
	EqPan(CombC(WhiteNoise() * 0.008, 0.01, delay, decayTime), Rand(-1, 1))
}.overlapTextureProgram(4 / 3, 4 / 3, 6)
