/* Coolant (Jmcc) #2 */
{
	let p = 10;
	let exc = OnePole(BrownNoise() * 0.002, 0.95);
	{ RingzBank(exc, { 40 + Rand(0, 2000) } ! p, 1, 1) } ! 2
}.overlapTextureProgram(4, 4, 2)
