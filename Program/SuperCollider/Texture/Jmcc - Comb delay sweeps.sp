/* Comb delay sweeps (Jmcc) #6 */
{
	let dur = 4;
	let note1 = 50 + rand(0, 70);
	let endNote1 = (note1 + rand(0, 15) - 7).fold(50, 120);
	let note2 = (note1 + rand(0, 15) - 7).fold(50, 120);
	let endNote2 = (endNote1 + rand(0, 15) - 7).fold(50, 120);
	let noteSweep = line(note2, endNote2, dur);
	let dt = 1 / noteSweep.midiCps;
	let dc = 1 / note2.midiCps * 1000;
	eqPan(combC(whiteNoise() * 0.005, 0.01, dt, dc), rand(-1, 1))
}.overlapTextureProgram(4 / 3, 4 / 3, 6)
