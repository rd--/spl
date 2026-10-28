/* http://fredrikolofsson.com/f0blog/more-sc-twitter/ F0 ; 0059 */
let o = sinOsc(
	saw(3) * 128 + 128,
	(saw([3, 4]) * (lfTri(lfTri(0.1, 0) * 8 + 12, 0) * 32 + 128)).sin
) / 4;
combN(o, 1, 1 / 6, lfTri(1 / 32, 0) + 1)
