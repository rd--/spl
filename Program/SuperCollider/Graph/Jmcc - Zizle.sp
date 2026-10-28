/* Zizle (Jmcc) #SC3d1.5 ; Graph rewrite */
{ :tr |
	let amp = { :f |
		SinOsc(
			f * [TRand(0.7, 1.3, tr), 1],
			{ TRand(0, 2.pi, tr) } ! 2
		).sum * 0.1
	};
	let osc = SinOsc(
		TRand(24, 108, tr).midiCps,
		TRand(0, 2.pi, tr)
	);
	EqPan2(
		[
			osc,
			amp(TExpRand(0.3, 8, tr)).max(0),
			amp(TExpRand(6, 24, tr)).abs
		].product,
		TRand(-1, 1, tr)
	)
}.OverlapTexture(4, 4, 12).Mix
