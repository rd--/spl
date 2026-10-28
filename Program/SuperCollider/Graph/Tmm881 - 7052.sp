/* http://scsynth.org/t/7052 ; tmm881 ; graph texture rewrite ; requires=XFadeTexture */
{ :tr |
	let freqMul = tRand(0.5, 2, tr);
	let env = {
		let freq = tChoose(tr, [10, 5, 2.5]) * freqMul;
		perc([lfClipNoise(freq), lfNoise0(freq)], 0.01, 1, -4)
	};
	let snd = [
		sinOsc([[48, 49]] * freqMul, 0) * env(),
		saw(48 * 16 * freqMul) * env(),
		pulse(48 * 32 * freqMul, 0.5) * env()
	].sum.transpose.mix;
	let rev = freeVerb(snd, 0.33, 0.5, 0.5) + snd;
	combC(rev, 0.2, 0.2, 1) + rev * 0.05
}.xFadeTexture(9, 2)
