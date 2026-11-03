/* sequencer ; Audio rate */
let freq = sequencer([60 62 65 69], impulse(2, 0)).midiCps;
sinOsc(freq, 0) * 0.1

/* sequencer ; Control rate */
let freq = sequencer([60 62 65 69], impulse(2, 0).kr).midiCps;
sinOsc(freq, 0) * 0.1

/* sequencer ; Jmcc */
let clock = impulse(8, 0);
let trig1 = impulseSequencer([0.4 0.1 0.2 0.1], clock);
let root = sequencer([24 26 24 22], pulseDivider(clock, 64, 0));
let x = rlpf(
	greyNoise([0.4] # 2, 0) * decay2(trig1, 0.005, 0.7),
	mouseX(200, 8000, 1, 0.2),
	0.2
).distort;
let trig2 = impulseSequencer([0.4 0 0.1 0.1 0.4 0.1 0.1 0.1], clock);
let freq = (sequencer([33 33 35 36 45 47 38 40 33 33 35 36 47 48 50 52], clock) + root).midiCps;
let z = varSaw(freq * [1, 1.505], 0, mouseY(0, 1, 0, 0.2)) * decay2(trig2, 0.005, 1.4);
combN(x + z * 0.5, 0.26, 0.26, 4).softClip

/* sequencer ; Jmcc */
let p = drand(Infinity, [
	dseq(1, [0 0 1 2 7 8 9 8 10 10 1 2 1 2 3 4 0 0 1 2 7 8 9 8 11 11 1 2 1 2 3 4]),
	dseq(2, [0 0 1 2 7 8 3 4 0 0 1 2 1 2 3 4 0 0 1 2 7 8 3 4 0 0 1 2 1 2 3 4])
]);
let clock = impulse(12, 0);
let root = sequencer([57, 59, 62, 55], pulseDivider(clock, 128, 0));
let trig1 = impulseSequencer(
	[1 0 0 0 1 0 0 1 1 0 0 0 1 0 0 1 1 0 0 0 1 0 0 1 1 0 1 0 1 0 1 1],
	pulseDivider(clock, 2, 0)
);
let r = lpf(
	rlpf(
		brownNoise([1] # 2, 0) * decay2(trig1, 0.005, 0.7) * 3,
		mouseX(200, 300, 1, 0.2),
		0.4
	).distort,
	800
);
let trig2 = impulseSequencer([0.4 0.1 0.2 0.1], clock);
let x = rlpf(
	greyNoise([0.4] # 2, 0) * decay2(trig2, 0.005, 0.3),
	mouseX(200, 8000, 1, 0.2),
	0.2
).distort;
let scale = [0 2 3 5 7 8 10].localBuf;
let trig3 = impulseSequencer([0.4 0 0.1 0.1 0.4 0.1 0.1 0.1] * 1.5, clock);
let freq = (degreeToKey(scale, demand(clock, 0, p), 12) - 12 + root).midiCps;
let z = rlpf(
	varSaw(freq * [1, 1.505], 0, mouseY(0, 1, 0, 0.2)) * decay2(trig3, 0.005, 0.8),
	mouseX(200, 8000, 1, 0.2),
	0.2
).distort;
let trig4 = impulseSequencer(
	[1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1] * 0.2,
	clock
);
let y = sinOsc((root + 24).midiCps, 0) * decay2(trig4, 0.005, 0.2);
let trig5 = impulseSequencer([1 31 4] # [1 0 1] * 0.3, clock);
let w = sinOsc((root + 24 + 7).midiCps, 0) * decay2(trig5, 0.005, 0.2);
let snd = (r * 0.1 + x + z + [y, w]) * 0.4;
(combN(snd, 0.51, 0.51, 4) * 0.4 + snd.reverse).softClip

/* sequencer ; Jmcc */
let middleC = 256.5;
let pattern = [1/1 6/5 3/2 9/5 2/1 12/5 3 18/5] * middleC;
let detune = [-0.04 0.04];
let seq = { :a :b :c :d |
	smoothSaw(
		sequencer(
			pattern * a,
			impulse(b, 0)
		) + detune,
		c
	) * d
};
combN(
	seq(0.25, 1, 5, 1.4)
	+ seq(1, 2, 4, 1)
	+ seq(2, 4, 3, 0.7),
	3 / 8, 3 / 8,
	4
) * line(0, 0.1, 2)
