/* Sidereal time (Jmcc) #9 */
{
	let p = 15;
	let f = xLine(expRand(40, 300), expRand(40, 300), 12);
	let t = lfPulse(f, 0, rand(0.1, 0.9)) * 0.002 * lfNoise2(rand(0, 8)).max(0);
	let z = { ringzBank(t, { expRand(100, 6000) } ! p, 0.1, { rand(2, 6) } ! p).distort } ! 2;
	combN(z, 0.6, rand(0, 0.5) + 0.1, 8) + z.reverse
}.overlapTextureProgram(4, 4, 6)
