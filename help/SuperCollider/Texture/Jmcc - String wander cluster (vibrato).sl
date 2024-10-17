/* String wander-cluster (Jmcc) #6 ; with vibrato */
{
	let note1 = IRand(50, 100);
	let note2 = Fold(note1 + 15.IRand0 - 7, 50, 120);
	let freq = note2.MidiCps;
	let decayTime = 1 / freq * 1000;
	let freq2 = SinOsc(Rand(4, 8), 0) * (0.01 * freq) + freq;
	let delay = 1 / freq2;
	EqPan(CombC(WhiteNoise() * 0.008, 0.01, delay, decayTime), Rand(-1, 1))
}.overlap(4 / 3, 4 / 3, 6)
