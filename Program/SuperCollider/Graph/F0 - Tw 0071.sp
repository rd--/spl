/* https://fredrikolofsson.com/f0blog/sapf-sctweets/ ; 0071 */
let b = [2 .. 5];
splay(
	lfTri(
		(
			lfTri(b / 9 / 9 / 9, 0).round(
				lfTri(9 - b * 99, 9 - b / 9) * lfTri(b / 9, b / 99)
			) * (
				lfTri(9, 0) * (9 - b * 99) + (99 * b)
			)
		).abs,
		0
	)
) * 0.25
