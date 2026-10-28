/* Pond life (Jmcc) #1 ; Graph rewrite ; requires=LinRand */
{ :tr |
	let f = *+(
		sinOsc(tRand(20, 50, tr), 0),
		tRand(100, 400, tr),
		tLinRand(500, 2500, 0, tr)
	);
	let e = lfPulse(3 / tRand(1, 9, tr), 0, tRand(0.2, 0.5, tr));
	eqPan2(
		sinOsc(f, 0) * e * 0.04,
		tRand(-1, 1, tr)
	)
}.overlapTexture(8, 8, 4).mix
