/* latoocarfianC ; randomly modulate all params */
latoocarfianC(
	sampleRate() / 4,
	lfNoise2(2) * 1.5 + 1.5,
	lfNoise2(2) * 1.5 + 1.5,
	lfNoise2(2) * 0.5 + 1.5,
	lfNoise2(2) * 0.5 + 1.5,
	0.5,
	0.5
) * 0.1

/* latoocarfianC ; texture */
{ :tr |
	let freq = tRand(400, sampleRate() / 3, tr);
	let a = tRand(-3, 3, tr);
	let b = tRand(-3, 3, tr);
	let c = tRand(0.5, 1.5, tr);
	let d = tRand(0.5, 1.5, tr);
	sinOsc(freq, 0) * 0.05 + pan2(latoocarfianC(freq, a, b, c, d, 0.5, 0.5), tRand(-1, 1, tr), 0.05)
}.overlapTexture(1, 4, 8).mix
