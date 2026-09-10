/* Data space ; Jmcc ; #2 */
{
	let dt = Rand(0.25, 0.35);
	let osc = { :n :m |
		let e = MulAdd(
			LfPulse(Rand(0, m), 0, Rand(0, 1)),
			Rand(0, 8000),
			Rand(0, 2000)
		);
		LfPulse(Rand(0, n), 0, Rand(0, 1)) * e
	};
	let freq = osc(200.0, 40.0) + osc(20.0, 4.0) + osc(20.0, 4.0);
	CombL(
		EqPan(
			LfPulse(freq, 0, 0.5),
			LfNoise0(Rand(0, 3)) * 0.8
		) * 0.04, dt, dt, 3
	)
}.overlapTextureProgram(6, 1, 4)
