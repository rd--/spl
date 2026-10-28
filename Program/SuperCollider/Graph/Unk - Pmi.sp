/* Pmi ; texture graph */
{ :tr |
	let pm = tLine(0, tRand(0, 12, tr), tRand(1, 12, tr), tr);
	eqPan2(
		pmOsc(tRand(0, 2000, tr), tRand(0, 800, tr), pm, 0),
		tRand(-1, 1, tr)
	) / 20
}.overlapTexture(1, 2, 6).mix
