{- inharmonic warbulence (jmcc) #12 -}
{
	let f = Rand(24, 96).MidiCps;
	let a = 1.Min(500 / f);
	let r = XLine(ExpRand(0.1, 20), ExpRand(0.1, 20), 25.6);
	let n = 12;
	let z = {
		let g = Rand(1, n + 1);
		let m = 0.Max(
			SinOsc(r * Rand(0.9, 1.1), (2 * pi).Rand0) * 0.08 - 0.04
		);
		EqPan(FSinOsc(f * g, 0) * m * (2 / g), 1.Rand2)
	} !+ n * a;
	{
		CombN(z, 0.3, { Rand(0.1, 0.3) } ! 2, 8)
	} !+ 5 * 0.3
}.overlap(12.8, 6.4, 6)
