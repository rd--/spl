/* Jmcc ; Rethinking ; https://doi.org/10.1162/014892602320991383 */
let numberOfExciters = 10;
let numberOfCombs = 7;
let numberOfAllpass = 4;
let exciterFunction = {
	resonz(
		dust(0.2) * 50,
		200 + rand(0, 3000),
		0.003
	)
};
let in = exciterFunction/0 !+ numberOfExciters;
let predelayed = delayN(in, 0.048, 0.048);
let out = {
	combL(
		predelayed,
		0.1,
		lfNoise1(rand(0, 0.1)) * 0.04 + 0.05,
		15
	)
} !+ numberOfCombs;
numberOfAllpass.timesRepeat {
	out := allpassN(
		out,
		0.050,
		[rand(0, 0.050), rand(0, 0.050)],
		1
	)
};
in + (0.2 * out)
