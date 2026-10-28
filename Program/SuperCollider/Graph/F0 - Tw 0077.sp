/* Tw 0077 (F0) - http://sccode.org/1-4Qy */
let f = sinOsc(1 / [5 6], 0) + [798 912];
let p = sinOsc(1 / 16, 0) * 19 + 99 * sinOsc([9 8], 0);
let m = sinOsc(sinOsc(6, 0) * sinOsc(0.009, 0), 0);
let b = sinOsc(f, p) * m;
sinOsc([201 301], b).tanh * 0.25
