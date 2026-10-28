/* Cfstring1 (Jmcc) ; http://www.iamas.ac.jp/~aka/dspss2004/materials/ */
{
	let dgr = degreeToKey(
		[0 2 4 5 7 9 11].localBuf,
		rand(0, 12),
		12
	);
	let freq = (60 + dgr).midiCps;
	let pan = rand(-1, 0.7);
	let amp = rand(0.1, 0.2);
	let fc = linExp(lfNoise1(rand(0.25, 0.4)), -1, 1, 500, 2000);
	let osc = {
		lfSaw(
			freq * [rand(0.99, 1.01), rand(0.99, 1.01)],
			0
		) * amp
	} !+ 8;
	let eg = decay2(impulse(0, 0), 0.5, 1);
	let out = eg * rlpf(osc.distort * 0.2, fc, 0.1);
	eqPan(out, [pan, pan + 0.3]).sum / 2
}.overlapTextureProgram(2, 0, 10)
