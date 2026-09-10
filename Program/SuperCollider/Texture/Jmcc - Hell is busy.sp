/* Hell is busy (Jmcc) #1 */
{
	let e = LfPulse(1 + Rand(0, 10), 0, Rand(0, 0.7)) * 0.04;
	EqPan(SinOsc(400 + Rand(0, 2000), 0) * e, Rand(-1, 1))
}.overlapTextureProgram(4, 4, 8)
