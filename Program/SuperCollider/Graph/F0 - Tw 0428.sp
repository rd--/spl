/* https://fredrikolofsson.com/f0blog/sapf-sctweets/ 0428 */
let b = [1 .. 9];
let g = 1 / b;
splay(
	7 ^ sinOsc(
		g / 99,
		0
	) / 9 * sinOsc(
		999 * b.shuffle / rlpf(
			latch(
				whiteNoise().round(0.5) + 2,
				brownNoise() + 1.4 > sinOsc(
					b / 999,
					0
				)
			),
			9 ^ sinOsc(g
				* 9,
				0
			) * 999,
			sinOsc(
				b / 77,
				0
			) / 2 + 0.6
		),
		0
	) * rlpf(
		latch(
			whiteNoise(),
			brownNoise() + 1.3 > sinOsc(
				b / 99,
				0
			)
		),
		9 ^ sinOsc(
			g,
			0
		) * 999,
		sinOsc(
			b / 88,
			0
		) / 2 + 0.6
	)
)
