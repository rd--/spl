/* https://fredrikolofsson.com/f0blog/sapf-sctweets/ ; 0071 */
let b = (2 .. 5);
Splay(
	LfTri(
		(
			LfTri(b / 9 / 9 / 9, 0).RoundTo(
				LfTri(9 - b * 99, 9 - b / 9) * LfTri(b / 9, b / 99)
			) * (
				LfTri(9, 0) * (9 - b * 99) + (99 * b)
			)
		).Abs,
		0
	)
) * 0.25
