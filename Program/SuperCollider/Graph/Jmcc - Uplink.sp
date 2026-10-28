/* Uplink (Jmcc) #2 ; Graph rewrite */
{ :tr |
	let osc = {
		let e = *+(
			lfPulse(tRand(0, 4, tr), 0, tRand(0, 1, tr)),
			tRand(0, 8000, tr),
			tRand(0, 2000, tr)
		);
		lfPulse(tRand(0, 20, tr), 0, tRand(0, 1, tr)) * e
	};
	eqPan2(
		lfPulse(osc() + osc(), 0, 0.5) * 0.04,
		tRand(0, 0.8, tr)
	)
}.overlapTexture(4, 1, 5).mix
