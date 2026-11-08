/* expRand ; texture ; required 0.max(u) */
{ :tr |
	eqPan2(
		sinOsc(
			tExpRand(300, 3000, tr),
			0
		) * sinOsc(tExpRand(1, 15, tr), 0).max(0) * 0.05,
		tRand(-1, 1, tr)
	)
}.overlapTexture(4, 4, 4).mix
