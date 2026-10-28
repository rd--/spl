/* http://www.fredrikolofsson.com/f0blog/?q=node/619 */
let freq = [100 300 400].atRandom;
let amp = 0.1;
let fb = [1 2 3].atRandom;
let del = [0.01 0.02 0.1 0.5].atRandom;
let lfo = [1 15 100 200].atRandom;
let rate = [0.01 2].atRandom;
let cutoff = [100 500].atRandom;
let env = perc(1, 1, 4, -4);
let lin = delayN(hpf(localIn(1, [0]), cutoff), 1, del);
let src = sinOsc(freq + (sinOsc(rate, 0) * lfo), lin * 2.pi * fb) * amp * env;
eqPan2(src <! localOut(src), 0)

/* pkt 07 (f0) ; https://fredrikolofsson.com/f0blog/pact-februari/ ; helper */
let sinOsc = { :f :l :r |
	linExp(sinOsc(f, 0), -1, 1, l, r)
};
gVerb(
	leakDc(
		sinOsc(
			sinOsc(
				sinOsc(
					sinOsc(
						sinOsc(
							sinOsc(
								sinOsc(1, 0) * 2 + sinOsc(1 / 2, 1, 2),
								0
							) * 8 +	sinOsc(1 / 4, 4, 8),
							0
						) * 32 + sinOsc(1 / 8, 16, 32),
						0
					) * 128 + sinOsc(1 / 16, 64, 128),
					0
				) * 512 + sinOsc(1 / 32, 256, 512),
				0
			) * 2048 + sinOsc(1 / 64, 1024, 2048),
			0
		) * 0.1,
		0.995
	),
	16, 8, 0.75, 0.5, 15, 1, 0.7, 0.5, 300
) * 0.25

/* Red frik (F0) */
let tr = impulse(0.1, 0);
let o1 = sinOsc(tRand(0.3, 5, tr), 0) * tRand(0, 0.5, tr) + tRand(0.49, 0.56, tr);
let o2 = sinOsc(o1, 0) * tRand(0.3, 0.6, tr) + tRand(0.3, 0.5, tr);
rhpf(
	brownNoise([0.1 0.1], 0),
	tRand(0.3, 3, tr),
	o2
)

/* https://sccode.org/1-4S6 ; f0 ; 't' */
let p = saw([3, 4]) * (saw(1) * 32 + 128) + duty(1, 0, (dseq(1, [0, 8, 1, 5]) * [1, 4, 8]).flop);
let o = sinOsc(saw(3) * 64 + 99, p) / 9;
combN(o, 1 / 4, 1 / 2.125, sinOsc(0.005, 1.5.pi).linLin(-1, 1, 0, 6)).transpose.sum

/* tw 0120 (f0) ; requires=kr */
let z = lfTri(1 / [7 8], 0) * lfTri(1 / 9, 0) * 99;
let l = [60 .. 79].midiCps;
let f = selectT(z, l);
let w = lfTri(1 / [3, 4], 0) % 1;
let o = varSaw(f.kr, 0, w.kr);
combN(o, 1, 1 / [5, 6], 8) / 8

/* tw 0121 (f0) ; requires=kr */
let z = sinOsc(1 / [8, 7], 0) * sinOsc(1 / 30, 0) * 9;
let l = [0 .. 7] * 6 + 56;
let m = sinOsc(1 / [4, 3], 0);
let o = sinOsc(selectT(z, l).kr.midiCps, 0) * m;
combN(o, 1, 1 / [6, 5], 9).tanh * 0.1

/* tw 0134 (f0) */
let n = 50;
[1 .. n].collect { :i |
	ringz(
		blip(lfSaw(i + 1 / [3, 4], 0) > (lfSaw(i + 1 / 8, 0) + 1) * (n / 2) + n, i + [2, 3]) *
		lfSaw(i + 1 / n, i / (n / 2)), i + 1 * (n * 2 - 1),
		0.1
	)
}.mean / 5

/* https://sccode.org/1-4Qy ; f0 ; 0233 ; requires=kr */
let b = 1 / [1 4 6 8 11];
let c = lfTri(b / 98, 0);
let q = dseq(Infinity, selectT(lfTri(b / 99, 0) + c * 5, 1 / b + 59).kr).midiCps;
splay(lfTri(duty(b, c, q) + c, 0) / 3)

/* https://sccode.org/1-4Qy ; f0 ; 0246 ; requires=DynRingzBank */
let b = [1 .. 9] * 1.5;
let d = [2 / b, 3 / b];
let e = lfPulse(d, 0, 0.5);
combC(
	dynRingzBank(e, (lfPulse(1 / b, 0, 0.5) * b + 50).midiCps, 0.0002, b / 9),
	2,
	2 - lpf(e, 50),
	1
).transpose.sum

/* https://sccode.org/1-4Qy ; f0 ; 0318 */
let b = [1 .. 3];
let o1 = sinOscFb(13 * 13 * b, 1 / 3);
let o2 = sinOscFb(b / 13, 1);
let o3 = sinOscFb(1 / [13 .. 3; -1], 0) + 133 * b;
let o4 = sinOscFb(b, 1) % 1;
let o5 = sinOscFb(b / 333, o4) % 1;
let o6 = sinOscFb(o3, o5);
splay(o1 * o2 / 13 + o6) / 3

/* https://sccode.org/1-4Qy ; f0 ; 0333 ; splay/Stereo */
[0 .. 7].collect { :i |
	let b = i + 2 * 99;
	let f = sinOscFb(i + 1 / 150, 0).round(1) + 1 + i * 99 + sinOscFb([3, 2], 0);
	(formant(f, b, b) * sinOscFb(i + 1 / 130, 0).max(0)).tanh
}.sum.splay / 7

