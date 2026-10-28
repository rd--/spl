/* Deepsea (jrhb) */
let amp = 0.1;
let variation = 0.9;
let tr = dust(0.25);
let n = tRand(7, 46, tr);
let dt = 25.0 + tRand(-1.7, 1.7, tr) + lfNoise2(2) * variation * 0.001;
let freq = 901 + tRand(0, 65, tr);
let t = impulse(dt.reciprocal, 0) * 100;
let count = pulseCount(t, 0);
let u = bpf(
	bpf(count < n * t, freq, 0.1),
	freq * (count % linLin(lfNoise1(1), -1, 1, 2, 20) + 1),
	0.2
);
let f1 = bpf(
	eqPan(u, tRand(-1, 1, tr)) * amp * 50,
	700,
	0.1
);
let f2 = combL(
	lpf(f1 * lfNoise1(0.1).max(0), 800),
	0.5,
	0.5,
	1
) + f1.reverse;
let f3 = f2;
5.timesRepeat {
	f3 := allpassN(f3, 0.18, { rand(0, 0.06) } ! 2 + 0.06, 8)
};
lpf(f2 + f3, 400) + (lfNoise1(0.2) * f2)
