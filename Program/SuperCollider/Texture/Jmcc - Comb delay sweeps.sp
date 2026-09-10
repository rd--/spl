/* Comb delay sweeps (Jmcc) #6 */
{
	let dur = 4;
	let note1 = 50 + Rand(0, 70);
	let endNote1 = (note1 + Rand(0, 15) - 7).Fold(50, 120);
	let note2 = (note1 + Rand(0, 15) - 7).Fold(50, 120);
	let endNote2 = (endNote1 + Rand(0, 15) - 7).Fold(50, 120);
	let noteSweep = Line(note2, endNote2, dur);
	let dt = 1 / noteSweep.MidiCps;
	let dc = 1 / note2.MidiCps * 1000;
	EqPan(CombC(WhiteNoise() * 0.005, 0.01, dt, dc), Rand(-1, 1))
}.overlapTextureProgram(4 / 3, 4 / 3, 6)
