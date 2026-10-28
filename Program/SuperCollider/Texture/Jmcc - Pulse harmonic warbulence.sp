/* pulse harmonic warbulence (Jmcc) #12 */
{
	let f = rand(24, 96).midiCps;
	let r = xLine(expRand(0.1, 20), expRand(0.1, 20), 25.6);
	let p = lfPulse(expRand(0.2, 1.2), rand(0.1, 0.2), 0.5);
	let z = [1 .. 12].collect { :i |
		let m = 0.max(
			sinOsc(r * rand(0.9, 1.1), rand(0, 2.pi)) * 0.1 - 0.05
		);
		eqPan(
			sinOsc(f * i, 0) * m * (1 / i),
			rand(-1, 1)
		)
	}.sum * p;
	{
		combN(z, 0.3, { rand(0.1, 0.3) } ! 2, 8)
	} !+ 5 * 0.5
}.overlapTextureProgram(12.8, 6.4, 6)
