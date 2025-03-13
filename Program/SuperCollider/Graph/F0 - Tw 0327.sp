/* https://fredrikolofsson.com/f0blog/sapf-sctweets/ 0327 */
(
	SinOsc(
		0,
		SinOsc(
			99,
			9 ^ SinOsc(
				1 / 8,
				LagUd(
					SinOsc(
						1 / [2, 12],
						0
					) < 0 * 2 ^ SinOsc(
						SinOsc(3, 0) > 0 * 150,
						0
					),
					1 / 50,
					1 / 5
				) * 5
			)
		) + SinOsc(1 / [6, 7], 0)
	) * 3
).Tanh
