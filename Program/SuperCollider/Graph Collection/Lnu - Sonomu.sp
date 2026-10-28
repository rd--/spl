/* https://sonomu.club/@lukiss/112406789401906049 ; May 09, 2024 */
let m = {
	lfdNoise3(1 / 7).expRange(0.01, 1)
};
let d = { :a :p |
	tDuty(dseq(Infinity, a.pyramid(p)) / 8.3, 0, 1)
};
let q = [1 2 3 4 5 11 9];
let a = [
	m() > 0.05 * d(([4] # 7) ++ [16 8], 3).lag3Ud(0, 0.005),
	hpf(m() > 0.05 * d(q, 5), 7777),
	m() > 0.05 * d(q, 5),
	3 / 5 * (m() > 0.1) * d([1 2 3 4 5 3 9], 6).lag3Ud(0.00001, 0.001),
	0.5 * (m() > 0.05) * d(q, 7).lag3Ud(0.0000001, 0.001)
];
let b = gVerb(
	a,
	[1, 2, 2, 1, 2],
	[2, 8, m() * 4, 9, 6],
	[0.95, m(), m(), 0.9, 1 - m()],
	0.5, 15, 1, 0.7, 0.5, 300
);
let o = splay(m/0 ! 4 * b);
let p = companderD(o, 1 / 2, 1 / 3, 1 / 2, 0.01, 0.1) / 3;
(o / 3 + p).softClip.transpose.mix

/* https://sonomu.club/@lukiss/112280811322923333 ; Apr 16, 2024 */
let f = [77 777 7777];
let a = (gbmanL(f, 1.2, 2.1).sin + 1 * 2).ceiling / 9;
let e = { :f |
	let t = duty(a, 0, a);
	perc(tDuty(t, 0, 1), 0.001, t, -4)
};
splay(
	sinOsc(f, 0) * (e(f / 7) ^ [2 6 10]) * [1, 1 / 3, 1 / 9],
	sinOsc((e(7) * 7), 0)
).transpose.mix

/* https://sonomu.club/@lukiss/112090216321959038 ; Mar 14, 2024 */
let m = {
	fbSineL(
		lfdNoise1(2).expRange(0.01, 1) * 14 + 0.5,
		1, 0.1, 1.1, 0.5, 0.1, 0.1
	).lag3(0.1).sin.expRange(0.01, 1)
};
let g = dust(m() + m() * 6);
let r = lfdNoise1(2).expRange(0.01, 1) / 8;
let e = perc(g, 0.001, r, -4);
let o = fbSineL(
	1 - m() * 5888 + 88,
	m() * 3,
	m() ^ 2,
	m() + 1,
	m() / 2,
	0.1,
	0.1
);
let c = combC((e * o).sin.softClip, 1, 0.001 + m(), m() * 8).sin * 0.9 + (pinkNoise() * -64.dbAmp);
let l = leakDc(c, 0.995);
let v = gVerb(
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
splay((v + l).softClip * -6.dbAmp)

/* https://sonomu.club/@lukiss/112015967098344604 ; Mar 01, 2024 */
let f = 111 * [0 1.04955 2.97513 4.70781 7.01955 8.40528 9.68826 0].midiRatio;
let e = {
	lfSaw(greyNoise() * ([1 / 7] # 8) - 7, 0).lag3(0.001).max(0)
};
let v = sinOsc(1 - e() / f, 4) + 1 / 2 ^ 2;
let p = lfPulse(
	f[8 .. 2; -1] / 111,
	0,
	1 - v
) * [1 2 4];
let q = p.rotateRight(2) - e();
let o = varSaw(
	f + (p * f),
	0,
	1 - e() ^ 2 / 2
) * (q[8 .. 1; -1] ^ 0.125);
let r = freeVerb(
	bpf(
		o * e() ^ 2,
		1 - e() * v * 11111 + 111,
		1.1 - v
	),
	1 - v,
	v[8 .. 1; -1],
	0.999
) * (1 - (e() ^ 4)) + (e() * v * o);
splay(r, (v[8] * 111).sin)

/* https://sonomu.club/@lukiss/111583491682015266 ; Dec 15, 2023 */
let t = { :z |
	lfSaw(z, 1) + 1 / 2
};
let r = 2 ^ (gbmanN(t(-1 / 60) * 4 + 4, 1.2, 2.1).sin * (t(1 / 4) * 2 + 2)).floor.abs;
let c = [0 .. 5].collect { :n |
	n * 12 + [2 15 7 12]
}.flatten;
let o = varSaw(
	10.pi * c.midiRatio,
	0,
	t(r) / 2
) * ((t(r) ^ ((t(r / 2) * 4) + 1).abs * c).log.sin.max(0).sin.max(0) ^ 8);
let e = t(-1 * r) > (t(1.pi / r) / 1.5 + 0.05);
bBandStop(
	splay(
		o * e,
		lfTri(r, 0)
	),
	t(r / 8).linExp(0, 1, 80, 5500),
	t(1 / 9) * 2 + 3
)

/* https://social.ordinal.garden/@f0/111583733632579377 ; Dec 15, 2023 (f0) */
let t = { :z |
	lfSaw(z, 1) + 1 / 2
};
let r = 2 ^ (gbmanN(t(-1 / 60) * 4 + 4, 1.2, 2.1).sin * (t(1 / 4) * 2 + 2)).floor.abs;
let c = [0 .. 5].collect { :n |
	n * 12 + [2 15 7 12]
}.flatten;
let o = varSaw(
	t(1 / 13) < 0.5 * 2 + 8 * 1.pi * c.midiRatio,
	0,
	t(r) / 2
) * ((t(r) ^ ((t(r / 2) * 4) + 1).abs * c).log.sin.max(0).sin.max(0) ^ 8);
let e = t(-1 * r) > (t(1.pi / r) / 1.5 + 0.05);
let x = bBandStop(
	splay(
		o * e,
		lfTri(r, 0)
	),
	t(r / 8).linExp(0, 1, 80, 5500),
	t(1 / 9) * 2 + 3
);
combN(
	rlpf(x, 800, 0.1),
	1,
	4 / 13,
	4
) / 2 + x

/* https://sonomu.club/@lukiss/111577779507616435 ; Dec 14, 2023 */
let r = { :a :b |
	let t = henonL(lfNoise2(1).expRange(0.01, 1) * 16, 1.4, 0.3, 0, 0);
	tRand(a, b, t)
};
let t = sweep(0, r(-1000, 1000)) % r(28, 512);
let b = t.bitAnd(r(64, 256)).bitOr(t.bitShiftRight(r(4, 18)));
[
	leakDc(
		0.5 * lfTri(b.midiCps % 10000, 0) * (b > 32).lag3(0.1),
		0.995
	)
] # 2

/* https://sonomu.club/@lukiss/111534969935581348 ; Dec 7, 2023 */
let p = {
	let a = [0 .. 3].collect { :n |
		n * 12 + [0 3 7 10]
	}.flatten - 24;
	sinOsc(5, 0) * 0.01 + a.shuffle.midiRatio
};
let e = lfSaw(-1 * p(), 1).max(0) ^ sinOsc(p().fractionalPart / 8, 0).linLin(-1, 1, 4, 32);
combC(
	splay(
		varSaw(
			147 * p(),
			0,
			lfSaw(
				p().degree,
				1
			) * (1 / 4) + (1 / 4)
		) * e.sanitize(0),
		sinOsc(1 / 3, 0)
	),
	0.2, 0.2, 1
)

/* https://sonomu.club/@lukiss/111534001937293189 ; Dec 07, 2023 */
let t = tDuty(1 / (2 ^ diwhite(Infinity, 0, 8)), 0, 1).kr;
let l = {
	let z = nil;
	tChoose(
		t,
		[0 .. 7].collect { :n |
			z := ((lfdNoise1(4) + 2 ^ n) / 16);
			sinOsc(z, 0).sin
		}
	).lag(0.25 / z).kr
};
let p = [1 .. 32];
let e = lfSaw(l() * p.midiRatio, 1) * 0.5 + 0.5 ^ 8;
splay(
	leakDc(
		blip(
			p * p.midiRatio * tChoose(t, 2 * p.midiCps),
			lfSaw(l(), 1).linCurve(-1, 1, 1, lfSaw(l() * p.degree, 1) * 200 + 201, 8).kr
		) * e,
		0.995
	) * 0.25,
	l()
)

/* https://sonomu.club/@lukiss/109875835273563824 ; Feb 17 2023  */
let f = { :rt | sweep(0, rt) };
let t = f(40000);
let c = f(1);
let r = [1 .. 5];
let b = [
	-1 * [24 5 0 10 8 15].midiRatio * t,
	(r + c).wrap(1, 3333),
	t.bitShiftRight(105)
].reduce(bitAnd/2);
let e = b.linCurve(0, 127, -1, 1, -8).fold(-1, 1) / 2;
splay(
	freeVerb(
		lfSaw(-1 * r, 2).max(0).lag3(0.1) * leakDc(e, 0.999),
		1 / 3,
		c.sin.max(0),
		lfSaw(c.cos, 0)
	),
	c.sin
)

/* https://sonomu.club/@lukiss/109733997253009229 ; Jan 23, 2023 */
let s = [0 2 3 6 7 8 11];
let c = s.degreeToKey([9 .. 61; 3], 12);
let o = c.midiCps.collect { :f | sinOsc(f, 0) };
let e = sinOsc(2 / c.log10, 0) * lfSaw(11 / c.-, 0).max(0).lag3(0.1);
splay(
	leakDc(o * e, 0.995),
	sinOsc(1 / c[1], 0)
)

/* https://sonomu.club/@lukiss/110281639162399169 ; Apr 29, 2023 */
let m = impulse(8, 0).kr;
let c = { :a |
	let z = [];
	a.collect { :each |
		z.addAll!(each.integerDigits(2, 8))
	};
	demand(m, 0, dseq(Infinity, z))
};
let p = m * [
	c([136 138]),
	c([8 9 8 72 8 72 9]),
	c([140 148 34]),
	c([178 58]),
	c([34])
];
let e = { :g |
	linen(g, 0.01, 1, 1, 0).kr
};
let h = henonC(1 / [1 .. 5], 1.4, 0.3, 0, 0) < 0.9;
splay(
	h * [
		lfTri(e(p[1]) ^ 18 * 133 + 80, 0) * (e(p[1]) ^ 24),
		henonC(e(p[2]) ^ 8 * 800 + 4000, 1.4, 0.3, 0, 0) * (e(p[2]) ^ 38),
		lfTri(2000, 0) * henonC(10000, 1.4, 0.3, 0, 0) * (e(p[3]) ^ 5 ^ 16),
		lfTri(110, 0) * lfTri((toggleFf(p[4]) * 7).midiRatio * 220, 0) * (e(p[4]) ^ 5 ^ 8),
		0.3 * henonC(22050, 1.4, 0.3, 0, 0) * (e(p[5]) ^ 68 + (0.5 * e(p[5]) ^ 3))
	],
	0.25
)

/* https://sonomu.club/@lukiss/111422385501420073 ; Nov 17, 2023 */
let x = cuspL(cuspL(3, 1, 1.9, 0).exp * 12 + 1, 1, 1.9, 0).fold(-1, 1);
let t = [0 .. 7].collect { :n | pulseDivider(x, 8, 7 - n) };
let d = x.linLin(-1, 1, 1 / 2, 2);
let e = { :c |
	perc(t, 0.001, d, c)
};
let c = [0, 3, 7, -2];
let f = demand(
	t,
	0,
	dseq(Infinity, c) + dxrand(Infinity, 48 + [0 .. 2].collect { :o | o * 12 + c }.flatten)
).midiCps;
splay(
	sinOsc(
		brownNoise() * 0.0125 + 1 * f,
		(brownNoise() * 0.4 * (sinOsc([3.25, 1 / 2, 2] * f, 0) * e(-58))).sum
	) * e(-6) * (sinOsc(d + 2, 0) / 4 + 0.5),
	1 / 4
)

/* https://sonomu.club/@lukiss/111455666847951601 ; Nov 23, 2023 */
let t = {
	tDuty(dseq(Infinity, [3 4 2 1 2 4] / 8), 0, 1).kr
};
let r = { :l :h |
	tExpRand(l, h, t()).lag3Ud(1 / 48, 1 / 16)
};
let e = perc(t(), r(1 / 128, 2 / 8), 1 / 6, -4).kr;
let o = (blip(r(11, 111), r(1 / 3, 333)) * e).tanh;
3.timesRepeat {
	o := leakDc(
		combC(
			o,
			3 / 4,
			r(1 / 512, 3 / 4) * (lfdNoise1([6] # 2).kr * 0.001 + 1),
			r(1 / 2, 1 / 64) * tChoose(t(), [-1, 1]).kr
		).tanh,
		0.995
	).sanitize(0)
};
o.softClip

/* https://sonomu.club/@lukiss/110533029814503247 ; Jun 13, 2023 */
let s = [0 2 4 7 9];
let p = s.degreeToKey([1 .. 14], 12).midiRatio;
let f = sinOsc(p.sin * 8, 0) * 0.005 + 1 * p * 52;
let h = sinOsc(f * 2, 0) * sinOsc(1 / 4 / p, 0) * sinOsc(1.pi / p, 0).linExp(-1, 1, 0.01, 1) * 8.pi;
let m = lfSaw(-1 * [7, 3.5, 7 / 10] * (sinOsc(f.sin.linExp(-1, 1, 0.01, 1), 0) * 0.001 + 1), 1) * 0.5 + 0.5;
let e = m ^ (sinOsc(8 / p / f.arcTan, 0) * 30 + 32);
let o = sinOsc(f, h) * e;
splay(0.5 * o, sinOsc(1.pi, 0))

/* https://sonomu.club/@lukiss/110538742878262809 ; Jun 14, 2023 */
let s = [0 2 4 7 9];
let c = s.degreeToKey([12 .. 38].shuffle, 12);
let w = lfSaw(8, 0) * 0.012 + 1;
let t = [6, 3 / 2, 3, 3 / 4, 1 / 4];
let d = demand(
	tDuty(1 / t, 0, 1),
	0,
	dseq(
		Infinity,
		[1 .. 24].collect { :n |
			dseq(1, c[1 .. c.size; n])
		}
	)
).lag3(0.001);
let e = lfSaw(-1 * t, 1) * 1 + 1 / 2;
let o = (lfSaw(w * d.midiCps, 0) * e).fold * (lfSaw(d % t.log, 0) > 0);
let f = e.lag3(0.005) ^ (lfSaw(1.pi / t, 1) * 8 + 9) * (lfSaw(0.1 / t, 1) + 1 * 5000 + 200);
splay(
	combC(moogFf(o, f, 2, 0), 0.2, 0.2, 1) * 0.8,
	lfSaw(1.pi, 0)
)

/* https://sonomu.club/@lukiss/111518889311136686 ; Dec 04, 2023 */
let t = tDuty(1 / (2 ^ diwhite(Infinity, 0, 6)), 0, 1).kr;
let r = { :lo :hi |
	tRand(lo, hi, t)
};
let l = {
	let z = nil;
	tChoose(
		t,
		[0 .. 3].collect { :n |
			z := (lfNoise2(4).kr * 2 + 3 ^ n) / 4;
			sinOsc(z, 0).sin
		}
	).lag(1 / 8 / z)
};
let e = lfSaw(l() * r(1, 8), 1).kr + 1 / 2;
let f = r(24, 48).ceiling.midiCps;
let p = [1 .. 32];
let q = sinOsc(
	f * p * p.midiRatio,
	sinOsc(p.midiRatio ^ 2, 0) * (l() * 2 - e * 2.pi)
) * ((e * p.midiRatio).log.sin.abs ^ r(4, 128));
let a = splay(q.shuffle, sinOsc(r(0.5,8), 0));
let h = sinOsc(
	sinOsc([6, 7], 0) * (1 / 6) + 2 * f,
	0
) * (1 - e ^ 8) * r(1, 32);
let b = sinOsc(f, h) * (1.1 - e ^ 2) * 0.5;
(a + b).sanitize(0)

/* https://sonomu.club/@lukiss/111749211970689312 ; Jan 14, 2024 */
let p = [1 .. 96; 4];
let c = { :a :b :c |
	standardL(a / 1.pi, 1, 0.5, 0).sin.linLin(-1, 1, b, c)
};
let t = 2 ^ (c(5, 0, 4)).floor;
let d = latch((c(13, 1, 5)).floor / t, tDuty(1 / t, 0, 1));
let l = {
	tChoose(
		tDuty(c(1.pi, 1 / t, 5) * d, 0, 1),
		[
			p * p.degree,
			p.difSqr(p.shuffle),
			p * p.log2,
			p.midiRatio
		]
	)
};
let e = perc(tDuty(d, 0, 1), d / t, d, 0);
let a = (e.linCurve(0, 1, 1, 0, c(3, 2, -8)) * p).log.sin ^ c(13, 4, 36);
let b = (e > c(9, 0.003, 0.9)).lag3(0.003);
lpf(
	splay(
		sinOsc(
			d * 55 * l(),
			sinOsc(l(), 0) * e * c(2.pi, 0, 2.pi)
		) * a * b,
		sinOsc(2.pi, 0) * e
	).sanitize(0),
	9000
)

/* https://sonomu.club/@lukiss/112090171577198222 ; Mar 14, 2024 */
let m = {
	quadL(lfdNoise1(1) + 1 ^ 2, 1, -1, -0.75, 0)
};
let i = bpf(localIn(2, 0), 440, 1);
let u = splay(
	varSaw(
		m/0 ! 12 / 4 + 111 * [0 .. 2].collect { :n |
			n * 12 + [0, 2, 5, 9]
		}.flatten.midiRatio,
		0,
		m().sin + 1 / 2 ^ 2
	) * lfSaw(-2 * m() ^ 2 * 2, 0).max(0),
	m()
);
let d = delayC(i, 1, 1 / 3);
let o = (d * (m() + 1 / 2) + u).tanh;
o * -6.dbAmp <! localOut(o)

/* https://sonomu.club/@lukiss/113012278480517510 ; Aug 24, 2024 */
let p = [1 .. 64; 2];
let r = 2 ^ (logistic(3.9, 3, 0.5) + 1 * 2.1).floor;
let e = linen(tDuty(1 / r, 0, 1).kr, 0, 1, 0.9 / r, 0);
splay(
	blip(
		73 * p * p.degreesToRadians,
		blip(r / p, 0) + 1 / 2 ^ 2 * 33
	).sin
	* (
		(1 - e * p).log.sin.sin
		^
		(blip(0.1 / r, 0) + 2 * 2)
	).sanitize(0)
	* (e > 0.1),
	blip(r, 0.1)
)

/* https://sonomu.club/@lukiss/113019188464159465 ; Aug 25, 2024 */
let k = 2 ^ standardN([1.1, 0.9], 1, 0.5, 0) * 8;
splay(
	leakDc(
		standardN(
			standardN(k, 1, 0.5, 0).max(0) * 22050,
			k.sin,
			0.5,
			0
		) / 4,
		0.995
	),
	standardN(k.sum, 1, 0.5, 0)
)

/* https://sonomu.club/@lukiss/113199362402063463 ; Sep 26, 2024 */
let t = {
	cuspL(lfdNoise1([1, 1]).max(0) ^ 2 * 32, 1, 1.9, 0)
};
let r = { :x :y |
	tRand(x, y, t())
};
sanitize(
	splay(
		companderD(
			leakDc(
				lorenzL(
					t() * sampleRate(),
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
let o = sinOsc(440, 0);
[0 .. 4].do { :n |
	o := sinOsc(
		sinOsc(o ^ n, o).linExp(-1, 1, 0.01, 1) ^ n,
		sinOsc(o + 1 ^ (n + 1).prime, 0).pi
	)
};
[o] # 2 / 3

/* https://sonomu.club/@lukiss/113469893460208702 ; Nov 12, 2024 ; ? see .scd */
let z = { :x | lfSaw(x, 0) };
let i = [1 .. 4].fibonacci; /* 1 1 2 3 */
let f = 2 ^ [0 .. 3] + i * 2;
let b = [0 2 5 7 9].localBuf;
let l = b.degreeToKey(
	standardN(f, 1, 0.5, 0).sin.sanitize(0) * z(1 / f / i) * 12,
	12
).ceiling;
let o = z(l.midiRatio * 110 * i);
splay(
	moogFf(
		z(l / (4 ^ i)) + 1 / 2 ^ 4 * o,
		z(l / (4 ^ i + (o / 8))) + 1 / 2 ^ (z(o.abs) + 1 / 2 ^ 2 * 8 + 0.5) * 8000 + 40,
		2,
		0
	),
	z(1)
)

/* https://sonomu.club/@lukiss/113817432455425855 ; Jan 13, 2025 */
let p = [1 .. 14].prime;
let o = sinOsc(p, 0);
let e = 1 / 8;
let z = 0.1 * e;
let f = p.log2 * p.midiCps + o;
let q = sinOsc(1 + o / p ^ 2, 0);
let g = fbSineN(
	z * o / p + 8,
	1,
	1 / p,
	o + (1.pi / p).degreesToRadians,
	0.5,
	0.1,
	0.1
).sin > (o.reverse % q).lag(q.max(0)).round(q * e);
let x = sinOsc(
	f,
	sinOsc(
		2 * f + o + p.sin.degreesToRadians,
		o.pi
	) * q.pi
) * adsr(g, z, e, e / 2, 2 * e, -4);
splay(
	x,
	x.sum.sin
) / 2

/* https://sonomu.club/@lukiss/113821046696857368 ; Jan 13, 2025 */
let t = lfSaw(-8, 1);
splay(
	moogFf(
		lfSaw(
			(
				12 + latch(
					(
						lfSaw(
							[1 .. 4].prime * (
								lfSaw(
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
				lfSaw(
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
