/* Birdies (Jmcc) #6 */
{
	let p1 = MulAdd(
		LfPulse(0.4 + Rand(0, 1), 0, Rand(0, 0.8) + 0.1),
		Rand(4, 7),
		2
	);
	let p2 = Times(
		LfPulse(0.4 + Rand(0, 1), 0, Rand(0, 0.8) + 0.1),
		Rand(4, 7)
	);
	let p3 = LfPulse(0.2 + Rand(0, 0.5), 0, 0.4);
	let sw = MulAdd(
		LfSaw(p1 + p2, 0),
		(1000 + Rand(0, 800)).-,
		4000 + Rand(-1200, 1200)
	);
	let freq = Lag(sw, 0.05);
	let amp = Lag(p3, 0.3);
	EqPan(SinOsc(freq, 0) * amp, Rand(-1, 1)) * 0.02
}.overlapTextureProgram(7, 4, 4)
