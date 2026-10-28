/* http://sccode.org/1-4Qy (F0) ; 0334 */
let b = [9 .. 1; -1] * 4.0015;
let r = sinOsc(2 / b, 0) * 3;
let q = sinOsc(sinOsc(b / 8, 0) / 2 + (sinOsc(1 / 33, 0) > 0 + 8 * b), 0);
let ph = r + 4 ^ q * 6;
splay(sinOsc(0, ph) * (4 ^ sinOsc(1/b, b)).tanh / 2)
