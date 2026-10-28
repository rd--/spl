/* mVerb ; static ; requires=keyword */
let in = resonz({ dust([0.3, 0.33]) } ! 3, 3333, 0.01).sum * 33;
mVerb(
	in1: in[1],
	in2: in[2],
	dampingFreq: 0.1,
	density: 0.5,
	bandwidthFreq: 0.9,
	decay: 0.5,
	preDelay: 0.1,
	size: 0.6,
	gain: 1,
	mix: 0.5,
	earlyMix: 0.5
)

/* mVerb ; dynamic */
let freq = [1, 2.1, 2.9] * 1000;
let src = resonz({ dust([0.25, 0.5]) } ! 3, freq, 0.01).sum * 33;
let noiseIn = { :min :max |
	lfNoise2(1).linLin(-1, 1, min, max)
};
let dampingFreq = 0.1;
let density = noiseIn(0.1, 0.9);
let bandwidthFreq = noiseIn(0.1, 0.9);
let decay = noiseIn(0.1, 0.9);
let preDelay = 0.1;
let size = 0.9;
let gain = 1;
let mix = noiseIn(0.1, 0.9);
let earlyMix = noiseIn(0.1, 0.9);
mVerb(src[1], src[2], dampingFreq, density, bandwidthFreq, decay, preDelay, size, gain, mix, earlyMix)
