/* http://sccode.org/1-4Qy (F0) ; 0298 */
let c = sinOscFb([2, 3], 0) % 1;
let f = xFade2(
	sinOscFb(1, 0).ceiling * 36,
	sinOscFb(2, 0).round(1) * 2 + 4 * 12,
	sinOscFb(1 / [4, 12], 0),
	1
) + 8 * 4;
sinOscFb(f, c) * c * sinOscFb(1, 1 / 3)
