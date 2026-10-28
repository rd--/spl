/* slope ; frequency is the slope of phase (scaled) */
let freq = 440;
let rate = 2.pi * freq / sampleRate();
let phase = phasor(1, rate, 0, 2.pi, 0);
[
	sinOsc(freq, 0),
	sinOsc(slope(phase / 1.pi / 2), 0)
] * 0.1