/* https://sccode.org/1-4Qy ; f0 ; tweet0350 ; splay */
let b = [9 .. 1; -1] / 99;
let o = lfSaw(lfSaw(b, b) + 1 * 99, b) * (lfSaw(lfSaw(b, 0) > b, 0) > 0.9);
combN(
	gVerb(o, 99, 1, b * 9, b, 15, 1, 0.7, 0.5, 300) / 19,
	1,
	b / 9.9,
	9
).transpose.sum.splay * 0.9

/* f0 ; https://twitter.com/redFrik/status/1105496695637454848 ; requires=kr */
let b = [1 .. 15] + 1 / 151;
let w = (varSaw(b, b, 1 / 5.15) * 1 + 1.5).ceiling;
let s = selectT((varSaw(1 / 15, 1 / 5, b) * 5).ceiling + 5 / 5, [51 * 1.5, 51, 151]).kr;
let x = lag(s, b);
let y = varSaw(5 + b, 0, 0.5);
let z = varSaw(b, b, b) * b / 5 + [1.5, 5, 1];
let m = varSaw(5 - b, b, b) * 5 + 5;
let o = varSaw(w * x + y * z, b, varSaw(b, 0, 0.5) + 5 / 15) * (m > 1.515);
let f = 1515 ^ (varSaw(1 - b / 5, 0, 0.5) / 15 + 1 + b);
let rq = 1.5 ^ varSaw(b, 0, 0.5) / 5;
bLowPass(o, f, rq).splay / 5

/* https://twitter.com/redFrik/status/1254441448327479299 ; f0 ; rd (edit) */
let b = [1 3 5 8 10];
let e = [3, 2 / 3, 4, 3 / 2, 2];
let c = 0.021;
let d = lfTri(b / 999, 0) % 1;
let m = lfTri(b * c, 0);
let l = m * 7 + 20 + dseq(Infinity, b % m * 5 + 6);
let j = duty(e / (12 ^ m), 0, l);
let k = localBuf(b).degreeToKey(j, 12);
let o = sinOscFb(k.midiCps, lfTri(c / b + 1 / 3, decay2(impulse([2 / 3, 1.5, 3, 1.5, 3], 0), c, d)) * d);
freeVerb(o.splay, 0.1, 1, 0.5) * 0.1

/* <https://twitter.com/redFrik/status/1452954849885163525> ; f0 */
let i = rand(1, 64);
let x = (sinOsc(i % 9.33, 0) * 5 + 5).ceiling;
let t = sinOsc(2 ^ (i % 11) * 150 / x, 0);
let y = hpz1(x).abs > 0;
let f = linExp(t, -1, 1, latch(linExp(sinOsc(i % 4.4, 0), -1, 1, 9, 999), y), latch(linExp(sinOsc(i % 1.pi, 0), -1, 1, 99, 9000), y));
eqPan(
	blip(f, t + 2) * (1 - t),
	sinOsc(0.1, i)
) * (line(0.2, 0, 9).min(0.6) ^ 2)

/* https://sccode.org/1-4Qy ; f0 ; 0335 ; requires=keywords */
let o = grainFm(
	numChan: 1,
	trigger: lfSaw([0.5 0.6], 0),
	dur: 16,
	carFreq: lfSaw(5, 0) * lfSaw(0.015, 0) + 1 * 98,
	modFreq: (2 ^ lfSaw(4, 0)).round(0.5) * 99,
	index: 2 ^ lfSaw(1 / [8 9], 0) * 8,
	pan: 0,
	envBufNum: -1,
	maxGrains: 512
);
(o / 2).tanh / 5

/* https://sccode.org/1-4Qy ; f0 ; 0340 ; edit (rd) */
let c = sinOscFb(1 / [12 8], 0) + 3 / 24;
let m = holdSequence([0 8 5 1 5 4 5] * (c * 18).round(1), c) + 60;
allpassN(sinOscFb(m.midiCps, c * 2), 0.2, 0.2, 1) / 2

/* f0 ; <https://twitter.com/redFrik/status/1395519538008141835> ; edit (rd) */
let c = duty(0.004, 0, dseries(Infinity, 1, [1, 2]) % holdSequence([1 .. 6] * 75, 8.192));
let d = hpf(mantissaMask(c, 3),5);
let f = { :x |
	sinOscFb(x, 0).max(0)
};
let p = [250, 200] * lag(holdSequence([4 6 5 5 5 5 3] / 4, 4.096), 0.1);
let o = sinOscFb(p, f(0.08)) * f(1 / [99, 60]) / 3;
lpf((d.sin + (sinOscFb(63, f(0.8)) * d) / 9 + o).tanh / 2, 10000) * 0.2

/* https://sccode.org/1-4Qy ; f0 ; 0232 ; requires=pyramid ; edit (rd) */
let b = [4, 3];
let q = [1 .. 9].fibonacci.pyramid(1) * 99;
let o = sinOsc(holdSequence(q, 1 / b), 0);
let e = sinOsc(b / 9, 0);
let d = sinOsc(b / 999, 0).abs + 0.01;
combC(o * e, 1.01, d, 9).tanh / 2

/* https://sccode.org/1-4Qy ; f0 ; 0331 */
let b = [3 3 2 2 2 1 2 2 2] / 3;
let c = spring(impulseSequencer(b, impulse(1, 0)) / 9, 1, 0);
ringz(c, 50 * holdSequence(lag(c, 0.1) > 0 + [2 4] / b, c + 1 / [6 3]), 1)
