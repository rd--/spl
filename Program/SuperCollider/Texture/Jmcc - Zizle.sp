/* Zizle (Jmcc) #SC3d1.5 */
{
	let a = { :f |
		(
			sinOsc(
				f * [rand(0.7, 1.3), 1],
				{ rand(0, 2.pi) } ! 2
			) * 0.1
		).sum
	};
	let a1 = a(expRand(0.3, 0.8)).max(0);
	let a2 = a(expRand(6, 24)).abs;
	eqPan(
		sinOsc(rand(24, 108).midiCps, rand(0, 2.pi)) * a1 * a2,
		rand(-1, 1)
	)
}.overlapTextureProgram(4, 4, 12)
