/* http://sccode.org/1-4Qy (F0) ; 0310 */
let b = 1 / [3, 2];
let f = duty(
	trig(localIn(2, 0), sinOscFb(b, 0) + 11 / 2),
	0,
	dseq(Infinity, [1 .. 8])
) * 99;
let c = sinOscFb(f, sinOscFb(b / 12, 0));
c <! localOut(c)
