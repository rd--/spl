/* Ostinoodles (Jmcc) #9 */
let root = 81 + -6:6.atRandom;
let major = [0 2 4 5 7 9 11];
{
	let offset = -16:16.atRandom;
	let seq = ([0 .. 3] + offset).shuffled.degreeToKey(major, 12) + root;
	let trig = Impulse(XLine(ExpRand(4, 24), ExpRand(4, 24), 12), 0);
	let f = Sequencer(seq.MidiCps, trig);
	let z = EqPan(LfTri(f, 0) * Decay2(trig, 0.004, 0.3) * 0.1, 1.Rand2);
	6.timesRepeat {
		z := AllpassN(z, 0.040, { 0.04.Rand0 } ! 2, 16)
	};
	z
}.overlapTextureProgram(6, 3, 6)
