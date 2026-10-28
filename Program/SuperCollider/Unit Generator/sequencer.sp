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
let z = 0; let a = 0.1; let b = 0.2; let c = 0.4;
let p = dseq(1, [
	dseq(2, [c z z z z z z z]),
	dseq(2, [c z z b z z b z c z z z b z b a]),
	drand(Infinity, [
		dseq(2, [c z z b z z b z c z b z c z b z]),
		dseq(2, [c z a b z a b z c z b z c a b a]),
		dseq(2, [c a a b z a b a c z b z c a b a]),
		dseq(2, [c a a b z a b a c z b z z b a a]),
		dseq(2, [c z z z z z z z]),
		dseq(2, [c z z b z z b z c z z z b z b a])
	])
]);
let q = drand(Infinity, [
	dseq(2, [c z b z a a a a b z b z z z b z]),
	dseq(2, [c z z z z z z z b z b z z z c z]),
	dseq(2, [c z z z a z z z b z b z a z c z])
]);
let clock = impulse(9, 0);
/* bass drum */
let trig1 = pulseDivider(clock, 16, 0);
let r = sinOsc(80, 0) * decay2(trig1, 0.005, 0.5) * 0.3;
/* drum */
let trig2 = demandImpulseSequencer([p], clock);
let exc2 = whiteNoise() * decay2(trig2, 0.005, 0.05);
let x = ringzBank(exc2, { rand(80, 800) } ! 4, nil, { rand(0.05, 0.2) } ! 4).distort * 0.2;
/* metallic */
let trig3 = demandImpulseSequencer([q], clock);
let exc3 = whiteNoise() * decay2(trig3, 0.005, 0.05);
let s = ringzBank(exc3, { rand(3500, 4000) } ! 4, nil, { rand(0.05, 0.2) } ! 4).distort * 0.1;
/* whine */
let exc4 = greyNoise([0.0007] # 2, 0);
let y = { :tr |
	let env = sinOsc(tRand(1, 6, tr), { tRand(0, 2.pi, tr) } ! 2) * 0.5 + 0.5;
	dynRingzBank(
		exc4,
		{ tiRand(200, 2500, tr) } ! 4,
		[1],
		{ tRand(0.2, 0.8, tr) } ! 4
	) * env
}.overlapTexture(4, 2, 2).mix.scaleNegative(mouseX(-1, 1, 0, 0.2));
let snd = x + (y * 0.5) + s + r;
6.timesRepeat {
	snd := allpassN(lpz2(snd), 0.03, { rand(0, 0.03) } ! 2, 5)
};
snd

/* sequencer ; Jmcc */
let clock = impulse(xLine(24, 1, 12), 0);
let x = sinOsc(demandSequencer(dwhite(Infinity, 2000, 12000), clock), 0) * decay2(clock, 0.002, 0.04);
{
	combN(x, 0.1, { expRand(0.02, 0.05) } ! 2, 2) * xLine(0.2, 0.001, 12)
} !+ 2
