/* http://github.com/pangrus/hachi/blob/master/lib/engine_hachi.sc ; Yh (Yoshinosuke Horiuchi) */
let decay = 0.42;
let amp = 1;
let pan = 0;
let tr = impulse(lfNoise2(1) + 1.5, 0);
let env = perc(tr, 0.005, decay, -30);
let osc = lfPulse(
	[203.52 366.31 301.77 518.19 811.16 538.75],
	0,
	0.5
).sum;
let sighi = hpf(bpf(osc, 8900, 1), 9000);
let siglow = bHiPass(bBandPass(osc, 8900, 0.8), 9000, 0.3);
let sig = bPeakEq((siglow + sighi), 9700, 0.8, 0.7);
pan2(sig * env, pan, amp)
