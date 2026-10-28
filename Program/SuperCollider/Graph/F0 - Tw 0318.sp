/* http://sccode.org/1-4Qy (F0) ; 0318 */
let b = [1 .. 3];
*+(
	sinOscFb(13 * 13 * b, 1 / 3),
	sinOscFb(b / 13, 1) / 13,
	sinOscFb(
		sinOscFb(1 / [13 .. 3; -1], 0) + 133 * b,
		sinOscFb(b / 333, sinOscFb(b, 1) % 1) % 1
	)
).splay / 3
