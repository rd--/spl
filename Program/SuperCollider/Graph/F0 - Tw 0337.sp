/* http://sccode.org/1-4Qy (F0) ; 0337 */
let b = [1 .. 12] / 8;
let f1 = formant(b, b / 3.5 + 80, 999 - b / 9) + 3 * 50;
let f2 = formant(b / 3, 2.5, 5) > 0 + 1 * 300;
let f3 = formant(b / 5, 2, 3) > 0 * 1200;
splay(formant(f1, f2, f3) / 3).tanh
