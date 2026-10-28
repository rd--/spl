/* Wind metals (Jmcc) */
{
	let n = 6;
	let env = (lfNoise1(expRand(0.125, 0.5)) * 0.75 + 0.25).max(0);
	let exc = brownNoise([0.007] # 2, 0) * env;
	let freq = { rand(0, rand(500, 8000)) + expRand(60, 4000) } ! n;
	let time = { rand(0.1, 2) } ! n;
	let s = ringzBank(exc, freq, nil, time);
	(s * 0.1).softClip
}.overlapTextureProgram(5, 2, 12)
