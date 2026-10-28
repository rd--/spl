/* http://sccode.org/1-V (Nv) L1 */
let a = pinkNoise([1] # 2, 0);
50.timesRepeat {
	let f = linExp(lfNoise1(rand(0, 0.05)), -1, 1, 40, 15000);
	a := bBandStop(a, f, expRand(0.1, 2))
};
lpf(a, 100000)
