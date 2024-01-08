(* cfstring1 (jmcc) ; http://www.iamas.ac.jp/~aka/dspss2004/materials/ *)
{
	let dgr = DegreeToKey(
		[0 2 4 5 7 9 11].asLocalBuf,
		Rand(0, 12),
		12
	);
	let freq = (60 + dgr).MidiCps;
	let pan = Rand(-1, 0.7);
	let amp = Rand(0.1, 0.2);
	let fc = LinExp(LfNoise1(Rand(0.25, 0.4)), -1, 1, 500, 2000);
	let osc = {
		LfSaw(
			freq * [Rand(0.99, 1.01), Rand(0.99, 1.01)],
			0
		) * amp
	} !+ 8;
	let eg = Decay2(Impulse(0, 0), 0.5, 1);
	let out = eg * Rlpf(osc.Distort * 0.2, fc, 0.1);
	EqPan(out, [pan, pan + 0.3]).Sum / 2
}.overlap(2, 0, 10)
