/* https://fredrikolofsson.com/f0blog/sapf-sctweets/ 0185 */
let c = [1 .. 32];
splay2(
	sinOsc(
		0,
		bpf(
			lfSaw(1.pi / c, 0) * 8.pi * lfSaw(
				c * (lfSaw(2 / c, 1 / c) * 8.16 + 16),
				0
			),
			c * 99,
			lfSaw(3 / c, 0) / 3 + 0.34
		)
	) / 2
)
