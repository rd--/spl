/* Tw 0125 (F0) */
let f = sinOsc(1 / [8, 9], 0) * 4 + [400, 202];
let u = sinOsc(1 / 9, 0) + 1 / 88;
let d = sinOsc(1 / 8, 0) + 1 / 99;
let i = inFb(1, [1, 0]);
let p = combC(i.lagUd(u, d), 1, 0.08, 9);
sinOsc(f, p) * 0.25
