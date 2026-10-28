/* http://sccode.org/1-4Qy (F0) ; 0248 */
let d = lfTri(0.1, 0) < 0;
let b = d + [2 .. 8] / (d + 2);
let o = lfTri(b * 99, 0);
let r = ringz(lfTri(b / 2, 0) > 0, b * 99, 5 ^ lfTri(lfTri(0.01, 0) + 2 - b, 0) / 4);
splay(o + r).tanh / 4
