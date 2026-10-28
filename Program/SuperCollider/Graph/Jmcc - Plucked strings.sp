/* Plucked strings (Jmcc) */
{ :tr |
	let i = {
		let s0 = impulse(tRand(2, 2.2, tr), 0) * 0.3;
		let s1 = dust(0.5) * 0.3;
		let s2 = impulse(
			sinOsc(tRand(0.05, 0.15, tr), tRand(0, 2.pi, tr)) * 5 + 5.2,
			0
		) * 0.3;
		tChoose(tr, [s0, s1, s2])
	};
	{
		let dt = 1 / tRand(60, 90, tr).floor.midiCps;
		let t = decay(i(), 0.1) * pinkNoise() * 0.1;
		eqPan2(combL(t, dt, dt, 4), tRand(-1, 1, tr))
	} !+ 5
}.overlapTexture(7, 5, 3).mix
