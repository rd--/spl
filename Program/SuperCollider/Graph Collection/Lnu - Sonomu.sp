/* https://sonomu.club/@lukiss/112406789401906049 ; May 09, 2024 */
let m = {
	LfdNoise3(1 / 7).expRange(0.01, 1)
};
let d = { :a :p |
	TDuty(Dseq(Infinity, a.pyramid(p)) / 8.3, 0, 1)
};
let q = [1 2 3 4 5 11 9];
let a = [
	m() > 0.05 * d(([4] # 7) ++ [16 8], 3).Lag3Ud(0, 0.005),
	Hpf(m() > 0.05 * d(q, 5), 7777),
	m() > 0.05 * d(q, 5),
	3 / 5 * (m() > 0.1) * d([1 2 3 4 5 3 9], 6).Lag3Ud(0.00001, 0.001),
	0.5 * (m() > 0.05) * d(q, 7).Lag3Ud(0.0000001, 0.001)
];
let b = GVerb(
	a,
	[1, 2, 2, 1, 2],
	[2, 8, m() * 4, 9, 6],
	[0.95, m(), m(), 0.9, 1 - m()],
	0.5, 15, 1, 0.7, 0.5, 300
);
let o = Splay(m/0 ! 4 * b);
let p = CompanderD(o, 1 / 2, 1 / 3, 1 / 2, 0.01, 0.1) / 3;
(o / 3 + p).softClip.transpose.Mix

/* https://sonomu.club/@lukiss/112280811322923333 ; Apr 16, 2024 */
let f = [77 777 7777];
let a = (GbmanL(f, 1.2, 2.1).sin + 1 * 2).ceiling / 9;
let e = { :f |
	let t = Duty(a, 0, a);
	Perc(TDuty(t, 0, 1), 0.001, t, -4)
};
Splay(
	SinOsc(f, 0) * (e(f / 7) ^ [2 6 10]) * [1, 1 / 3, 1 / 9],
	SinOsc((e(7) * 7), 0)
).transpose.Mix

/* https://sonomu.club/@lukiss/112090216321959038 ; Mar 14, 2024 */
let m = {
	FbSineL(
		LfdNoise1(2).expRange(0.01, 1) * 14 + 0.5,
		1, 0.1, 1.1, 0.5, 0.1, 0.1
	).Lag3(0.1).sin.expRange(0.01, 1)
};
let g = Dust(m() + m() * 6);
let r = LfdNoise1(2).expRange(0.01, 1) / 8;
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
let c = CombC((e * o).sin.softClip, 1, 0.001 + m(), m() * 8).sin * 0.9 + (PinkNoise() * -64.dbAmp);
let l = LeakDc(c, 0.995);
let v = GVerb(
	l.sin,
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
Splay((v + l).softClip * -6.dbAmp)

/* https://sonomu.club/@lukiss/112015967098344604 ; Mar 01, 2024 */
let f = 111 * [0 1.04955 2.97513 4.70781 7.01955 8.40528 9.68826 0].midiRatio;
let e = {
	LfSaw(GreyNoise() * ([1 / 7] # 8) - 7, 0).Lag3(0.001).max(0)
};
let v = SinOsc(1 - e() / f, 4) + 1 / 2 ^ 2;
let p = LfPulse(
	f[8 .. 2; -1] / 111,
	0,
	1 - v
) * [1 2 4];
let q = p.rotateRight(2) - e();
let o = VarSaw(
	f + (p * f),
	0,
	1 - e() ^ 2 / 2
) * (q[8 .. 1; -1] ^ 0.125);
let r = FreeVerb(
	Bpf(
		o * e() ^ 2,
		1 - e() * v * 11111 + 111,
		1.1 - v
	),
	1 - v,
	v[8 .. 1; -1],
	0.999
) * (1 - (e() ^ 4)) + (e() * v * o);
Splay(r, (v[8] * 111).sin)

/* https://sonomu.club/@lukiss/111583491682015266 ; Dec 15, 2023 */
let t = { :z |
	LfSaw(z, 1) + 1 / 2
};
let r = 2 ^ (GbmanN(t(-1 / 60) * 4 + 4, 1.2, 2.1).sin * (t(1 / 4) * 2 + 2)).floor.abs;
let c = [0 .. 5].collect { :n |
	n * 12 + [2 15 7 12]
}.flatten;
let o = VarSaw(
	10.pi * c.midiRatio,
	0,
	t(r) / 2
) * ((t(r) ^ ((t(r / 2) * 4) + 1).abs * c).log.sin.max(0).sin.max(0) ^ 8);
let e = t(-1 * r) > (t(1.pi / r) / 1.5 + 0.05);
BBandStop(
	Splay(
		o * e,
		LfTri(r, 0)
	),
	t(r / 8).linExp(0, 1, 80, 5500),
	t(1 / 9) * 2 + 3
)

/* https://social.ordinal.garden/@f0/111583733632579377 ; Dec 15, 2023 (f0) */
let t = { :z |
	LfSaw(z, 1) + 1 / 2
};
let r = 2 ^ (GbmanN(t(-1 / 60) * 4 + 4, 1.2, 2.1).sin * (t(1 / 4) * 2 + 2)).floor.abs;
let c = [0 .. 5].collect { :n |
	n * 12 + [2 15 7 12]
}.flatten;
let o = VarSaw(
	t(1 / 13) < 0.5 * 2 + 8 * 1.pi * c.midiRatio,
	0,
	t(r) / 2
) * ((t(r) ^ ((t(r / 2) * 4) + 1).abs * c).log.sin.max(0).sin.max(0) ^ 8);
let e = t(-1 * r) > (t(1.pi / r) / 1.5 + 0.05);
let x = BBandStop(
	Splay(
		o * e,
		LfTri(r, 0)
	),
	t(r / 8).linExp(0, 1, 80, 5500),
	t(1 / 9) * 2 + 3
);
CombN(
	Rlpf(x, 800, 0.1),
	1,
	4 / 13,
	4
) / 2 + x

/* https://sonomu.club/@lukiss/111577779507616435 ; Dec 14, 2023 */
let r = { :a :b |
	let t = HenonL(LfNoise2(1).expRange(0.01, 1) * 16, 1.4, 0.3, 0, 0);
	TRand(a, b, t)
};
let t = Sweep(0, r(-1000, 1000)) % r(28, 512);
let b = t.bitAnd(r(64, 256)).bitOr(t.bitShiftRight(r(4, 18)));
[
	LeakDc(
		0.5 * LfTri(b.midiCps % 10000, 0) * (b > 32).Lag3(0.1),
		0.995
	)
] # 2

/* https://sonomu.club/@lukiss/111534969935581348 ; Dec 7, 2023 */
let p = {
	let a = [0 .. 3].collect { :n |
		n * 12 + [0 3 7 10]
	}.flatten - 24;
	SinOsc(5, 0) * 0.01 + a.shuffle.midiRatio
};
let e = LfSaw(-1 * p(), 1).max(0) ^ SinOsc(p().fractionalPart / 8, 0).linLin(-1, 1, 4, 32);
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

/* https://sonomu.club/@lukiss/111534001937293189 ; Dec 07, 2023 */
let t = TDuty(1 / (2 ^ Diwhite(Infinity, 0, 8)), 0, 1).kr;
let l = {
	let z = nil;
	TChoose(
		t,
		[0 .. 7].collect { :n |
			z := ((LfdNoise1(4) + 2 ^ n) / 16);
			SinOsc(z, 0).sin
		}
	).Lag(0.25 / z).kr
};
let p = [1 .. 32];
let e = LfSaw(l() * p.midiRatio, 1) * 0.5 + 0.5 ^ 8;
Splay(
	LeakDc(
		Blip(
			p * p.midiRatio * TChoose(t, 2 * p.midiCps),
			LfSaw(l(), 1).LinCurve(-1, 1, 1, LfSaw(l() * p.degree, 1) * 200 + 201, 8).kr
		) * e,
		0.995
	) * 0.25,
	l()
)

/* https://sonomu.club/@lukiss/109875835273563824 ; Feb 17 2023  */
let f = { :rt | Sweep(0, rt) };
let t = f(40000);
let c = f(1);
let r = [1 .. 5];
let b = [
	-1 * [24 5 0 10 8 15].midiRatio * t,
	(r + c).wrap(1, 3333),
	t.bitShiftRight(105)
].reduce(bitAnd/2);
let e = b.LinCurve(0, 127, -1, 1, -8).fold(-1, 1) / 2;
Splay(
	FreeVerb(
		LfSaw(-1 * r, 2).max(0).Lag3(0.1) * LeakDc(e, 0.999),
		1 / 3,
		c.sin.max(0),
		LfSaw(c.cos, 0)
	),
	c.sin
)

/* https://sonomu.club/@lukiss/109733997253009229 ; Jan 23, 2023 */
let c = [9 .. 61; 3].degreeToKey([0 2 3 6 7 8 11], 12);
let o = c.midiCps.collect { :f | SinOsc(f, 0) };
let e = SinOsc(2 / c.log10, 0) * LfSaw(11 / c.-, 0).max(0).Lag3(0.1);
Splay(
	LeakDc(o * e, 0.995),
	SinOsc(1 / c[1], 0)
)

/* https://sonomu.club/@lukiss/110281639162399169 ; Apr 29, 2023 */
let m = Impulse(8, 0).kr;
let c = { :a |
	let z = [];
	a.collect { :each |
		z.addAll!(each.integerDigits(2, 8))
	};
	Demand(m, 0, Dseq(Infinity, z))
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
		LfTri(e(p[1]) ^ 18 * 133 + 80, 0) * (e(p[1]) ^ 24),
		HenonC(e(p[2]) ^ 8 * 800 + 4000, 1.4, 0.3, 0, 0) * (e(p[2]) ^ 38),
		LfTri(2000, 0) * HenonC(10000, 1.4, 0.3, 0, 0) * (e(p[3]) ^ 5 ^ 16),
		LfTri(110, 0) * LfTri((ToggleFf(p[4]) * 7).midiRatio * 220, 0) * (e(p[4]) ^ 5 ^ 8),
		0.3 * HenonC(22050, 1.4, 0.3, 0, 0) * (e(p[5]) ^ 68 + (0.5 * e(p[5]) ^ 3))
	],
	0.25
)

/* https://sonomu.club/@lukiss/111422385501420073 ; Nov 17, 2023 */
let x = CuspL(CuspL(3, 1, 1.9, 0).exp * 12 + 1, 1, 1.9, 0).fold(-1, 1);
let t = [0 .. 7].collect { :n | PulseDivider(x, 8, 7 - n) };
let d = x.linLin(-1, 1, 1 / 2, 2);
let e = { :c |
	Perc(t, 0.001, d, c)
};
let c = [0, 3, 7, -2];
let f = Demand(
	t,
	0,
	Dseq(Infinity, c) + Dxrand(Infinity, 48 + [0 .. 2].collect { :o | o * 12 + c }.flatten)
).midiCps;
Splay(
	SinOsc(
		BrownNoise() * 0.0125 + 1 * f,
		(BrownNoise() * 0.4 * (SinOsc([3.25, 1 / 2, 2] * f, 0) * e(-58))).sum
	) * e(-6) * (SinOsc(d + 2, 0) / 4 + 0.5),
	1 / 4
)

/* https://sonomu.club/@lukiss/111455666847951601 ; Nov 23, 2023 */
let t = {
	TDuty(Dseq(Infinity, [3 4 2 1 2 4] / 8), 0, 1).kr
};
let r = { :l :h |
	TExpRand(l, h, t()).Lag3Ud(1 / 48, 1 / 16)
};
let e = Perc(t(), r(1 / 128, 2 / 8), 1 / 6, -4).kr;
let o = (Blip(r(11, 111), r(1 / 3, 333)) * e).tanh;
3.timesRepeat {
	o := LeakDc(
		CombC(
			o,
			3 / 4,
			r(1 / 512, 3 / 4) * (LfdNoise1([6] # 2).kr * 0.001 + 1),
			r(1 / 2, 1 / 64) * TChoose(t(), [-1, 1]).kr
		).tanh,
		0.995
	).Sanitize(0)
};
o.softClip

/* https://sonomu.club/@lukiss/110533029814503247 ; Jun 13, 2023 */
let p = [1 .. 14].degreeToKey([0 2 4 7 9], 12).midiRatio;
let f = SinOsc(p.sin * 8, 0) * 0.005 + 1 * p * 52;
let h = SinOsc(f * 2, 0) * SinOsc(1 / 4 / p, 0) * SinOsc(1.pi / p, 0).linExp(-1, 1, 0.01, 1) * 8.pi;
let m = LfSaw(-1 * [7, 3.5, 7 / 10] * (SinOsc(f.sin.linExp(-1, 1, 0.01, 1), 0) * 0.001 + 1), 1) * 0.5 + 0.5;
let e = m ^ (SinOsc(8 / p / f.arcTan, 0) * 30 + 32);
let o = SinOsc(f, h) * e;
Splay(0.5 * o, SinOsc(1.pi, 0))

/* https://sonomu.club/@lukiss/110538742878262809 ; Jun 14, 2023 */
let c = [12 .. 38].shuffle.degreeToKey([0 2 4 7 9], 12);
let w = LfSaw(8, 0) * 0.012 + 1;
let t = [6, 3 / 2, 3, 3 / 4, 1 / 4];
let d = Demand(
	TDuty(1 / t, 0, 1),
	0,
	Dseq(
		Infinity,
		[1 .. 24].collect { :n |
			Dseq(1, c[1 .. c.size; n])
		}
	)
).Lag3(0.001);
let e = LfSaw(-1 * t, 1) * 1 + 1 / 2;
let o = (LfSaw(w * d.midiCps, 0) * e).fold * (LfSaw(d % t.log, 0) > 0);
let f = e.Lag3(0.005) ^ (LfSaw(1.pi / t, 1) * 8 + 9) * (LfSaw(0.1 / t, 1) + 1 * 5000 + 200);
Splay(
	CombC(MoogFf(o, f, 2, 0), 0.2, 0.2, 1) * 0.8,
	LfSaw(1.pi, 0)
)

/* https://sonomu.club/@lukiss/111518889311136686 ; Dec 04, 2023 */
let t = TDuty(1 / (2 ^ Diwhite(Infinity, 0, 6)), 0, 1).kr;
let r = { :lo :hi |
	TRand(lo, hi, t)
};
let l = {
	let z = nil;
	TChoose(
		t,
		[0 .. 3].collect { :n |
			z := (LfNoise2(4).kr * 2 + 3 ^ n) / 4;
			SinOsc(z, 0).sin
		}
	).Lag(1 / 8 / z)
};
let e = LfSaw(l() * r(1, 8), 1).kr + 1 / 2;
let f = r(24, 48).ceiling.midiCps;
let p = [1 .. 32];
let q = SinOsc(
	f * p * p.midiRatio,
	SinOsc(p.midiRatio ^ 2, 0) * (l() * 2 - e * 2.pi)
) * ((e * p.midiRatio).log.sin.abs ^ r(4, 128));
let a = Splay(q.shuffle, SinOsc(r(0.5,8), 0));
let h = SinOsc(
	SinOsc([6, 7], 0) * (1 / 6) + 2 * f,
	0
) * (1 - e ^ 8) * r(1, 32);
let b = SinOsc(f, h) * (1.1 - e ^ 2) * 0.5;
(a + b).Sanitize(0)

/* https://sonomu.club/@lukiss/111749211970689312 ; Jan 14, 2024 */
let p = [1 .. 96; 4];
let c = { :a :b :c |
	StandardL(a / 1.pi, 1, 0.5, 0).sin.linLin(-1, 1, b, c)
};
let t = 2 ^ (c(5, 0, 4)).floor;
let d = Latch((c(13, 1, 5)).floor / t, TDuty(1 / t, 0, 1));
let l = {
	TChoose(
		TDuty(c(1.pi, 1 / t, 5) * d, 0, 1),
		[
			p * p.degree,
			p.difSqr(p.shuffle),
			p * p.log2,
			p.midiRatio
		]
	)
};
let e = Perc(TDuty(d, 0, 1), d / t, d, 0);
let a = (e.LinCurve(0, 1, 1, 0, c(3, 2, -8)) * p).log.sin ^ c(13, 4, 36);
let b = (e > c(9, 0.003, 0.9)).Lag3(0.003);
Lpf(
	Splay(
		SinOsc(
			d * 55 * l(),
			SinOsc(l(), 0) * e * c(2.pi, 0, 2.pi)
		) * a * b,
		SinOsc(2.pi, 0) * e
	).Sanitize(0),
	9000
)

/* https://sonomu.club/@lukiss/112090171577198222 ; Mar 14, 2024 */
let m = {
	QuadL(LfdNoise1(1) + 1 ^ 2, 1, -1, -0.75, 0)
};
let i = Bpf(LocalIn(2, 0), 440, 1);
let u = Splay(
	VarSaw(
		m/0 ! 12 / 4 + 111 * [0 .. 2].collect { :n |
			n * 12 + [0, 2, 5, 9]
		}.flatten.midiRatio,
		0,
		m().sin + 1 / 2 ^ 2
	) * LfSaw(-2 * m() ^ 2 * 2, 0).max(0),
	m()
);
let d = DelayC(i, 1, 1 / 3);
let o = (d * (m() + 1 / 2) + u).tanh;
o * -6.dbAmp <! LocalOut(o)

/* https://sonomu.club/@lukiss/113012278480517510 ; Aug 24, 2024 */
let p = [1 .. 64; 2];
let r = 2 ^ (Logistic(3.9, 3, 0.5) + 1 * 2.1).floor;
let e = Linen(TDuty(1 / r, 0, 1).kr, 0, 1, 0.9 / r, 0);
Splay(
	Blip(
		73 * p * p.degreesToRadians,
		Blip(r / p, 0) + 1 / 2 ^ 2 * 33
	).sin
	* (
		(1 - e * p).log.sin.sin
		^
		(Blip(0.1 / r, 0) + 2 * 2)
	).Sanitize(0)
	* (e > 0.1),
	Blip(r, 0.1)
)

/* https://sonomu.club/@lukiss/113019188464159465 ; Aug 25, 2024 */
let k = 2 ^ StandardN([1.1, 0.9], 1, 0.5, 0) * 8;
Splay(
	LeakDc(
		StandardN(
			StandardN(k, 1, 0.5, 0).max(0) * 22050,
			k.sin,
			0.5,
			0
		) / 4,
		0.995
	),
	StandardN(k.sum, 1, 0.5, 0)
)

/* https://sonomu.club/@lukiss/113199362402063463 ; Sep 26, 2024 */
let t = {
	CuspL(LfdNoise1([1, 1]).max(0) ^ 2 * 32, 1, 1.9, 0)
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
				).softClip,
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

/* https://sonomu.club/@lukiss/113424886949750691 ; Nov 05, 2024 */
let o = SinOsc(440, 0);
[0 .. 4].do { :n |
	o := SinOsc(
		SinOsc(o ^ n, o).linExp(-1, 1, 0.01, 1) ^ n,
		SinOsc(o + 1 ^ (n + 1).prime, 0).pi
	)
};
[o] # 2 / 3

/* https://sonomu.club/@lukiss/113469893460208702 ; Nov 12, 2024 ; ? see .scd */
let z = { :x | LfSaw(x, 0) };
let i = [1 .. 4].fibonacci; /* 1 1 2 3 */
let f = 2 ^ [0 .. 3] + i * 2;
let b = LocalBuf[0 2 5 7 9];
let l = degreeToKey(
	b,
	StandardN(f, 1, 0.5, 0).sin.Sanitize(0) * z(1 / f / i) * 12,
	12
).ceiling;
let o = z(l.midiRatio * 110 * i);
Splay(
	MoogFf(
		z(l / (4 ^ i)) + 1 / 2 ^ 4 * o,
		z(l / (4 ^ i + (o / 8))) + 1 / 2 ^ (z(o.abs) + 1 / 2 ^ 2 * 8 + 0.5) * 8000 + 40,
		2,
		0
	),
	z(1)
)

/* https://sonomu.club/@lukiss/113817432455425855 ; Jan 13, 2025 */
let p = [1 .. 14].prime;
let o = SinOsc(p, 0);
let e = 1 / 8;
let z = 0.1 * e;
let f = p.log2 * p.midiCps + o;
let q = SinOsc(1 + o / p ^ 2, 0);
let g = FbSineN(
	z * o / p + 8,
	1,
	1 / p,
	o + (1.pi / p).degreesToRadians,
	0.5,
	0.1,
	0.1
).sin > (o.reverse % q).Lag(q.max(0)).round(q * e);
let x = SinOsc(
	f,
	SinOsc(
		2 * f + o + p.sin.degreesToRadians,
		o.pi
	) * q.pi
) * Adsr(g, z, e, e / 2, 2 * e, -4);
Splay(
	x,
	x.sum.sin
) / 2

/* https://sonomu.club/@lukiss/113821046696857368 ; Jan 13, 2025 */
let t = LfSaw(-8, 1);
Splay(
	MoogFf(
		LfSaw(
			(
				12 + Latch(
					(
						LfSaw(
							[1 .. 4].prime * (
								LfSaw(
									[1 .. 3].degreesToRadians,
									0
								)
							),
							0
						) + 1 * 17
					).round(
						3
					),
					t
				)
			).midiCps * [2, 1, 4],
			0
		).sign * t.max(0) ^ 0.1,
		(
			1 + t - (
				LfSaw(
					1 / 32 * [1 .. 3],
					0
				) * 1.9
			).abs
		) * 5000 + 40,
		2,
		0
	).tanh,
	t
)
