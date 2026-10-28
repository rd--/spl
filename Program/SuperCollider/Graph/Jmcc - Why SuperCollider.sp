/* Jmcc - Why supercollider? ; #0 */
let s = {
	resonz(
		dust(0.2) * 50,
		200 + rand(0, 3000),
		0.003
	)
} !+ 10;
let x = {
	combL(
		delayN(s, 0.048, 0.048),
		0.1,
		lfNoise1(rand(0, 0.1)) * 0.04 + 0.05,
		15
	)
} !+ 7;
4.timesRepeat {
	x := allpassN(x, 0.050, { rand(0, 0.050) } ! 2, 1)
};
x * 0.2 + s
