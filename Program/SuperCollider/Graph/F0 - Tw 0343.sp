/* http://sccode.org/1-4Qy (F0) ; 0343 */
let b = 0.01 / [2 .. 6];
let c = sinOscFb(1 - b * 8, 1 / 2) + 1 / 2;
let e = decay(c > 0.99512 * sinOscFb(c + 1 / b, 0), 1 / 2) / 22;
let o = sinOscFb(4 ^ sinOscFb(b, 0) * 99, c);
(o * e).tanh.splay
