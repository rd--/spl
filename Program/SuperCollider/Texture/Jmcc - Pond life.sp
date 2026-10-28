/* Pond life ; Jmcc ; #1 */
{
	let f = *+(
		sinOsc(20 + rand(0, 30), 0),
		100 + rand(0, 300),
		500 + linRand(0, 2000, 0)
	);
	let e = lfPulse(3 / (1 + rand(0, 8)), 0, 0.2 + rand(0, 0.3));
	eqPan(
		sinOsc(f, 0) * e,
		rand(-1, 1)
	) * 0.04
}.overlapTextureProgram(8, 8, 4)
