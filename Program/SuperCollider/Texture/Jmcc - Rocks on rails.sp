/* Rocks on rails ; Jmcc #2 */
let p = 20; /* number of partials */
let n = 4; /* number of overlapping events */
{
	eqPan(
		ringzBank( /* p resonant modes */
			resonz(
				dust(100) * 0.04, /* excitation */
				xLine(3000, 300, 8), /* sweep filter down */
				0.2 /* band width ratio */
			),
			{ 200 + linRand(0, 3000, 0) } ! p, /* resonant frequencies */
			nil, /* amplitudes default to 1.0 */
			{ 0.2 + rand(0, 1) } ! p /* ring times */
		),
		line(rand(-1, 1), rand(-1, 1), 8) /* sweep pan */
	)
}.overlapTextureProgram(2, 3, n)
