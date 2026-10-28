/* F0 ; <http://twitter.com/redFrik/status/1395519538008141835> */
let c = duty(0.004, 0, dseries(Infinity, 1, [1, 2]) % duty(8.192, 0, dseq(1, [1 .. 6] * 75)));
let d = hpf(mantissaMask(c, 3),5);
let f = { :x |
	sinOscFb(x, 0).max(0)
};
let p = [250, 200] * lag(duty(4.096, 0, dseq(1, [4 6 5 5 5 5 3] / 4)), 0.1);
let o = sinOscFb(p, f(0.08)) * f(1 / [99, 60]) / 3;
lpf((d.sin + (sinOscFb(63, f(0.8)) * d) / 9 + o).tanh / 2, 10000) * 0.2
