/* https://fredrikolofsson.com/f0blog/sapf-sctweets/ 0186 */
let b = [1 .. 11].rotate(4) * 1.011;
leakDc(
	splay2(
		sweep(0, b + 999).fold(
			lfTri(11.11 / b, 0) / 2 - 0.5,
			lfTri(11.1 / b, 0) / 2 + 0.5
		)
	),
	0.995
)
