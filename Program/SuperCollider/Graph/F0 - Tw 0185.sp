/* https://fredrikolofsson.com/f0blog/sapf-sctweets/ 0185 */
let c = (1 .. 32);
Splay2(
	SinOsc(
		0,
		Bpf(
			LfSaw(1.pi / c, 0) * 8.pi * LfSaw(
				c * (LfSaw(2 / c, 1 / c) * 8.16 + 16),
				0
			),
			c * 99,
			LfSaw(3 / c, 0) / 3 + 0.34
		)
	) / 2
)
