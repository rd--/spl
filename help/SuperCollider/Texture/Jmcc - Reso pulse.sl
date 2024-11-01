/* Reso-pulse ; Jmcc #1 ; Move post-processing inwards ; Requires timed scheduling at synthesiser */
{
	let lfoFreq = 6;
	let lfo = LfNoise0(lfoFreq) * 1000 + 1200;
	let f = [25, 30, 34, 37, 41, 42, 46, 49, 53, 54, 58, 61, 63, 66].atRandom.MidiCps;
	let z = LfPulse(f, 0, 0.2) + LfPulse(2 * f + Rand(-0.5, 0.5), 0, 0.2);
	let left = Rlpf(
		z * 0.02,
		lfo, /* cutoff freq */
		MouseX(0.2, 0.02, 1, 0.2) /* filter bandwidth */
	);
	let delayTime = 2 / lfoFreq;
	let right = DelayC(left, delayTime, delayTime); /* delay right channel by two beats */
	[left, right]
}.overlapTextureProgram(4, 2, 4)
