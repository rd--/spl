{- pkt 07 (f0) ; https://fredrikolofsson.com/f0blog/pact-februari/ ; helper -}
let sinOsc = { :f :l :r |
	LinExp(SinOsc(f, 0), -1, 1, l, r)
};
GVerb(
	LeakDc(
		SinOsc(
			SinOsc(
				SinOsc(
					SinOsc(
						SinOsc(
							SinOsc(
								SinOsc(1, 0) * 2 + sinOsc(1/2, 1, 2),
								0
							) * 8 +	sinOsc(1/4, 4, 8),
							0
						) * 32 + sinOsc(1/8, 16, 32),
						0
					) * 128 + sinOsc(1/16, 64, 128),
					0
				) * 512 + sinOsc(1/32, 256, 512),
				0
			) * 2048 + sinOsc(1/64, 1024, 2048),
			0
		) * 0.1,
		0.995
	),
	16, 8, 0.75, 0.5, 15, 1, 0.7, 0.5, 300
) * 0.25

{- Red frik (F0) -}
let tr = Impulse(0.1, 0);
let o1 = SinOsc(TRand(0.3, 5, tr), 0) * TRand(0, 0.5, tr) + TRand(0.49, 0.56, tr);
let o2 = SinOsc(o1, 0) * TRand(0.3, 0.6, tr) + TRand(0.3, 0.5, tr);
Rhpf(
	BrownNoise(2),
	TRand(0.3, 3, tr),
	o2
) * 0.1

{- https://sccode.org/1-4S6 ; f0 ; 't' -}
let p = Saw([3, 4]) * (Saw(1) * 32 + 128) + Duty(1, 0, (Dseq(1, [0, 8, 1, 5]) * [1, 4, 8]).flop);
let o = SinOsc(Saw(3) * 64 + 99, p) / 9;
CombN(o, 1 / 4, 1 / 2.125, SinOsc(0.005, 1.5 * pi).Range(0, 6)).transposed.Sum

{- tw 0120 (f0) ; requires=kr -}
let z = LfTri(1 / [7, 8], 0) * LfTri(1 / 9, 0) * 99;
let l = (60 .. 79).MidiCps;
let f = Select(z, l);
let w = LfTri(1 / [3, 4], 0) % 1;
let o = VarSaw(f.kr, 0, w.kr);
CombN(o, 1, 1 / [5, 6], 8) / 8

{- tw 0121 (f0) ; requires=kr -}
let z = SinOsc(1 / [8, 7], 0) * SinOsc(1 / 30, 0) * 9;
let l = (0 .. 7) * 6 + 56;
let m = SinOsc(1 / [4, 3], 0);
let o = SinOsc(Select(z, l).kr.MidiCps, 0) * m;
CombN(o, 1, 1 / [6, 5], 9).Tanh * 0.1

{- tw 0134 (f0) -}
let n = 50;
(1 .. n).collect { :i |
	Ringz(
		Blip(LfSaw(i + 1 / [3, 4], 0) > (LfSaw(i + 1 / 8, 0) + 1) * (n / 2) + n, i + [2, 3]) *
		LfSaw(i + 1 / n, i / (n / 2)), i + 1 * (n * 2 - 1),
		0.1
	)
}.mean / 5

{- https://sccode.org/1-4Qy ; f0 ; 0233 ; requires=kr -}
let b = 1 / [1 4 6 8 11];
let c = LfTri(b / 98, 0);
let q = Dseq(inf, Select(LfTri(b / 99, 0) + c * 5, 1 / b + 59).kr).MidiCps;
Splay(LfTri(Duty(b, c, q) + c, 0) / 3)

{- https://sccode.org/1-4Qy ; f0 ; 0246 ; requires=DynRingzBank -}
let b = [1 .. 9] * 1.5;
let d = [2 / b, 3 / b];
let e = LfPulse(d, 0, 0.5);
CombC(
	DynRingzBank(e, (LfPulse(1 / b, 0, 0.5) * b + 50).MidiCps, 0.0002, b / 9),
	2,
	2 - Lpf(e, 50),
	1
).transposed.Sum

{- https://sccode.org/1-4Qy ; f0 ; 0318 -}
let b = [1 .. 3];
let o1 = SinOscFb(13 * 13 * b, 1 / 3);
let o2 = SinOscFb(b / 13, 1);
let o3 = SinOscFb(1 / (13 .. 3), 0) + 133 * b;
let o4 = SinOscFb(b, 1) % 1;
let o5 = SinOscFb(b / 333, o4) % 1;
let o6 = SinOscFb(o3, o5);
Splay(o1 * o2 / 13 + o6) / 3

{- https://sccode.org/1-4Qy ; f0 ; 0333 ; Splay/Stereo -}
(0 .. 7).collect { :i |
	let b = i + 2 * 99;
	let f = SinOscFb(i + 1 / 150, 0).RoundTo(1) + 1 + i * 99 + SinOscFb([3, 2], 0);
	(Formant(f, b, b) * SinOscFb(i + 1 / 130, 0).Max(0)).Tanh
}.Sum.Splay / 7

{- https://sccode.org/1-4Qy ; f0 ; tweet0350 ; Splay -}
let b = (9 .. 1) / 99;
let o = LfSaw(LfSaw(b, b) + 1 * 99, b) * (LfSaw(LfSaw(b, 0) > b, 0) > 0.9);
CombN(
	GVerb(o, 99, 1, b * 9, b, 15, 1, 0.7, 0.5, 300) / 19,
	1,
	b / 9.9,
	9
).transposed.Sum.Splay * 0.9

{- f0 ; https://twitter.com/redFrik/status/1105496695637454848 ; requires=kr -}
let b = (1 .. 15) + 1 / 151;
let w = (VarSaw(b, b, 1 / 5.15) * 1 + 1.5).Ceiling;
let s = Select((VarSaw(1/15, 1/5, b) * 5).Ceiling + 5 / 5, [51 * 1.5, 51, 151]).kr;
let x = Lag(s, b);
let y = VarSaw(5 + b, 0, 0.5);
let z = VarSaw(b, b, b) * b / 5 + [1.5, 5, 1];
let m = VarSaw(5 - b, b, b) * 5 + 5;
let o = VarSaw(w * x + y * z, b, VarSaw(b, 0, 0.5) + 5 / 15) * (m > 1.515);
let f = 1515 ^ (VarSaw(1 - b / 5, 0, 0.5) / 15 + 1 + b);
let rq = 1.5 ^ VarSaw(b, 0, 0.5) / 5;
BLowPass(o, f, rq).Splay / 5

{- https://twitter.com/redFrik/status/1254441448327479299 ; f0 ; rd (edit) -}
let b = [1 3 5 8 10];
let e = [3, 2 / 3, 4, 3 / 2, 2];
let c = 0.021;
let d = LfTri(b / 999, 0) % 1;
let m = LfTri(b * c, 0);
let l = m * 7 + 20 + Dseq(inf, b % m * 5 + 6);
let j = Duty(e / (12 ^ m), 0, l);
let k = DegreeToKey(b.asLocalBuf, j, 12);
let o = SinOscFb(k.MidiCps, LfTri(c / b + 1 / 3, Decay2(Impulse([2 / 3, 1.5, 3, 1.5, 3], 0), c, d)) * d);
FreeVerb(o.Splay, 0.1, 1, 0.5) * 0.1

{- <https://twitter.com/redFrik/status/1452954849885163525> ; f0 -}
let i = Rand(1, 64);
let x = (SinOsc(i % 9.33, 0) * 5 + 5).Ceiling;
let t = SinOsc(2 ^ (i % 11) * 150 / x, 0);
let y = Hpz1(x).Abs > 0;
let f = LinExp(t, -1, 1, Latch(LinExp(SinOsc(i % 4.4, 0), -1, 1, 9, 999), y), Latch(LinExp(SinOsc(i % pi, 0), -1, 1, 99, 9000), y));
EqPan(
	Blip(f, t + 2) * (1 - t),
	SinOsc(0.1, i)
) * (Line(0.2, 0, 9).Min(0.6) ^ 2)

{- https://sccode.org/1-4Qy ; f0 ; 0335 ; requires=keywords -}
let o = GrainFm(
	numChan: 1,
	trigger: LfSaw([0.5 0.6], 0),
	dur: 16,
	carFreq: LfSaw(5, 0) * LfSaw(0.015, 0) + 1 * 98,
	modFreq: (2 ^ LfSaw(4, 0)).RoundTo(0.5) * 99,
	index: 2 ^ LfSaw(1 / [8 9], 0) * 8,
	pan: 0,
	envBufNum: -1,
	maxGrains: 512
);
(o / 2).Tanh / 5

{- https://sccode.org/1-4Qy ; f0 ; 0340 ; edit (rd) -}
let c = SinOscFb(1 / [12 8], 0) + 3 / 24;
let m = HoldSequence([0 8 5 1 5 4 5] * (c * 18).RoundTo(1), c) + 60;
AllpassN(SinOscFb(m.MidiCps, c * 2), 0.2, 0.2, 1) / 2

{- f0 ; <https://twitter.com/redFrik/status/1395519538008141835> ; edit (rd) -}
let c = Duty(0.004, 0, Dseries(inf, 1, [1, 2]) % HoldSequence((1 .. 6) * 75, 8.192));
let d = Hpf(MantissaMask(c, 3),5);
let f = { :x |
	SinOscFb(x, 0).Max(0)
};
let p = [250, 200] * Lag(HoldSequence([4 6 5 5 5 5 3] / 4, 4.096), 0.1);
let o = SinOscFb(p, f(0.08)) * f(1 / [99, 60]) / 3;
Lpf((d.Sin + (SinOscFb(63, f(0.8)) * d) / 9 + o).Tanh / 2, 10000) * 0.2

{- https://sccode.org/1-4Qy ; f0 ; 0232 ; requires=pyramid ; edit (rd) -}
let b = [4, 3];
let q = 9.fibonacciArray.pyramid(1) * 99;
let o = SinOsc(HoldSequence(q, 1 / b), 0);
let e = SinOsc(b / 9, 0);
let d = SinOsc(b / 999, 0).Abs + 0.01;
CombC(o * e, 1.01, d, 9).Tanh / 2

{- https://sccode.org/1-4Qy ; f0 ; 0331 -}
let b = [3 3 2 2 2 1 2 2 2] / 3;
let c = Spring(ImpulseSequencer(b, Impulse(1, 0)) / 9, 1, 0);
Ringz(c, 50 * HoldSequence(Lag(c, 0.1) > 0 + [2 4] / b, c + 1 / [6 3]), 1)
