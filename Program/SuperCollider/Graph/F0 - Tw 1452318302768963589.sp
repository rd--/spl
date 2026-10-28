/* <http://twitter.com/redFrik/status/1452318302768963589> ; F0 */
let b = 2.pi * [4 3 1 2 5] / 5;
let m = 2 ^ SinOsc(1 / 50, b) * 99;
let c = m.round(50);
let t = b / 2.pi + SinOsc(b / 50, SinOsc(SinOsc(1 / 99, 1.pi).max(0), 0) ^ 2.pi).max(0);
let f = SinOsc(b / 9, b) / 3 + c;
let h = CombC(c / 50, 2, t, 5);
let a = 50 / m * SinOsc(b / 50, 0).max(0) + 0.5;
let z = Blip(f, h) * a;
let o = Hpf(Splay2(z) * 1.5, 15).tanh;
o + GVerb(o.sum / 2 * line(0, 1, 1), 50, 3, 0.5, 0.5, 15, 1, 0.7, 0.5, 300) / 5
