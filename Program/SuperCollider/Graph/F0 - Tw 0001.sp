/* http://sccode.org/1-4Qy ; tweet0001 (F0) ; graph variant (rd) */
[0 .. 98].collect { :each |
	let ph = sinOsc(each % 9 // 3 * 100 + (each % 9) + 500, 0);
	let e = linSeg(1, [0, each * 2, 0, 0.01, 1, 2, 1, 25, 0]);
	eqPan(sinOsc(each + 1, ph) * 0.03, rand(-1, 1)) * e
}.sum
