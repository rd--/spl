/* demandSequencer ; Jmcc */
let clock = impulse(xLine(24, 1, 12), 0);
let x = sinOsc(
	demandSequencer(
		dwhite(Infinity, 2000, 12000),
		clock
	),
	0
) * decay2(clock, 0.002, 0.04);
{
	combN(
		x,
		0.1,
		{ expRand(0.02, 0.05) } ! 2,
		2
	) * xLine(0.2, 0.001, 12)
} !+ 2
