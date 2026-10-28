/* http://earslap.com/weblog/music-release-laconicism.html */
let k = duty(6.4, 0, dseq(Infinity, [0.05, drand(1, [0.04, 0.08])]));
integrator((lfNoise0([5, 5, 5]) * k).round(k / 10), 1).sin.signedSqrt.tanh.splay2(0.3,1, 0, true)

/* http://earslap.com/weblog/music-release-laconicism.html ; wait */
let x = lfNoise1(0.5 * localIn(1, 0) + 0.1) * 0.5 + 0.5;
let s = pitchShift(
	pitchShift(
		pulse([90, 90.01], x),
		10,
		x * 4,
		x,
		0
	),
	10,
	4 - (x * 4),
	1 - x,
	0
);
s <! localOut(x)

/* http://earslap.com/weblog/music-release-laconicism.html ; wait */
let q = [0 3 5 7 10];
let t = impulse(4, 0) * lfNoise0(500) > 0;
let f = demand(t, 0, drand(Infinity, (q + 12 ++ q + 33).midiCps));
pitchShift(saw(f) * decay(t, 3), 7, 2, 0, 0)

/* http://earslap.com/weblog/music-release-laconicism.html */
let snd = hpf(
	pulse([0.1 0.11; 0.12 0.13], 0.6) * 0.005,
	99
);
hpf(
	midEq(
		limiter(gVerb(snd, [1 1.25; 1.5 2], 99, 0.5, 0.5, 15, 1, 0,7, 0.5) * 300, 1, 0.01) * 0.1,
		9000,
		0.9,
		9
	),
	200
).sum.transpose.mix

/* http://earslap.com/weblog/music-release-laconicism.html ; wait */
let f = localIn(2, 0).tanh;
let k = latch(f.first.abs, impulse(0.5, 0));
f <! localOut(f + allpassN(pulse([2, 3], k * 0.01 + 0.000001) * 0.9, 1, k * 0.3, 100 * k))

/* http://earslap.com/weblog/music-release-laconicism.html */
let a = bpf(saw([40, 40.001]), lfNoise0(128) + 1 * 4000 + 146, lfNoise1(1) + 1 * 0.05 + 0.01).tanh;
combC(a, 9, a.abs.lag(2) * 9, a.abs.lag(1) * 100)

/* http://earslap.com/weblog/music-release-laconicism.html */
let f = localIn(2, 0).tanh;
let k = latch(f.first.abs, impulse(1 / 4, 0));
f <! localOut(f + combC(blip([4, 6], 100 * k + 50) * 0.9, 1, k * 0.3, 50 * f))

/* http://earslap.com/weblog/music-release-laconicism.html */
let tr = impulse(8, 0) * lfNoise1(2);
combL(
	(saw([3, 4]) * decay(tr, 0.1)).tanh,
	1,
	tRand(0, 0.01, tr).round(0.00015),
	tRand(-30, 30, tr)
)

/* http://earslap.com/weblog/music-release-laconicism.html */
let f = [60, 61];
let l = lfNoise0(6);
let o = (lfNoise0(4).max(l).max(sinOsc(f * (l * 9).ceiling.lag(0.1), 0) * 0.7));
(bBandPass(o, f, lfNoise0(1).abs / 2) * 700 * l.lag(1)).tanh

/* http://earslap.com/weblog/music-release-laconicism.html */
let t = [0 0 0 1 5 7 10 12 12 12] + 30;
let a = duty(1 / 8, 0, drand(Infinity, t + 24 ++ t ++ t));
(bHiPass(lfNoise1(8) ^ 6, [a, a + 7].midiCps, a / 3000) * (67 - a)).tanh

/* http://earslap.com/weblog/music-release-laconicism.html */
allpassL(sinOsc(55,0).tanh, 0.4, tExpRand(0.0002, 0.4, impulse(8, 0)).round([0.002, 0.004]), 2)

/* http://earslap.com/weblog/music-release-laconicism.html */
let i = { :freq | impulse(freq, 0) };
let ph = integrator(integrator(i(64).lag(lfNoise1([2, 2]) * 2 + 2) * 99, 0.9), 0.99).fold(-1.pi, 1.pi);
sinOsc(lagUd(impulse(2, 0), 0, 0.4) * 360, ph) / 3

/* http://earslap.com/weblog/music-release-laconicism.html */
let t = [0 3 5 7 10 12] + 40;
let p = duty(1 / 4, 0, drand(Infinity, (t + 12 ++ t).midiCps));
let b = tRand(1500, 2000, impulse(16, 0)).lag(0.1);
blip([b, b + p], 1).mean ^ 2

/* http://earslap.com/weblog/music-release-laconicism.html */
let i = impulse(8, 0).lag(0.3);
10.timesRepeat {
	i := leakDc(allpassC(i, 1, lfNoise0(8).linLin(-1, 1, 0.00001, 0.2), -0.15) * lfNoise0(8).linLin(-1, 1, 1, 3), 0.995).tanh
};
i

/* http://earslap.com/weblog/music-release-laconicism.html */
let v = blip([20000, 20000 - 9], 1) * (lfNoise0(16) * 0.5 + 0.5 ^ 9);
42.timesRepeat {
	v := leakDc(allpassC(v, 1, lfNoise0(5) * 0.05 + (0.05 + 0.001), 100), 0.995)
};
(v * 99).tanh

