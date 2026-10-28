/* http://sccode.org/1-4Qy ; tweet0008 */
let x = lfNoise1([0.5, 0.5]);
formlet(
	crackle(linLin(x, -1, 1, 1.8, 1.98)),
	lag(tExpRand(200, 2000, x), 2),
	linLin(x, -1, 1, 0.0005, 0.001),
	0.0012
) * 0.25
