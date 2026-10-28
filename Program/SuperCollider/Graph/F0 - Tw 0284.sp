/* https://fredrikolofsson.com/f0blog/sapf-sctweets/ 0284 */
let c = [6 14 4];
rhpf(
	splay(
		sinOsc(
			lfTri(c, 0) % lfTri(c, 0),
			lfTri(c - 1, 0) + 1 ^ lfTri(c / 9, 0) * 4
		) * (
			lfTri(1 / c, 0) > 0 * 99
		)
	),
	99,
	0.3
).tanh * 0.6
