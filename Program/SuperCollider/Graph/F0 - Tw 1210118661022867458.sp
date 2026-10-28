/* F0  http://twitter.com/redFrik/status/1210118661022867458 */
let b = 1 / [2 .. 7];
let d = 1 / 48;
let g = 0.cos.cos;
let f = duty(b, 0, dseq(Infinity, '0 0 00 0 0 000  _0 0 0 00 00 00000+  !'.ascii));
let o = sinOscFb(f, sinOsc(d, 0).max(0) * 0.cos.sin);
let c = sinOsc(0, 1.pi ^ o);
let p = pitchShift(c, g, 1 / b, d, d) * b;
leakDc(splay(c + p), 0.995) * g
