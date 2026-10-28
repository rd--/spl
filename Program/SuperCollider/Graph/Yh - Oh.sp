/* http://github.com/pangrus/hachi/blob/master/lib/engine_hachi.sc ; Yh (Yoshinosuke Horiuchi) */
let decay = 0.5;
let amp = 1;
let pan = 0;
let tr = impulse(lfNoise2(1) + 1.5, 0);
let env1 = perc(tr, 0.1, decay, -3);
let env2 = Env([0, 1, 0], [0, decay * 5], -150, nil, nil, 0).asEnvGen(tr);
let osc = lfPulse(
	[203.52 366.31 301.77 518.19 811.16 538.75],
	0,
	0.5
).sum;
let sig1 = bpf(bLowShelf(osc, 990, 2, -3), 7700, 1);
let sig2 = bPeakEq(sig1, 7200, 0.5, 5);
let sig3 = bHiPass4(sig2, 8100, 0.7);
let sig4 = bHiShelf(sig3, 9400, 1, 5);
let siga = sig4 * env1 * 0.6;
let sigb = sig4 * env2;
let sum = lpf(siga + sigb, 4000);
pan2(sum, pan, amp * 2)
