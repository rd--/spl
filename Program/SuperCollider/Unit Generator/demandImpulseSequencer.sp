/* demandImpulseSequencer ; Jmcc */
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
}.overlapTexture(4, 2, 2)
.mix
.scaleNegative(
	mouseX(-1, 1, 0, 0.2)
);
let snd = x + (y * 0.5) + s + r;
6.timesRepeat {
	snd := allpassN(
		lpz2(snd),
		0.03,
		{ rand(0, 0.03) } ! 2,
		5
	)
};
snd
