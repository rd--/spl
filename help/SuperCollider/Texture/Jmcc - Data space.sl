/* Data space ; Jmcc ; #2 */
{
	let dt = Rand(0.25, 0.35);
	let osc = { :n :m |
		let e = MulAdd(
			LfPulse(m.Rand0, 0, 1.Rand0),
			8000.Rand0,
			2000.Rand0
		);
		LfPulse(n.Rand0, 0, 1.Rand0) * e
	};
	let freq = osc(200.0, 40.0) + osc(20.0, 4.0) + osc(20.0, 4.0);
	CombL(
		EqPan(
			LfPulse(freq, 0, 0.5),
			LfNoise0(3.Rand0) * 0.8
		) * 0.04, dt, dt, 3
	)
}.overlapTextureProgram(6, 1, 4)
