/* Repeating harmonic klank (Jmcc) */
{
	let p = 8;
	let s = decay(dust(0.8) * 0.01, 3.4) * lfSaw(linRand(0, 40, 0), 0);
	let f = [400, 500, 600, 700, 800, 900, 1000, 1200, 1400, 1500, 1600].atRandom;
	{
		ringzBank(
			s,
			{ f * rand(1, 13) } ! p,
			1,
			{ rand(0.4, 3.4) } ! p
		)
	} ! 2
}.overlapTextureProgram(8, 2, 4)
