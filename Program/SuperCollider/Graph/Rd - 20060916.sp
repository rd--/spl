/* 20060916 ; rd */
[1 .. 4].collect { :n |
	let tr = dust(1.6);
	let rd = { :l |
		bufRd(
			1,
			l.localBuf,
			tRand(0, 6, tr),
			0,
			1
		).lag(lfNoise2(0.3).linLin(-1, 1, 0.01, 0.1))
	};
	eqPan2(
		sinOsc([60 62 64 65 67 69].rd.midiCps, 0),
		[-1 -0.5 0 0.25 0.75 1].rd
	) * [0.01 0.05 0.1 0.15 0.25 0.35].rd
}.mix * 0.25
