/* Plucked strings (Jmcc) */
{
	let i = {
		let s0 = impulse(rand(2, 2.2), 0) * 0.3;
		let s1 = dust(0.5) * 0.3;
		let s2 = impulse(
			sinOsc(rand(0.05, 0.15), rand(0, 2.pi)) * 5 + 5.2,
			0
		) * 0.3;
		[s0, s1, s2].atRandom
	};
	{
		let dt = 1 / rand(60, 90).floor.midiCps;
		let t = decay(i(), 0.1) * pinkNoise() * 0.1;
		eqPan(combL(t, dt, dt, 4), rand(-1, 1))
	} !+ 5
}.overlapTextureProgram(7, 5, 3)
