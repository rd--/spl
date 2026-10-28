/* Sawed cymbals (Jmcc) ; #10 ; Graph rewrite */
let p = 15;
{ :tr |
	let f1 = tRand(500, 2500, tr);
	let f2 = tRand(0, 8000, tr);
	let f3 = txLine(tRand(0, 600, tr), tRand(0, 600, tr), 12, tr);
	let s = lfSaw(f3, 0) * 0.0005;
	{
		ringzBank(
			s,
			{ f1 + tRand(0, f2, tr) } ! p,
			nil,
			{ tRand(2, 6, tr) } ! p
		)
	} ! 2 * 0.1
}.overlapTexture(4, 4, 6).mix
