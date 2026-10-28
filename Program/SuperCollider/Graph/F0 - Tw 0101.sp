/* http://sccode.org/1-4Qy (F0) ; 0101 ; graph variant (rd) */
let d = [0 9 17 24 30 35 39 42 44];
[1 .. 9].collect { :c |
	let a = delayN(inFb(2, 0), 1, 1);
	let o = sinOsc(c + 1 * 99 + [0, 2], a.reverse) / 4;
	delayN(o * linSeg(impulse(1 / 45, 0), [1, 9 - c + 16, 0]), d[c], d[c])
}.mix
