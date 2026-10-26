/* Zizle (Jmcc) #SC3d1.5 */
{
	let a = { :f |
		(
			SinOsc(
				f * [Rand(0.7, 1.3), 1],
				{ Rand(0, 2.pi) } ! 2
			) * 0.1
		).Sum
	};
	let a1 = a(ExpRand(0.3, 0.8)).max(0);
	let a2 = a(ExpRand(6, 24)).abs;
	EqPan(
		SinOsc(Rand(24, 108).midiCps, Rand(0, 2.pi)) * a1 * a2,
		Rand(-1, 1)
	)
}.overlapTextureProgram(4, 4, 12)
