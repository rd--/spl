/* Reso-pulse (Jmcc) #1 ; Graph rewrite */
let lfoFreq = 6;
let lfo = lfNoise0(lfoFreq) * 1000 + 1200;
let left = rlpf(
	{ :tr |
		let l = [25 30 34 37 41 42 46 49 53 54 58 61 63 66];
		let f = tChoose(tr, l).midiCps;
		lfPulse(f, 0, 0.2) + lfPulse(2 * f + tRand(-0.5, 0.5, tr), 0, 0.2)
	}.overlapTexture(4, 2, 4).sum * 0.02,
	lfo, /* cutoff freq */
	mouseX(0.2, 0.02, 1, 0.2) /* Filter bandwidth */
);
let delayTime = 2 / lfoFreq; /* Delay right channel by two beats */
let right = delayC(left, delayTime, delayTime);
[left, right]
