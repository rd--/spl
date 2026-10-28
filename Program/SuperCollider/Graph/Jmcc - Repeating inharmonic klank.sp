/* Repeating inharmonic klank (Jmcc) #6 ; Graph rewrite */
let n = 4;
let p = 8;
{ :tr |
	let s = decay(dust(0.8) * 0.004, 3.4) * lfSaw(tRand(0, 40, tr), 0);
	{
		ringzBank(
			s,
			{ tRand(80, 10000, tr) } ! p,
			1,
			{ tRand(0.4, 4.4, tr) } ! p
		)
	} ! 2
}.overlapTexture(8, 8, n).mix
