/* 20060925 ; rd */
let t = impulse((lfNoise0([3, 3.25]) * 16) + 18, 0);
let o = bpf(
	whiteNoise() * decay2(t, 0.01, tRand(0.005, mouseY(0.01, 0.15, 0, 0.1), t)),
	tRand(10, mouseX(100, 12000, 0, 0.1), t),
	tRand(0, 1, t)
);
let p = pvRandComb(
	fft(bufAlloc(1, 2048), o, 0.5, 0, 1, 0),
	tExpRand(0.15, 1, t),
	t
);
(o * 0.1).lpz2 + ifft(p, 0, 0)
