/* Birdies (Jmcc) #6 */
{
	let p1 = MulAdd(
		LfPulse(0.4 + 1.Rand0, 0, 0.8.Rand0 + 0.1),
		Rand(4, 7),
		2
	);
	let p2 = Mul(
		LfPulse(0.4 + 1.Rand0, 0, 0.8.Rand0 + 0.1),
		Rand(4, 7)
	);
	let p3 = LfPulse(0.2 + 0.5.Rand0, 0, 0.4);
	let sw = MulAdd(
		LfSaw(p1 + p2, 0),
		(1000 + 800.Rand0).-,
		4000 + 1200.Rand2
	);
	let freq = Lag(sw, 0.05);
	let amp = Lag(p3, 0.3);
	EqPan(SinOsc(freq, 0) * amp, 1.Rand2) * 0.02
}.overlapTextureProgram(7, 4, 4)
