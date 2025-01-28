/* Plucked strings (Jmcc) */
{
	let i = {
		let s0 = Impulse(Rand(2, 2.2), 0) * 0.3;
		let s1 = Dust(0.5) * 0.3;
		let s2 = Impulse(
			SinOsc(Rand(0.05, 0.15), Rand(0, 2.pi)) * 5 + 5.2,
			0
		) * 0.3;
		[s0, s1, s2].atRandom
	};
	{
		let dt = 1 / Rand(60, 90).Floor.MidiCps;
		let t = Decay(i(), 0.1) * PinkNoise() * 0.1;
		EqPan(CombL(t, dt, dt, 4), 1.Rand2)
	} !+ 5
}.overlapTextureProgram(7, 5, 3)
