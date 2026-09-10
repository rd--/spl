/* Pulsing bottles (Jmcc) */
let n = 6; /* Number of 'bottles' */
{
	EqPan2(
		Resonz(
			WhiteNoise(),
			400 + LinRand(0, 7000, 0),
			0.01
		),
		SinOsc(0.1 + Rand(0, 0.4), Rand(0, 2.pi))
	) * LfPulse(4 + Rand(0, 10), 0, Rand(0, 0.7)) * 0.8 / n
} !+ n
