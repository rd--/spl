/* Zizle (Jmcc) #SC3d1.5 ; Graph rewrite */
{ :tr |
	let amp = { :f |
		sinOsc(
			f * [tRand(0.7, 1.3, tr), 1],
			{ tRand(0, 2.pi, tr) } ! 2
		).sum * 0.1
	};
	let osc = sinOsc(
		tRand(24, 108, tr).midiCps,
		tRand(0, 2.pi, tr)
	);
	eqPan2(
		[
			osc,
			amp(tExpRand(0.3, 8, tr)).max(0),
			amp(tExpRand(6, 24, tr)).abs
		].product,
		tRand(-1, 1, tr)
	)
}.overlapTexture(4, 4, 12).mix
