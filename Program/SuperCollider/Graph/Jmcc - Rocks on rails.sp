/* Rocks on rails (Jmcc) ; Graph variant ; requires=LinRand */
let p = 20; /* Number of partials */
let n = 4; /* Number of overlapping events */
{ :tr |
	eqPan2(
		dynRingzBank( /* P resonant modes */
			resonz(
				dust(100) * 0.04, /* Excitation */
				xLine(3000, 300, 8), /* sweep filter down */
				0.2 /* Band width ratio */
			),
			{ 200 + tLinRand(0, 3000, 0, tr) } ! p, /* Resonant frequencies */
			[1], /* Amplitudes */
			{ 0.2 + tRand(0, 1, tr) } ! p /* Ring times */
		),
		line(tRand(-1, 1, tr), tRand(-1, 1, tr), 8) /* sweep pan */
	)
}.overlapTexture(2, 3, n).mix * 0.5
