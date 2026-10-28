/* rand */
sinOsc(rand(220, 440), 0) * 0.1

/* rand */
sinOsc(
	{ rand(220, 440) } ! 7,
	0
).splay * 0.1

/* rand */
let f1 = rand(220, 600);
let f2 = rand(220, 600);
sinOsc([f1, f2], 0) * 0.1

/* rand */
eqPan(pinkNoise(), rand(-1, 1)) / 10
