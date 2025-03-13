/* https://fredrikolofsson.com/f0blog/sapf-sctweets/ 0428 */
let b = [1 .. 9];
let g = 1 / b;
Splay(
	7 ^ SinOsc(
		g / 99,
		0
	) / 9 * SinOsc(
		999 * b.shuffled / Rlpf(
			Latch(
				RoundTo(
					WhiteNoise(),
					0.5
				) + 2,
				BrownNoise() + 1.4 > SinOsc(
					b / 999,
					0
				)
			),
			9 ^ SinOsc(g
				* 9,
				0
			) * 999,
			SinOsc(
				b / 77,
				0
			) / 2 + 0.6
		),
		0
	) * Rlpf(
		Latch(
			WhiteNoise(),
			BrownNoise() + 1.3 > SinOsc(
				b / 99,
				0
			)
		),
		9 ^ SinOsc(
			g,
			0
		) * 999,
		SinOsc(
			b / 88,
			0
		) / 2 + 0.6
	)
)
