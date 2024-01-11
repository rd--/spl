{- MVerb ; static ; requires=keyword -}
let in = Resonz({ Dust([0.3, 0.33]) } ! 3, 3333, 0.01).Sum * 33;
MVerb(
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

{- MVerb ; dynamic -}
let freq = [1, 2.1, 2.9] * 1000;
let src = Resonz({ Dust([0.25, 0.5]) } ! 3, freq, 0.01).Sum * 33;
let noiseIn = { :min :max |
	LfNoise2(1).Range(min, max)
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
MVerb(src[1], src[2], dampingFreq, density, bandwidthFreq, decay, preDelay, size, gain, mix, earlyMix)
