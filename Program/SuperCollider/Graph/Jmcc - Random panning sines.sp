/* Random panning sines (Jmcc) #4 */
{ :tr |
	let n = 8;
	{
		let osc = sinOsc(80 + tRand(0, 2000, tr), 0);
		let pos = lfNoise1(0.4 + tRand(0, 0.8, tr));
		let amp = lfNoise1(0.4 + tRand(0, 0.8, tr)) * 0.4 + 0.5;
		eqPan2(osc, pos) * amp
	} !+ n * 0.1 / n
}.overlapTexture(8, 8, 2).mix
