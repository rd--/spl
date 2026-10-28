/* Police state (Jmcc) */
let n = 4; /* Number of sirens */
combL(
	{
		eqPan(
			sinOsc(
				sinOsc(rand(0, 0.1) + 0.02, 2 * rand(0, 1.pi))
				* rand(0, 600)
				+ (1000 + rand(-300, 300)),
				0
			),
			rand(-1, 1)
		) * lfNoise2(100 + rand(-20, 20)) * 0.1
	} !+ 4 + (
		lfNoise2(lfNoise2([0.4, 0.4]) * 90 + 620)
		* (lfNoise2([0.3, 0.3]) * 0.15 + 0.18)
	),
	0.3, 0.3, 3
) * 0.5
