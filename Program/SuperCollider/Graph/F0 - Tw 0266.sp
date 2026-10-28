/* http://sccode.org/1-4Qy (F0) ; 0266 */
let b = [1 .. 6] / 2;
let e = sinOsc(b / 99, 0) * 2 + 3;
let c = (sinOsc(b, 0) / (4 / b)) + e.round(1) * 99;
let d = sinOsc(c, 0).splay;
d.sin + (sinOsc(c * 1.5, e / d) * 0.7 / e).mean / 5
