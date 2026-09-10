/* Sidereal time (Jmcc) #9 */
{
	let p = 15;
	let f = XLine(ExpRand(40, 300), ExpRand(40, 300), 12);
	let t = LfPulse(f, 0, Rand(0.1, 0.9)) * 0.002 * LfNoise2(Rand(0, 8)).Max(0);
	let z = { RingzBank(t, { ExpRand(100, 6000) } ! p, 0.1, { Rand(2, 6) } ! p).Distort } ! 2;
	CombN(z, 0.6, Rand(0, 0.5) + 0.1, 8) + z.reverse
}.overlapTextureProgram(4, 4, 6)