/* http://earslap.com/weblog/music-release-laconicism.html */
(hpf(lfNoise1(2), [10, 10.1]) * 100).tanh

/* http://earslap.com/weblog/music-release-laconicism.html ; requires=kr */
let x = duty(1 / 8, 0, drand(Infinity, [0, drand(1, [0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1])]));
leakDc(brf(saw(8) * decay2(x, 0.01, 0.3).kr ^ 1.5, x * 20 + [45.1, 45], 0.1), 0.995).tanh

/* http://earslap.com/weblog/music-release-laconicism.html ; wait */
let v = blip([60, 61], 5) * (lfNoise0(4).*+(1, 0) ^ 8);
12.timesRepeat {
	v := leakDc(combC(v, 1, lfNoise0(1).*+(0.05, 0.06).lag(5000), 9), 0.995)
};
limiter(v, 0.9, 1)

/* http://earslap.com/article/recreating-the-thx-deep-note.html ; 30 oscillators together, distributed across the stereo field */
let numVoices = 30;
let fundamentals = { rand(200, 400) } ! numVoices;
fundamentals.collect { :freq |
	eqPan(
		saw(freq),
		rand(-1, 1)
	) * numVoices.reciprocal
}.sum

/* http://earslap.com/article/recreating-the-thx-deep-note.html ; adding random wobbling to freqs, sorting randoms, lowpassing ; fundamentals are sorted, so higher frequencies drift more */
let numVoices = 30;
let fundamentals = system.randomReal([200 400], [numVoices]).sortInPlace;
fundamentals.withIndexCollect { :freq0 :index |
	let freq = freq0 + (lfNoise2(0.5) * 3 * index);
	eqPan(
		bLowPass(saw(freq), freq * 5, 0.5),
		rand(-1, 1)
	) * numVoices.reciprocal
}.sum

/* http://earslap.com/article/recreating-the-thx-deep-note.html ; inverting init sort, louder bass, final volume envelope, some little tweaks ; requires=CurveGen */
let numVoices = 30;
let fundamentals = system.randomReal([200 400], [numVoices]).sortInPlace.reverse;
let finalPitches = ([1 .. numVoices].collect { :each |
	(each / (numVoices / 6)).round(1) * 12
} + 14.5).midiCps;
let outerEnv = curveGen(1, [0 0.1 1], [8 4], [2 4]);
let ampEnvelope = curveGen(1, [0 1 1 0], [3 21 3], [2 0 -4]);
let snd = [1 .. numVoices].collect { :numTone |
	let initRandomFreq = fundamentals[numTone] + (lfNoise2(0.5) * 6 * (numVoices - numTone));
	let destinationFreq = finalPitches[numTone] + (lfNoise2(0.1) * numTone / 3);
	let sweepEnv = curveGen(1, [0, rand(0.1, 0.2), 1], [rand(5.5, 6), rand(8.5, 9)], [rand(2, 3), rand(4, 5)]);
	let freq = ((1 - sweepEnv) * initRandomFreq) + (sweepEnv * destinationFreq);
	eqPan(
		bLowPass(saw(freq), freq * 6, 0.6),
		rand(-1, 1)
	) * (1 - (1 / numTone)) * 1.5 / numVoices
}.sum;
limiter(bLowPass(snd, 2000 + (outerEnv * 18000), 0.5) * (2 + outerEnv) * ampEnvelope, 1, 0.01)

/* http://earslap.com/article/sctweeting.html */
let a = localIn(1, 0);
let x = sinOsc((decay(impulse([4, 4.005], 0), 1000 * a.abs) * 50), a).distort;
x <! localOut(x.sum)

/* http://earslap.com/article/sctweeting.html ; wait to start */
let f = localIn(2, 0).tanh;
let k = latch(f.first.abs, impulse(0.5, 0));
f <! localOut(f + allpassN(pulse([2, 3], k * 0.01 + 0.000001) * 0.9, 1, k * 0.3, 100 * k))

/* http://earslap.com/article/sctweeting.html ; requires=kr */
let f = localIn(2, 0).tanh;
let k = latch(f.first.abs.a2K, impulse(1 / 4, 0).kr);
f <! localOut(f + combC(blip([4, 6], 100 * k + 50) * 0.9, 1, k * 0.3, 50 * f))

/* http://earslap.com/article/sctweeting.html */
let f = localIn(2, 0).tanh;
let k = latch(f.first.abs, impulse(1 / 4, 0));
f <! localOut(f + combC(blip([4, 6], 100 * k + 50) * 0.9, 1, k * 0.3, 50 * f))

/* http://earslap.com/article/sctweeting.html */
{
	let a = lfNoise1(rand(0, 0.2));
	delayC(
		bpf(
			whiteNoise() * dust2(a * a * 4 ^ 2).lag(0.008),
			iRand(0, 10000) + 300,
			0.09
		),
		3,
		a * 1.5 + 1.5
	) * 45
} !+ 80

/* http://earslap.com/article/sctweeting.html */
allpassC(
	sinOsc(55, 0).tanh,
	0.4,
	tExpRand(0.0002, 0.4, impulse(8, 0)).round([0.002, 0.0004]),
	2
)
