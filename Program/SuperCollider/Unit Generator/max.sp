/* Max */
sinOsc(
	xLine([100 200], [400 100], 2).reduce { :i :j | i.max(j) },
	0
) * 0.1

/* Max */
let freq = { lfNoise2(1) } ! 3 * 100 + 200;
let freqMax = freq.reduce { :i :j | i.max(j) };
(lfTri(freqMax, 0) * 0.05) + (sinOsc(freq, 0).splay * 0.1)
