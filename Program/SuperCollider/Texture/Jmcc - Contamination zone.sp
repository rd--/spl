/* Contamination zone (Jmcc) #9 */
{
	let f = expRand(800, 8000);
	let pan = lfNoise1(rand(0, 1));
	let amp = lfPulse(linRand(0, 15, 0), 0, 0.2 + rand(0, 0.2));
	let exc = pinkNoise() * (lfNoise1(rand(0, 3)) * 0.0008 + 0.0022);
	let sig = ringzBank(
		exc,
		{ rand(50, 2000) } ! 4,
		nil,
		{ rand(0.2, 4) } ! 4
	).abs * [-1, 1].atRandom;
	let flt = rlpf(sig, sinOsc(linRand(0, 1, 0), 0) * 0.7 * f + f, 0.1);
	let z = eqPan(flt * amp, pan);
	6.timesRepeat {
		z := allpassN(z, 0.1, { rand(0, 0.05) } ! 2, 4)
	};
	z
}.overlapTextureProgram(8, 3, 4)
