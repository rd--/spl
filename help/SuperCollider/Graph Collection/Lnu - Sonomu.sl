{- https://sonomu.club/@lukiss/112406789401906049 -}
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

{- https://sonomu.club/@lukiss/112280811322923333 -}
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

{- https://sonomu.club/@lukiss/112090216321959038 -}
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

{- https://sonomu.club/@lukiss/112015967098344604 -}
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

{- // https://sonomu.club/@lukiss/111583491682015266 -}
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

{- https://social.ordinal.garden/@f0/111583733632579377 (f0 + lnu) -}
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

{- https://sonomu.club/@lukiss/111577779507616435 -}
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

{- https://sonomu.club/@lukiss/11153496993558134 -}
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

{- https://sonomu.club/@lukiss/111534001937293189 -}
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
