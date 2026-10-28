/* Data space ; Jmcc ; #2 */
{
	let dt = rand(0.25, 0.35);
	let osc = { :n :m |
		let e = *+(
			lfPulse(rand(0, m), 0, rand(0, 1)),
			rand(0, 8000),
			rand(0, 2000)
		);
		lfPulse(rand(0, n), 0, rand(0, 1)) * e
	};
	let freq = osc(200.0, 40.0) + osc(20.0, 4.0) + osc(20.0, 4.0);
	combL(
		eqPan(
			lfPulse(freq, 0, 0.5),
			lfNoise0(rand(0, 3)) * 0.8
		) * 0.04, dt, dt, 3
	)
}.overlapTextureProgram(6, 1, 4)
