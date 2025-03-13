/* https://fredrikolofsson.com/f0blog/sapf-sctweets/ 0186 */
let b = [1 .. 11].rotated(4) * 1.011;
LeakDc(
	Splay2(
		Sweep(0, b + 999).Fold(
			LfTri(11.11 / b, 0) / 2 - 0.5,
			LfTri(11.1 / b, 0) / 2 + 0.5
		)
	),
	0.995
)
