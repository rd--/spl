/* https://sonomu.club/@lukiss/113007186778241483 */
let k = 0.13;
let l = { :a :b |
	k := k + k;
	latoocarfianN(k, 1, 3, k, 0.5, 0.5, 0.5).tanh.linLin(-1, 1, a, b)
};
let d = {
	decay2(
		tDuty(1 / 8, 0, 1),
		l(0.01, 1 / 9),
		l(0.1, 1)
	)
};
normalizer(
	leakDc(
		moogFf(
			List(
				2,
				lorenzL(
					20000,
					l(21, 4),
					l(6, 17),
					l(0.003, 1 / 5),
					d().clip(0, 0.05),
					0.1,
					0,
					0
				)
			),
			l(9, d() * l(9, 20000)) + 999,
			2 + d(),
			0
		),
		0.995
	),
	0.5,
	0.05
)
