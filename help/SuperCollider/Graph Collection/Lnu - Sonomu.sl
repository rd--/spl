{- https://sonomu.club/@lukiss/112406789401906049 ; May 09, 2024 -}
let m = {
	LfdNoise3(1 / 7).ExpRange(0.01, 1)
};
let d = { :a :p |
	TDuty(Dseq(inf, a.pyramid(p)) / 8.3, 0, 1)
};
let q = [1 2 3 4 5 11 9];
let a = [
	m() > 0.05 * d((4 # 7) ++ [16 8], 3).Lag3Ud(0, 0.005),
	Hpf(m() > 0.05 * d(q, 5), 7777),
	m() > 0.05 * d(q, 5),
	3 / 5 * (m() > 0.1) * d([1 2 3 4 5 3 9], 6).Lag3Ud(1E-5, 1E-3),
	0.5 * (m() > 0.05) * d(q, 7).Lag3Ud(1E-7, 1E-3)
];
let b = GVerb(
	a,
	[1, 2, 2, 1, 2],
	[2, 8, m() * 4, 9, 6],
	[0.95, m(), m(), 0.9, 1 - m()],
	0.5, 15, 1, 0.7, 0.5, 300
);
let o = Splay(m:/0 ! 4 * b);
let p = CompanderD(o, 1 / 2, 1 / 3, 1 / 2, 0.01, 0.1) / 3;
(o / 3 + p).SoftClip.transposed.Sum

{- https://sonomu.club/@lukiss/112280811322923333 ; Apr 16, 2024 -}
let f = [77 777 7777];
let a = (GbmanL(f, 1.2, 2.1).Sin + 1 * 2).Ceiling / 9;
let e = { :f |
	let t = Duty(a, 0, a);
	Perc(TDuty(t, 0, 1), 0.001, t, -4)
};
Splay(
	SinOsc(f, 0) * (e(f / 7) ^ [2 6 10]) * [1, 1 / 3, 1 / 9],
	SinOsc((e(7) * 7), 0)
).transposed.Sum

{- https://sonomu.club/@lukiss/112090216321959038 ; Mar 14, 2024 -}
let m = {
	FbSineL(
		LfdNoise1(2).ExpRange(0.01, 1) * 14 + 0.5,
		1, 0.1, 1.1, 0.5, 0.1, 0.1
	).Lag3(0.1).Sin.ExpRange(0.01, 1)
};
let g = Dust(m() + m() * 6);
let r = LfdNoise1(2).ExpRange(0.01, 1) / 8;
let e = Perc(g, 0.001, r, -4);
let o = FbSineL(
	1 - m() * 5888 + 88,
	m() * 3,
	m() ^ 2,
	m() + 1,
	m() / 2,
	0.1,
	0.1
);
let c = CombC((e * o).Sin.SoftClip, 1, 0.001 + m(), m() * 8).Sin * 0.9 + (PinkNoise() * -64.DbAmp);
let l = LeakDc(c, 0.995);
let v = GVerb(
	l.Sin,
	5,
	m() * 8 + 1,
	1 - (m() ^ 2),
	1 / 2,
	29,
	1,
	m(),
	1 - m(),
	m() * 215
);
Splay((v + l).SoftClip * -6.DbAmp)

{- https://sonomu.club/@lukiss/112015967098344604 ; Mar 01, 2024 -}
let f = 111 * [0 1.04955 2.97513 4.70781 7.01955 8.40528 9.68826 0].MidiRatio;
let e = {
	LfSaw(GrayNoise() * (1 / 7 # 8) - 7, 0).Lag3(0.001).Max(0)
};
let v = SinOsc(1 - e() / f, 4) + 1 / 2 ^ 2;
let p = LfPulse(
	f @* [8 .. 2] / 111,
	0,
	1 - v
) * [1 2 4];
let o = VarSaw(
	f + (p * f),
	0,
	1 - e() ^ 2 / 2
) * (p.rotatedRight(2) - e() @* [8 .. 1] ^ 0.125);
let r = FreeVerb(
	Bpf(
		o * e() ^ 2,
		1 - e() * v * 11111 + 111,
		1.1 - v
	),
	1 - v,
	v @* [8 .. 1],
	0.999
) * (1 - (e() ^ 4)) + (e() * v * o);
Splay(r, (v[8] * 111).Sin)

{- https://sonomu.club/@lukiss/111583491682015266 ; Dec 15, 2023 -}
let t = { :z |
	LfSaw(z, 1) + 1 / 2
};
let r = 2 ^ (GbmanN(t(-1 / 60) * 4 + 4, 1.2, 2.1).Sin * (t(1 / 4) * 2 + 2)).Floor.Abs;
let c = 0:5.collect { :n |
	n * 12 + [2 15 7 12]
}.flatten;
let o = VarSaw(
	10 * pi * c.MidiRatio,
	0,
	t(r) / 2
) * ((t(r) ^ ((t(r / 2) * 4) + 1).Abs * c).Log.Sin.Max(0).Sin.Max(0) ^ 8);
let e = t(-1 * r) > (t(pi / r) / 1.5 + 0.05);
BBandStop(
	Splay(
		o * e,
		LfTri(r, 0)
	),
	t(r / 8).LinExp(0, 1, 80, 5500),
	t(1 / 9) * 2 + 3
)

{- https://social.ordinal.garden/@f0/111583733632579377 ; Dec 15, 2023 (f0) -}
let t = { :z |
	LfSaw(z, 1) + 1 / 2
};
let r = 2 ^ (GbmanN(t(-1 / 60) * 4 + 4, 1.2, 2.1).Sin * (t(1 / 4) * 2 + 2)).Floor.Abs;
let c = 0:5.collect { :n |
	n * 12 + [2 15 7 12]
}.flatten;
let o = VarSaw(
	t(1 / 13) < 0.5 * 2 + 8 * pi * c.MidiRatio,
	0,
	t(r) / 2
) * ((t(r) ^ ((t(r / 2) * 4) + 1).Abs * c).Log.Sin.Max(0).Sin.Max(0) ^ 8);
let e = t(-1 * r) > (t(pi / r) / 1.5 + 0.05);
let x = BBandStop(
	Splay(
		o * e,
		LfTri(r, 0)
	),
	t(r / 8).LinExp(0, 1, 80, 5500),
	t(1 / 9) * 2 + 3
);
CombN(
	Rlpf(x, 800, 0.1),
	1,
	4 / 13,
	4
) / 2 + x

{- https://sonomu.club/@lukiss/111577779507616435 ; Dec 14, 2023 -}
let r = { :a :b |
	let t = HenonL(LfNoise2(1).ExpRange(0.01, 1) * 16, 1.4, 0.3, 0, 0);
	TRand(a, b, t)
};
let t = Sweep(0, r(-1E3, 1E3)) % r(28, 512);
let b = t.BitAnd(r(64, 256)).BitOr(t.ShiftRight(r(4, 18)));
LeakDc(
	0.5 * LfTri(b.MidiCps % 1E4, 0) * (b > 32).Lag3(0.1),
	0.995
) # 2

{- https://sonomu.club/@lukiss/111534969935581348 ; Dec 7, 2023 -}
let p = {
	let a = 0:3.collect { :n |
		n * 12 + [0 3 7 10]
	}.flatten - 24;
	SinOsc(5, 0) * 0.01 + a.shuffled.MidiRatio
};
let e = LfSaw(-1 * p(), 1).Max(0) ^ SinOsc(p().Frac / 8, 0).LinLin(-1, 1, 4, 32);
CombC(
	Splay(
		VarSaw(
			147 * p(),
			0,
			LfSaw(
				p().degree,
				1
			) * (1 / 4) + (1 / 4)
		) * e.Sanitize(0),
		SinOsc(1 / 3, 0)
	),
	0.2, 0.2, 1
)

{- https://sonomu.club/@lukiss/111534001937293189 ; Dec 07, 2023 -}
let t = TDuty(1 / (2 ^ Diwhite(inf, 0, 8)), 0, 1).kr;
let l = {
	let z = nil;
	TChoose(
		t,
		[0 .. 7].collect { :n |
			z := ((LfdNoise1(4) + 2 ^ n) / 16);
			SinOsc(z, 0).Sin
		}
	).Lag(0.25 / z).kr
};
let p = [1 .. 32];
let e = LfSaw(l() * p.MidiRatio, 1) * 0.5 + 0.5 ^ 8;
Splay(
	LeakDc(
		Blip(
			p * p.MidiRatio * TChoose(t, 2 * p.MidiCps),
			LfSaw(l(), 1).LinCurve(-1, 1, 1, LfSaw(l() * p.degree, 1) * 200 + 201, 8).kr
		) * e,
		0.995
	) * 0.25,
	l()
)

{- https://sonomu.club/@lukiss/109875835273563824 ; Feb 17 2023  -}
let f = { :rt | Sweep(0, rt) };
let t = f(4E4);
let c = f(1);
let r = [1 .. 5];
let b = [
	-1 * [24 5 0 10 8 15].MidiRatio * t,
	(r + c).Wrap(1, 3333),
	t.ShiftRight(105)
].reduce(BitAnd:/2);
let e = b.LinCurve(0, 127, -1, 1, -8).Fold2(1) / 2;
Splay(
	FreeVerb(
		LfSaw(-1 * r, 2).Max(0).Lag3(0.1) * LeakDc(e, 0.999),
		1 / 3,
		c.Sin.Max(0),
		LfSaw(c.Cos, 0)
	),
	c.Sin
)

{- https://sonomu.club/@lukiss/109733997253009229 ; Jan 23, 2023 -}
let c = [9, 12 .. 61].degreeToKey([0 2 3 6 7 8 11], 12);
let o = c.MidiCps.collect { :f | SinOsc(f, 0) };
let e = SinOsc(2 / c.Log10, 0) * LfSaw(11 / c.Neg, 0).Max(0).Lag3(0.1);
Splay(
	LeakDc(o * e, 0.995),
	SinOsc(1 / c @ 1, 0)
)

{- https://sonomu.club/@lukiss/110281639162399169 ; Apr 29, 2023 -}
let m = Impulse(8, 0).kr;
let c = { :a |
	let z = [];
	a.collect { :each |
		z.addAll(each.integerDigits(2, 8))
	};
	Demand(m, 0, Dseq(inf, z))
};
let p = m * [
	c([136 138]),
	c([8 9 8 72 8 72 9]),
	c([140 148 34]),
	c([178 58]),
	c([34])
];
let e = { :g |
	Linen(g, 0.01, 1, 1, 0).kr
};
let h = HenonC(1 / [1 .. 5], 1.4, 0.3, 0, 0) < 0.9;
Splay(
	h * [
		LfTri(e(p @ 1) ^ 18 * 133 + 80, 0) * (e(p @ 1) ^ 24),
		HenonC(e(p @ 2) ^ 8 * 800 + 4E3, 1.4, 0.3, 0, 0) * (e(p @ 2) ^ 38),
		LfTri(2E3, 0) * HenonC(1E4, 1.4, 0.3, 0, 0) * (e(p @ 3) ^ 5 ^ 16),
		LfTri(110, 0) * LfTri((ToggleFf(p @ 4) * 7).MidiRatio * 220, 0) * (e(p @ 4) ^ 5 ^ 8),
		0.3 * HenonC(22050, 1.4, 0.3, 0, 0) * (e(p @ 5) ^ 68 + (0.5 * e(p @ 5) ^ 3))
	],
	0.25
)

{- https://sonomu.club/@lukiss/111422385501420073 ; Nov 17, 2023 -}
let x = CuspL(CuspL(3, 1, 1.9, 0).Exp * 12 + 1, 1, 1.9, 0).Fold2(1);
let t = (0 .. 7).collect { :n | PulseDivider(x, 8, 7 - n) };
let d = x.LinLin(-1, 1, 1 / 2, 2);
let e = { :c |
	Perc(t, 0.001, d, c)
};
let c = [0, 3, 7, -2];
let f = Demand(
	t,
	0,
	Dseq(inf, c) + Dxrand(inf, 48 + (0 .. 2).collect { :o | o * 12 + c }.flatten)
).MidiCps;
Splay(
	SinOsc(
		BrownNoise() * 0.0125 + 1 * f,
		(BrownNoise() * 0.4 * (SinOsc([3.25, 1 / 2, 2] * f, 0) * e(-58))).Sum
	) * e(-6) * (SinOsc(d + 2, 0) / 4 + 0.5),
	1 / 4
)

{- https://sonomu.club/@lukiss/111455666847951601 ; Nov 23, 2023 -}
let t = {
	TDuty(Dseq(inf, [3 4 2 1 2 4] / 8), 0, 1).kr
};
let r = { :l :h |
	TExpRand(l, h, t()).Lag3Ud(1 / 48, 1 / 16)
};
let e = Perc(t(), r(1 / 128, 2 / 8), 1 / 6, -4).kr;
let o = (Blip(r(11, 111), r(1 / 3, 333)) * e).Tanh;
3.timesRepeat {
	o := LeakDc(
		CombC(
			o,
			3 / 4,
			r(1 / 512, 3 / 4) * (LfdNoise1(6 # 2).kr * 0.001 + 1),
			r(1 / 2, 1 / 64) * TChoose(t(), [-1, 1]).kr
		).Tanh,
		0.995
	).Sanitize(0)
};
o.SoftClip

{- https://sonomu.club/@lukiss/110533029814503247 ; Jun 13, 2023 -}
let p = [1, 2 .. 14].degreeToKey([0 2 4 7 9], 12).MidiRatio;
let f = SinOsc(p.Sin * 8, 0) * 0.005 + 1 * p * 52;
let h = SinOsc(f * 2, 0) * SinOsc(1 / 4 / p, 0) * SinOsc(pi / p, 0).LinExp(-1, 1, 0.01, 1) * 8 * pi;
let m = LfSaw(-1 * [7, 3.5, 7 / 10] * (SinOsc(f.Sin.LinExp(-1, 1, 0.01, 1), 0) * 0.001 + 1), 1) * 0.5 + 0.5;
let e = m ^ (SinOsc(8 / p / f.ArcTan, 0) * 30 + 32);
let o = SinOsc(f, h) * e;
Splay(0.5 * o, SinOsc(pi, 0))

{- https://sonomu.club/@lukiss/110538742878262809 ; Jun 14, 2023 -}
let c = [12 .. 38].shuffled.degreeToKey([0 2 4 7 9], 12);
let w = LfSaw(8, 0) * 0.012 + 1;
let t = [6, 3 / 2, 3, 3 / 4, 1 / 4];
let d = Demand(
	TDuty(1 / t, 0, 1),
	0,
	Dseq(inf, [1 .. 24].collect { :n | Dseq(1, c @* [1, n + 1 .. c.size]) })
).Lag3(0.001);
let e = LfSaw(-1 * t, 1) * 1 + 1 / 2;
let o = (LfSaw(w * d.MidiCps, 0) * e).Fold2(1) * (LfSaw(d % t.Log, 0) > 0);
let f = e.Lag3(0.005) ^ (LfSaw(pi / t, 1) * 8 + 9) * (LfSaw(0.1 / t, 1) + 1 * 5E3 + 200);
Splay(
	CombC(MoogFf(o, f, 2, 0), 0.2, 0.2, 1) * 0.8,
	LfSaw(pi, 0)
)

{- https://sonomu.club/@lukiss/111518889311136686 ; Dec 04, 2023 -}
let t = TDuty(1 / (2 ^ Diwhite(inf, 0, 6)), 0, 1).kr;
let r = { :lo :hi |
	TRand(lo, hi, t)
};
let l = {
	let z = nil;
	TChoose(
		t,
		[0 .. 3].collect { :n |
			z := (LfNoise2(4).kr * 2 + 3 ^ n) / 4;
			SinOsc(z, 0).Sin
		}
	).Lag(1 / 8 / z)
};
let e = LfSaw(l() * r(1, 8), 1).kr + 1 / 2;
let f = r(24, 48).Ceiling.MidiCps;
let p = [1 .. 32];
let q = SinOsc(
	f * p * p.MidiRatio,
	SinOsc(p.MidiRatio ^ 2, 0) * (l() * 2 - e * 2 * pi)
) * ((e * p.MidiRatio).Log.Sin.Abs ^ r(4, 128));
let a = Splay(q.shuffled, SinOsc(r(0.5,8), 0));
let h = SinOsc(
	SinOsc([6, 7], 0) * (1 / 6) + 2 * f,
	0
) * (1 - e ^ 8) * r(1, 32);
let b = SinOsc(f, h) * (1.1 - e ^ 2) * 0.5;
(a + b).Sanitize(0)

{- https://sonomu.club/@lukiss/111749211970689312 ; Jan 14, 2024 -}
let p = [1, 5 .. 96];
let c = { :a :b :c |
	StandardL(a / pi, 1, 0.5, 0).Sin.LinLin(-1, 1, b, c)
};
let t = 2 ^ (c(5, 0, 4)).Floor;
let d = Latch((c(13, 1, 5)).Floor / t, TDuty(1 / t, 0, 1));
let l = {
	TChoose(
		TDuty(c(pi, 1 / t, 5) * d, 0, 1),
		[
			p * p.degree,
			p.DifSqr(p.shuffled),
			p * p.Log2,
			p.MidiRatio
		]
	)
};
let e = Perc(TDuty(d, 0, 1), d / t, d, 0);
let a = (e.LinCurve(0, 1, 1, 0, c(3, 2, -8)) * p).Log.Sin ^ c(13, 4, 36);
let b = (e > c(9, 0.003, 0.9)).Lag3(0.003);
Lpf(
	Splay(
		SinOsc(
			d * 55 * l(),
			SinOsc(l(), 0) * e * c(2.pi, 0, 2.pi)
		) * a * b,
		SinOsc(2.pi, 0) * e
	).Sanitize(0),
	9E3
)

{- https://sonomu.club/@lukiss/112090171577198222 ; Mar 14, 2024 -}
let m = {
	QuadL(LfdNoise1(1) + 1 ^ 2, 1, -1, -0.75, 0)
};
let i = Bpf(LocalIn(2, 0), 440, 1);
let u = Splay(
	VarSaw(
		m:/0 ! 12 / 4 + 111 * [0 .. 2].collect { :n |
			n * 12 + [0, 2, 5, 9]
		}.flatten.MidiRatio,
		0,
		m().Sin + 1 / 2 ^ 2
	) * LfSaw(-2 * m() ^ 2 * 2, 0).Max(0),
	m()
);
let d = DelayC(i, 1, 1 / 3);
let o = (d * (m() + 1 / 2) + u).Tanh;
o * -6.DbAmp <! LocalOut(o)

{- https://sonomu.club/@lukiss/113012278480517510 ; Aug 24, 2024, 02:28 -}
let p = [1, 3 .. 64];
let r = 2 ^ (Logistic(3.9, 3, 0.5) + 1 * 2.1).Floor;
let e = Linen(TDuty(1 / r, 0, 1).kr, 0, 1, 0.9 / r, 0);
Splay(
	Blip(
		73 * p * p.degreesToRadians,
		Blip(r / p, 0) + 1 / 2 ^ 2 * 33
	).Sin * ((1 - e * p).Log.Sin.Sin ^ (Blip(0.1 / r, 0) + 2 * 2)).Sanitize(0) * (e > 0.1),
	Blip(r, 0.1)
)

{- https://sonomu.club/@lukiss/113019188464159465 ; Aug 25, 2024, 07:45 -}
let k = 2 ^ StandardN([1.1, 0.9], 1, 0.5, 0) * 8;
Splay(
	LeakDc(
		StandardN(StandardN(k, 1, 0.5, 0).Max(0) * 22050, k.Sin, 0.5, 0) / 4,
		0.995
	),
	StandardN(k.sum, 1, 0.5, 0)
)

{- https://sonomu.club/@lukiss/113199362402063463 ; Sep 26, 2024, 03:26 -}
let t = {
	CuspL(LfdNoise1([1, 1]).Max(0) ^ 2 * 32, 1, 1.9, 0)
};
let r = { :x :y |
	TRand(x, y, t())
};
Sanitize(
	Splay(
		CompanderD(
			LeakDc(
				LorenzL(
					t() * SampleRate(),
					r(1, r(1, 11)),
					r(1, r(2, 30)),
					r(0.001 / 77, 1 / 17),
					0.05,
					0.1, 0, 0
				).SoftClip,
				0.995
			),
			1 / 2,
			1 / 2,
			1 / 2,
			0.005,
			0.1
		),
		t().first
	),
	0
)
