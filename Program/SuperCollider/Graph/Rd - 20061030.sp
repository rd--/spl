/* 20061030 ; rd */
let tr = dust([12 18]);
let f = lfNoise0(tRand(1, 64, tr)) * [9000 12000] + 9500;
let o = [
	f,
	f * tRand(0.750, 0.7505, tr),
	f * tRand(0.975, 1.025, tr)
].saw.mix;
(o * tRand(0.0, 0.5, tr)).clip(-0.75, 0.75) * 0.15
