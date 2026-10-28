/* http://sccode.org/1-4Qy (F0) ; 0332 */
let f = (
	2 ^ (sinOscFb([4 3], 0) > 0)
) * (
	sinOscFb(1 / 16, 0) > 0
	+ 2
	* (sinOscFb(1 / [32 48], 0) > 0 * 20 + 99)
);
let o = sinOscFb(f, sinOscFb(1 / 63.9, 0) + 2 / 3);
allpassN(o, 3, 3, 60) / 3
