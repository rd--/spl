/* https://scsynth.org/t/6452 ; requires=SinGrain */
let tr = impulse(100 * line(0.1, 10, 15), 0);
sinGrain(tr, 0.05, tRand(322, 3222, tr)) * 0.1

/* https://scsynth.org/t/6452 ; rd edit */
let k = 8;
let tr = impulse(100 * line(0.1, 10, 15), 0);
grainSin(k, tr, line(1, 0.25, 15), tRand(322, 3222, tr), tRand(-1, 1, tr), -1, 2048).splay / 99

/* https://scsynth.org/t/6452 ; rd edit */
let k = 8;
let tr = impulse(line(1, 50, 30), 0);
grainFm(
	8,
	tr,
	tRand(1, 10, tr),
	tRand(322, 3222, tr),
	tRand(322, 3222, tr),
	1,
	tRand(-1, 1, tr),
	-1,
	2048
).splay / 99

/* https://scsynth.org/t/6452 ; rd edit */
let tr = impulse(1 * line(0.1, 10, 90), 0);
let k = 8;
let carFreq = tRand(322, 3222, tr);
let modFreq = tRand(322, 3222, tr);
let pan = tRand(-1, 1, tr);
grainFm(k, tr, 0.1, carFreq, modFreq, 1, pan, -1, 128).splay / 99

/* https://scsynth.org/t/6452 */
let o1 = saw([2000 200 1000 4000]) * perc(impulse(5 * [2 0.5 0.25 0.125], 0), 0.01, 1, -4);
let o2 = sinOsc(128, 0) * perc(impulse(5 * 0.125, 0), 0.01, 1, -4);
(o1.sum + o2) / 5

/* https://scsynth.org/t/6452 */
let f = { :p |
	let f1 = p.first; let f2 = p.second; let l1 = 0.125; let l2 = 8;
	let o1 = { sinOsc(rand(f1, f2) * line(l1, l2, 60), 0) } !+ 128;
	let o2 = { sinOsc(rand(f1, f2) * line(l2, l1, 60), 0) } !+ 128;
	(o1 + o2) / 128
};
f([20 20000; 20 200; 200 2000; 2000 20000].atRandom)

/* https://scsynth.org/t/6452 */
let f = { :p |
	let f1 = p.first; let f2 = p.second; let l1 = 0.5; let l2 = 2;
	let tr = impulse(10, 0);
	let o1 = { sinOsc(tRand(f1, f2, tr) * line(l1, l2, 60), 0) } !+ 128;
	let o2 = { sinOsc(tRand(f1, f2, tr) * line(l1, l2, 60), 0) } !+ 128;
	(o1 + o2) / 128
};
f([20 20000; 20 2000; 200 2000; 20 200].atRandom)
