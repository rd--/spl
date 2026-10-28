/* http://sccode.org/1-4Qy (F0) ; 0355 */
let b = [1 .. 9];
let o = lfSaw(lfSaw(9, 2 / b), 0) > 0.05 * greyNoise() * 999 * lfSaw(440, 0);
moogFf(o, 2 ^ lfSaw(b / 3.55, 0).round(1) * b * 99, 3.5, 0).splay.tanh / 9
