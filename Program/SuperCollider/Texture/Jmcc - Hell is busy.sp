/* Hell is busy (Jmcc) #1 */
{
	let e = lfPulse(1 + rand(0, 10), 0, rand(0, 0.7)) * 0.04;
	eqPan(sinOsc(400 + rand(0, 2000), 0) * e, rand(-1, 1))
}.overlapTextureProgram(4, 4, 8)
