/* Pulsing bottles (Jmcc) */
let n = 6; /* Number of 'bottles' */
{
	eqPan2(
		resonz(
			whiteNoise(),
			400 + linRand(0, 7000, 0),
			0.01
		),
		sinOsc(0.1 + rand(0, 0.4), rand(0, 2.pi))
	) * lfPulse(4 + rand(0, 10), 0, rand(0, 0.7)) * 0.8 / n
} !+ n
