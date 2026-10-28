/* http://twitter.com/redFrik/status/1125557217086857216 */
let scl = [0 2.94 4.98 7.02 9.96];
let b = [-7 .. 6] + 0.7 * 2 / 666;
let m = degreeToKey(
	localBuf(scl),
	lfTri(b, b) * lfTri(b, 0) * 9 + 9 % 32,
	12
) + 24;
let e = ampComp(m, 440, 1 / 3) * lfTri(b, b) * b * 9;
let o = varSaw(m.midiCps, 0, lfTri(b, 0) + 1 / 2) * e;
let s = rlpf(o, lag2(m, 1 / b % 1) * 3, 1);
allpassN(s, 0.3, 0.2 - b, 3).splay.tanh
