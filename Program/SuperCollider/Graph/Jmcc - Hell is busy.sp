/* Hell is busy (Jmcc) #1 ; Graph rewrite */
{ :tr |
	let e = lfPulse(tRand(1, 11, tr), 0, tRand(0, 0.7, tr)) * 0.04;
	eqPan2(sinOsc(tRand(400, 2400, tr), 0), tRand(-1, 1, tr)) * e
}.overlapTexture(4, 4, 8).mix
