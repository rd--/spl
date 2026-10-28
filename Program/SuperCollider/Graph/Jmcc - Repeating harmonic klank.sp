/* Repeating harmonic klank (Jmcc) */
{ :tr |
	let p = 8;
	let s = decay(dust(0.8) * 0.01, 3.4) * lfSaw(tLinRand(0, 40, 0, tr), 0);
	let f = tChoose(tr, [400 500 600 700 800 900 1000 1200 1400 1500 1600]);
	{
		ringzBank(
			s,
			{ f * tRand(1, 13, tr) } ! p,
			1,
			{ tRand(0.4, 3.4, tr) } ! p
		)
	} ! 2
}.overlapTexture(8, 2, 4).mix
