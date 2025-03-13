/* https://fredrikolofsson.com/f0blog/sapf-sctweets/ 0284 */
let c = [6 14 4];
Rhpf(
	Splay(
		SinOsc(
			LfTri(c, 0) % LfTri(c, 0),
			LfTri(c - 1, 0) + 1 ^ LfTri(c / 9, 0) * 4
		) * (
			LfTri(1 / c, 0) > 0 * 99
		)
	),
	99,
	0.3
).Tanh * 0.6
