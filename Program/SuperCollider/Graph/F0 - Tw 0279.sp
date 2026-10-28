/* http://sccode.org/1-4Qy (F0) ; 0279 */
let b = [1 3 6 8 10];
let m = degreeToKey(b.localBuf, lfSaw(lfSaw(1 / b / 99, 0) / 1.pi, 0) * 12 + 18 + b, 12);
let f = combN(m.midiCps, 0.2, 0.2, 1);
lfSaw(f, 0).splay * 0.6
