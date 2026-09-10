/* Bowed garage door springs (Jmcc) #9 */
{
	let exc = PinkNoise() * (LfNoise1(Rand(0, 3)) * 0.0008 + 0.0022);
	let sig = RingzBank(
		exc,
		{ Rand(50, 2000) } ! 4,
		nil,
		{ Rand(0.2, 12) } ! 4
	).Abs * [-1, 1].atRandom;
	let z = EqPan(sig, LfNoise1(Rand(0, 1)));
	6.timesRepeat {
		z := AllpassN(z, 0.04, { Rand(0, 0.04) } ! 2, 16)
	};
	z
}.overlapTextureProgram(8, 3, 4)
