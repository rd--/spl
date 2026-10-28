/* Red frik (F0) */
let tr = impulse(0.1, 0);
let o1 = sinOsc(tRand(0.3, 5, tr), 0).*+(
	tRand(0, 0.5, tr),
	tRand(0.49, 0.56, tr)
);
let o2 = sinOsc(o1, 0).*+(
	tRand(0.3, 0.6, tr),
	tRand(0.3, 0.5, tr)
);
rhpf(
	brownNoise([1] # 2, 0),
	tRand(0.3, 3, tr),
	o2
) * 0.1
