/* Wind metals (Jmcc) */
{
	let n = 6;
	let env = (LfNoise1(ExpRand(0.125, 0.5)) * 0.75 + 0.25).Max(0);
	let exc = BrownNoise(0.007 # 2, 0) * env;
	let freq = { Rand(500, 8000).Rand0 + ExpRand(60, 4000) } ! n;
	let time = { Rand(0.1, 2) } ! n;
	let s = RingzBank(exc, freq, nil, time);
	(s * 0.1).SoftClip
}.overlapTextureProgram(5, 2, 12)
