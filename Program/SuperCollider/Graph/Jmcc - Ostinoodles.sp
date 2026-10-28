/* Jmcc ; Ostinoodles ; requires=TScramble */
let z = { :tr |
	let root = 81 + tRand(-6, 6, tr);
	let major = [0 2 4 5 7 9 11].localBuf;
	let offset = tRand(-16, 16, tr);
	let seq = major.degreeToKey(
		tScramble(tr, [0 .. 3] + offset),
		12
	) + root;
	let f = txLine(tExpRand(4, 24, tr), tExpRand(4, 24, tr), 12, tr);
	let trig = impulse(f, 0);
	let freq = sequencer(seq.midiCps, trig);
	let sig = lfTri(freq, 0) * decay2(trig, 0.004, 0.3) * 0.1;
	eqPan2(sig, tRand(-1, 1, tr))
}.overlapTexture(6, 3, 6).mix;
6.timesRepeat {
	z := allpassN(z, 0.04, { rand(0, 0.04) } ! 2, 16)
};
z
