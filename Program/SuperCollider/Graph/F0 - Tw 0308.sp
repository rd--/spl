/* http://sccode.org/1-4Qy (F0) ; 0308 */
let b = [1 .. 9];
let o = blip(blip(blip(2.01, 3) > 0, b) + 1, b / 8) + 2 * 99;
let a = formlet(o, b * 50, 0.01, 1).tanh.splay;
freqShift(a, 0.01, 0) + a / 7
