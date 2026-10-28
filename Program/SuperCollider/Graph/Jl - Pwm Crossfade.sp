/* Pwm crossfade (Jl) */
let n = [400 500 450 376 600];
let d = 1 / 20;
let r = demand(impulse(d, [0 0.5]), 0, dseq(Infinity, n));
let f = lfPulse(8, 0, lfTri(d, 1).linLin(-1, 1, 0, 1)).linLin(0, 1, r[1], r[2]);
lpf(saw(f.max(376) * [1 0.99]) * 0.5, 8000) * 0.2
