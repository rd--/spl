/* Ostinoodles (Jmcc) #9 */
let root = 81 + [-6 .. 6].atRandom;
let major = [0 2 4 5 7 9 11];
{
	let offset = [-16 .. 16].atRandom;
	let seq = major.degreeToKey(
		([0 .. 3] + offset).shuffle,
		12
	) + root;
	let trig = impulse(xLine(expRand(4, 24), expRand(4, 24), 12), 0);
	let f = sequencer(seq.midiCps, trig);
	let z = eqPan(lfTri(f, 0) * decay2(trig, 0.004, 0.3) * 0.1, rand(-1, 1));
	6.timesRepeat {
		z := allpassN(z, 0.040, { rand(0, 0.04) } ! 2, 16)
	};
	z
}.overlapTextureProgram(6, 3, 6)
