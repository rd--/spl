/* Birdies (Jmcc) #6 */
{ :tr |
	let p1 = {
		lfPulse(
			tRand(0.4, 1.4, tr),
			0,
			tRand(0.1, 0.9, tr)
		) * tRand(4, 7, tr)
	};
	let p2 = lfPulse(tRand(0.2, 0.7, tr), 0, 0.4) * 0.02;
	let sw = (
		lfSaw(p1() + p1() + 2, 0)
		* tRand(1000, 1800, tr).-
		+ 4000
		+ tRand(-1200, 1200, tr)
	);
	let freq = lag(sw, 0.05);
	let amp = lag(p2, 0.3);
	eqPan2(
		sinOsc(freq, 0) * amp,
		tRand(-1, 1, tr)
	)
}.overlapTexture(7, 4, 4).mix
