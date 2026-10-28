/* Bowed garage door springs (Jmcc) #9 */
{
	let exc = pinkNoise() * (lfNoise1(rand(0, 3)) * 0.0008 + 0.0022);
	let sig = ringzBank(
		exc,
		{ rand(50, 2000) } ! 4,
		nil,
		{ rand(0.2, 12) } ! 4
	).abs * [-1, 1].atRandom;
	let z = eqPan(sig, lfNoise1(rand(0, 1)));
	6.timesRepeat {
		z := allpassN(z, 0.04, { rand(0, 0.04) } ! 2, 16)
	};
	z
}.overlapTextureProgram(8, 3, 4)
