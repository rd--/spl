/* Birdies (Jmcc) #6 */
{
	let p1 = lfPulse(
		0.4 + rand(0, 1),
		0,
		rand(0, 0.8) + 0.1
	).*+(
		rand(4, 7),
		2
	);
	let p2 = lfPulse(0.4 + rand(0, 1), 0, rand(0, 0.8) + 0.1) * rand(4, 7);
	let p3 = lfPulse(0.2 + rand(0, 0.5), 0, 0.4);
	let sw = lfSaw(p1 + p2, 0).*(
		(1000 + rand(0, 800)).-,
		4000 + rand(-1200, 1200)
	);
	let freq = lag(sw, 0.05);
	let amp = lag(p3, 0.3);
	eqPan(sinOsc(freq, 0) * amp, rand(-1, 1)) * 0.02
}.overlapTextureProgram(7, 4, 4)
