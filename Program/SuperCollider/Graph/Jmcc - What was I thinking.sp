/* What was I thinking? (Jmcc) */
let z = rlpf(
	pulse(
		decay(lfPulse(0.1, 0, 0.05) * impulse(8, 0) * 500, 2).max(
			sinOsc(4, 0) + 80
		),
		lfNoise1(0.157) * 0.4 + 0.5
	) * 0.04,
	lfNoise1(0.2) * 2000 + 2400,
	0.2
);
let y = z * 0.6;
{
	{
		combL(y, 0.06, lfNoise1(rand(0, 0.3)) * 0.025 + 0.035, 1)
	} !+ 2
} ! 2 + z
