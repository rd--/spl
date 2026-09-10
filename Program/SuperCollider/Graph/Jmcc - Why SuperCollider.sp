/* Jmcc - Why supercollider? ; #0 */
let s = {
	Resonz(
		Dust(0.2) * 50,
		200 + Rand(0, 3000),
		0.003
	)
} !+ 10;
let x = {
	CombL(
		DelayN(s, 0.048, 0.048),
		0.1,
		LfNoise1(Rand(0, 0.1)) * 0.04 + 0.05,
		15
	)
} !+ 7;
4.timesRepeat {
	x := AllpassN(x, 0.050, { Rand(0, 0.050) } ! 2, 1)
};
x * 0.2 + s
