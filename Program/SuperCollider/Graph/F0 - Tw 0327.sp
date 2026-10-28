/* https://fredrikolofsson.com/f0blog/sapf-sctweets/ 0327 */
(
	sinOsc(
		0,
		sinOsc(
			99,
			9 ^ sinOsc(
				1 / 8,
				lagUd(
					sinOsc(
						1 / [2, 12],
						0
					) < 0 * 2 ^ sinOsc(
						sinOsc(3, 0) > 0 * 150,
						0
					),
					1 / 50,
					1 / 5
				) * 5
			)
		) + sinOsc(1 / [6, 7], 0)
	) * 3
).tanh
