/*  SCSCC-2 "Crispy Rubber" 138 bytes ; https://github.com/lukiss/SCSCC/ */
let m = sinOsc(quadC(1, 1, -1, -0.75, 0) ^ 2 * 8, 0);
let f = quadC(m ^ m ^ m, 1, -1, -0.75, 0).linExp(-1, 1, 0.01, 1) * 99 + 12;
pan2(
	bpf(
		sinOsc(
			f,
			sinOsc(m ^ f * 2, 0) * m * 2.pi).sign,
		(m * m).linExp(-1, 1, 0.01, 1) * 5000 + (m * 99),
		1
	),
	0,
	1 / 3
)

/* SCSCC-3 "House Classic" 182 bytes. */
let t = lfTri([2 1 2], [0 0 2]);
let e = { :x | perc(x, 0.01, 1, -4) };
let c = cuspL(22050, 1, 1.9, 0);
let l = [0] # 9 + [0 1];
[
	lfTri(e(t[1]) ^ 11 * 111 + 60, 0) * e(t[1]) ^ 2,
	c * Env(
		l,
		l[1 .. 7] ++ [66] / 99,
		[-4] # 7 ++ [-17],
		nil,
		nil,
		0
	).asEnvGen(t[2]),
	c * (e(t[3]) ^ 9) / 2
].sum.pan2(0, 1 / 4)

/* SCSCC-4 "HandClap Special" 121 bytes */
let l = [0] # 9 + [0, 1];
let e = Env(
	l,
	l[1 .. 7] ++ [66] / 99,
	[-4] # 7 ++ [-17],
	nil,
	nil,
	0
);
let t = tDuty(
	dseq(Infinity, 168044.integerDigits(3) / 5),
	0,
	1
);
bpf(
	envGen(t, 1, 0, 1, 0, e) * cuspL(22050, 1, 1.9, 0),
	444 * [4 7],
	1
)

/* SCSCC-5 "Printer Gone Mad" 138 bytes ; https://github.com/lukiss/SCSCC/ */
let r = 9000;
let t = sweep(0, r) % r;
let d = { tRand(0, 256, t < 1) };
let o = d();
{
	o := bitOr(
		o,
		(
			bitOr(
				bitOr(
					bitAnd(
						(t / d() / 4),
						d()
					),
					bitAnd(
						(t / d()) % o,
						d()
					)
				),
				bitAnd(
					o > d() * bitOr(
						bitAnd(t * 2, d()),
						d()
					),
					bitAnd(t * d(), t / d())
				)
			)
		)
	)
} ! 5;
pan2(
	leakDc(o, 0.995).fold,
	0,
	1 / 9
)

/* SCSCC-5 "Printer Gone Mad" 138 bytes ; local operator definitions */
let r = 9000;
let t = sweep(0, r) % r;
let d = { tRand(0, 256, t < 1) };
let o = d();
let | = bitOr/2;
let & = bitAnd/2;
{
	o := (
		o
		| ((t / d() / 4)
			& d()
			| ((t / d()) % o & d())
			| (( o > d() * (t * 2 & d() | d()))
				& (t * d() & (t / d()))))
	)
} ! 5;
pan2(
	leakDc(o, 0.995).fold,
	0,
	1 / 9
)

/* SCSCC-9 "1991" 234 bytes */
let x = lfNoise2(1).kr + 1.002;
let t = lfPulse(x * 4, 0, 0.9).kr;
let e = Env([-8 8 0], [0.1 0.9], 3, nil, nil, 0);
let g = { envGen(t, 1, 0, 1.1 - x, 0, e).midiRatio };
let d = { lfTri({ rand(1, 1.pi) } ! 4, 0) * [0 .. 3] / 66 + 1 };
splay(
	[
		lfPulse(147 * g() * d(), 0, d() / 4) / 1.3,
		lfSaw(588 * g() * d(), 0) / 4,
		lfTri(73 * g() * d(), 0)
	].sum * lagUd(t, 0.001, x / 2)
) / 8

/* SCSCC-11 "Encore" 214 bytes ; Error? */
let z = { :x | lfSaw(x, 0) };
let i = [1 1 2 3];
let f = 1 << [0 .. 3] + i * 2; /* 4 6 12 22 */
let l = degreeToKey(
	[0 2 5 7 9].localBuf,
	standardN(f, 1, 0.5, 0) * z(1 / f) * 12,
	12
);
let o = z(l.midiRatio * 110 * i);
let g = l / (4 ^ i);
let a = z(g) + 1 / 2 ^ 4 * o;
let b = z(o + g) + 1 / 2 ^ (z(g / i) + 1 * 8 + 0.1) * 8000 + 40;
let c = moogFf(a, b, 2, 0);
splay(c, z(1))

/* SCSCC-12 "Emergency Sauce" 223 bytes ; https://github.com/lukiss/SCSCC/ */
let z = { :x | lfSaw(x, 0) };
let m = { 1 << (lfNoise2(2) + 1 * 2.2) };
let x = 36;
let f = 3 * [0 .. x - 1] + 16;
let a = sin(z(m() / 32) + 2 * 2.pi * z(f.midiCps));
let b = sin(log2(z(m()) + 1 / 2 * (1.1 + z(m() / x) * f)).sin ^ 8);
let c = z( { -1 * m() } ! x / (m() * x)).max(0);
freeVerb(
	splay(
		lpz2(a * b * c),
		z(m() / 4)
	),
	m().sin + 1 / 3,
	m() / x,
	x / m()
)

/* SCSCC-13 "Waiting for Something Good to Happen" 204 bytes ; https://github.com/lukiss/SCSCC/ */
let a = [0 8 10 15 18];
let p = 1 << [0 .. 4];
let ugenIf = { :p :a :b |
	(p * (a - b)) + b
};
let f = 82 * ugenIf(
	lfSaw(1 / 5, 0) > 0,
	a,
	[3 3 3 3 4] + a
).midiRatio;
splay(
	[0 .. 4].collect { :n |
		let q = f[n + 1] * p;
		(
			sinOsc(
				q,
				sinOsc(p / 5 + 3, 0) * sinOsc(7 / q[1], 0)
			) * negate(
				sinOsc(rotate(p, n) / q, 0) + 3 ^ 2 * p).dbAmp
		).sum / 4
	},
	sinOsc(1 / 3, 0)
)

/* SCSCC-14 "Quad Melody" 252 bytes */
let z = { :x |
	lfSaw(x, 0)
};
let l = quadN(
	[2, 1],
	-0.001 * [0 .. 7] + 1,
	-1, -0.75, 0
).sin;
let a = quadN(41, 1, -1, -0.75, 0);
let b = round(l * 5 + (5 + [0 .. 7] + 16), 5).midiCps;
let c = (1.pi * z(a / 4 + b * midiRatio(7 * [0 .. 9]))).sin;
let d = z(-2 ^ round(l * 3 / 2, 1) / [1 .. 3]);
let o = splay(
	c * lag(
		d + 1 / 2 ^ (z(1 + l) ^ 0.1 * 9).abs / 2,
		0.003
	),
	l[1]
);
combC(
	o,
	1,
	lag(l, 0.1).atAll([4 8]) / 9 + [3 2] / 8,
	l.atAll([7 .. 8]) * 4
) * (1 / 8) + o

/* SCSCC-15 "bitwise Bird Calls" 93 bytes */
let r = tRand(1, 255, dust(2));
let t = sweep(0, 1) * r.sin * 999 % r;
let b = t.bitAnd(r);
pan2(
	saw(
		13 * b.bitOr(t >> r)
	) * (b > 66) / 3,
	0,
	1
)

/* SCSCC-18 "Bone Spurs" 165 bytes */
let b = [
	bLowShelf/4, bPeakEq/4, bHiShelf/4, bLowPass/3,
	bHiPass/3, bBandPass/3, bBandStop/3, bAllPass/3
];
let q = { :x | quadN(x, 1, -1, -0.75, 0).sin };
let o = localIn(1, 0) + 0.1;
[0 .. 7].collect { :n |
	let f = 1.1 ^ n;
	let c = b[n + 1].cull(
		o,
		q(f ^ 2 * f) + 1.1 / 2 ^ 4 * 4444 + 33,
		q(0.1 * f) + 1.005,
		0
	);
	o := (3 * c).tanh
};
pan2(o, 0, 1 / 11) <! localOut(combC(o, 0.2, 0.2, 1))

/* SCSCC-19 "Nervous Arpeggios" 138 bytes */
let c = [7 / 3, 1.78, 3 / 2,1] *.x [1, 2];
let t = sweep(0, 1) * 8000;
let a = cuspL(c, 1, 1.9, 0).reverse;
let b = cuspL(c, 1, 1.9, 0) + 1 * 64;
let d = bitOr(
	bitAnd(t * c, b),
	t >> ( 2 * [0 .. 2] + 4)
) % 256;
pan2(
	sum(1 / 8 < a * (leakDc(d, 0.995) / 8).fold),
	0,
	1 / 8
)

/* SCSCC-21 "Byte Beat Business" 104b */
let e = 256;
let t = sweep(0, 8000);
let | = bitOr/2;
let & = bitAnd/2;
let a = ((t >> 8 % e) | (t / 5 & (t / 2816 % e)));
let b = (t >> 9 % e | (t * 2 & (t / 1792 % 16)));
pan2(
	leakDc(a | b, 0.995).clip,
	0,
	1 / 22
)

/* SCSCC-22 "Siv" 238 */
let h = 1 / 2;
let e = 1 / 4 > lfSaw(h, 0);
brf(
	splay(
		lfSaw(
			(
				e / 2 + 1 * [82 146 195 246]
				*
				(lfSaw(0.1 + [0 .. 3] * 3, 0).abs / 24 + 1)
			),
			0
		),
		lfSaw(h, 0)
	),
	lfSaw(h / (9 / 7 + lfSaw(h / 34, 0) ^ 2 * 4), 0).abs * 4000 + 82,
	4
) * (
	lfSaw(-8, 1) + 1 / 2 ^ (lfSaw(h / 27, 0).abs * 8 + h) / 2
	+
	(slew(e, 1000, 1) ^ (lfSaw(h / 46, 0).abs * 3 + h))
) / 5 * line(0, 1, 9)

/* SCSCC-23 "Back to 1991" 228bytes (updated 20250327) */
let t = tDuty(dseq(Infinity, [3] # 4 ++ ([2] # 2) / 8), 0, 1);
let e = perc(t, 0.01, 1, -4) ^ 1.9;
let r = demand(t, 0, dseq(Infinity, 'HHHJKHHHJJKK'.ascii - 66 / 6));
let f = pmOsc([0 .. 3] + 5, 0, 0, 0) / 87 + 1 * 247 * r * [1 / 8, 1, 6 / 5, 3 / 4];
let o = e * pmOsc(
	f,
	f * [2 3 3 3],
	1.1 + pmOsc(0.1, 0.9, 1, 0) * e + 1,
	3 + e
).sum / 9;
pan2(
	combC(
		o,
		0.2,
		0.2,
		1
	) / 9 + o,
	0,
	1
)

/* SCSCC-24 "Loading..." 221 bytes ; https://github.com/lukiss/SCSCC/ */
let r = (12 * [0 .. 4] +.x [0 10 15 19]).midiRatio;
splay(
	[0 .. 9].collect { :n |
		let a = lfSaw(1 / (2 ^ n % 111), 0);
		let b = lfSaw(-1 << [0 .. 2] / (1 + n), 0);
		let c = pmOsc(
			1 << [0 .. 2] * 0.1,
			0.1 ^ n / [0 .. 2] + 0.1,
			10 - n ^ [0 .. 2] + 3,
			0
		) + 2 * 4;
		let d = lag(
			b + 1 / 2 ^ c * 6 / (3 << [0 .. 2]),
			0.002
		);
		let e = (1 / 2 < a * 1 / 2 + 1) * 98;
		pmOsc(
			e * r[n + 1],
			e * r[n + 2],
			d[1],
			d[2]
		) * d[3]
	},
	pmOsc(3, 1.pi, 0, 0)
)

/* SCSCC-25 "Feeling Melancholy at the Spa, In A minor" */
let r = midiRatio(12 * [0 .. 4] +.x (5 * [0 .. 4] ++ [19]));
let z = { :x | lfSaw(x, 0) };
let h = 1 / 2;
let w = cuspL(h, 1, 1.9, 0) + 1 / 2 ^ h * 4;
let t = lfSaw(2 ^ w / 8, [0 .. 7] / 4 - 1).kr;
gVerb(
	hpf(
		[0 .. 7].collect { :n |
			let a = tChoose(
				{ t[n + 1] } ! 4,
				110 * r
			);
			pluck(
				cuspL(22050, 1, 1.9, 0) / 4,
				t[n + 1],
				h,
				z(n % w) / 77 + 1 / a,
				z(w + n % h) + 2.1 * 4,
				1 - z(w % h).abs ^ 2 * h + h
			).sum
		},
		50
	).sum / 4,
	10, 3, 0.5, 0.5, 15, 1, 0.7, 0.5, 300
)

/* SCSCC-26 */
let c = midiRatio(12 * [0 .. 2] +.x (5 * [0 .. 3] ++ [19]));
let m = { lfdNoise3([0.1] # 5) + 1 / 2 };
let k = 6;
splay(
	0:k.collect { :n |
		let q = lfPulse(
			[4 .. 8].prime * m(),
			0,
			m() / (m() * 2)
		) * 2 + 1;
		let f = q * 49;
		leakDc(
			(
				formant(
					c.atAllWrap(n - (6 * [0 .. 4] + 3)) * f,
					c.atAllWrap(7 + n * [0 .. 4]) + m() * f * (1 + m() * q),
					c.atAllWrap(4 + n * [0 .. 4]) + m() * f / (2 + m() * q)
				) * (m() ^ 4)
			).sum,
			0.995
		) / 12
	}
)

/* SCSCC-27 The schmidt Trigger Ugen (223 bytes) */
let t = 0.1;
let r = midiRatio(12 * [0 .. 2] +.x (5 * [0 .. 4] ++ [19])) * 98;
let f = {
	(
		tChoose(dust(t), r).lag(0.1)
		*
		(lfNoise2([t t]) * 0.003 + 1)
	).kr
};
splay(
	[0 .. 4].collect { :n |
		let a = {
			sinOsc(
				f(),
				sinOsc(
					1 << n * f() / 2,
					0
				) * max(lfNoise2(t), 0)
			) * sinOsc(f() % 1.pi * t, 0)
		} ! 3;
		leakDc(
			lpz2(
				schmidt(a[1], a[2], a[3])
			),
			0.995
		)
	}
).mix * t * line(0, 1, 9)

/* SCSCC-28 256b Dub */
let f = 53;
let h = 1 / 3;
let r = midiRatio(12 * [0 .. 3] +.x (5 * [0 .. 4] ++ [19]));
let l = nil;
let a = nil;
let o = splay(
	0:12.collect { :n |
		l := lfSaw(1 / (2 ^ n % f), 0).abs;
		a := 4 + l;
		let p = (n + 1).prime;
		let x = 1 / 2 < l * 1 / 2 + 1 * 66 * r;
		let y = x.atAllWrap([n + 1, p + 1]);
		let z = lag(
			lfSaw(
				-2 << [0 .. 2] / (2 ^ (p % 15) % f) * h,
				0
			) + 1 / 2 ^ (5 * a) * (3 - a ^ n % a * 2),
			0.002
		);
		pmOsc(y[1], y[2], z[1], z[2]) * z[3] / 7
	},
	h
);
combC(
	o,
	h,
	pmOsc(h, [7, 9], l, 0) * 0.007 + 1 / 4,
	a
) / 9 + o

/* SCSCC #29 Dystopian B-Movie Sauce 199b */
let m = { lfNoise2(0.003) + 1 / 2 };
let b = { :x |
	varSaw(
		x,
		0,
		varSaw(
			m/0 ! 2 / 33,
			0,
			0.5
		) + 1 / 2
	)
};
let f = m() / 2 + 69;
let o = b(f);
9.timesRepeat {
	o := leakDc(
		b(
			f := lfNoise2([33, 33]) / 222 + 1 * f * 1.189
		).fold(
			b(2 / 3 * f),
			b(3 / 2 * f)
		).blendXFade(
			o,
			b(m() ^ 1.pi / 9).abs
		),
		0.995
	)
};
o / 5 * line(0, 1, 14)

/* SCSCC #32 Baum 219 */
let f = bufIndexClip(
	(12 * [0 .. 5] +.x (5 * [0 .. 3] ++ [19])).localBuf,
	round(
		quadC(1, 1, -1, -0.75, 0) + 1 / 2 * 30,
		ceiling(quadC(0.9, 1, -1, -0.75, 0) + 1 * 12)
	)
);
let z = formlet(
	hpz1(f).abs * quadC(22050, 1, -1, -0.75, 0),
	55 * f.midiRatio,
	0.002,
	1
).sin;
let o = pitchShift(
	z,
	1,
	(8 + f).log,
	0.1,
	0.1
) + z;
pan2(
	combC(o, 0.2, 0.2, 1) / 6 + o / 4,
	0,
	1
)

/* SCSCC #33 "Nudge" */
let m = { lfdNoise3(1 / 3) + 1 / 2 };
let b = { :x | blip(x, m() ^ 1.pi * 16) };
let r = midiRatio(
	(2 * [0 .. 1] +.x (5 * [0 .. 3] ++ [19])) +.x (24 * [0 .. 2])
);
let c = Stream(r).collect { :x |
	x * (m/0 ! 2 / 33 + 1 * 29)
};
splay(
	{
		let p = b(m() / 9 + 4).fold(
			m() / 9,
			1
		);
		let q = b(c.next).fold(
			b(c.next),
			b(c.next)
		);
		leakDc(
			bpf(
				p ^ 5 * q,
				b(m() * 8) + 1.1 * 2000 + 100,
				1 / 3 + m()
			) / 2,
			0.995
		)
	} ! 10,
	b(m())
).transpose.sum / 2

/* SCSCC #35 "Fitba" */
splay(
	lag(
		standardL(
			5555,
			[0 .. 19].degreesToRadians / 60 + 1.1,
			0.5,
			0
		) / 7,
		0.002
	)
) * line(0, 1, 0.05)

/* SCSCC #36 "LFSausy Hats" */
let z = { :a | lfSaw(-1 * a, 1) };
let f = 7777;
let n = z(42 * [0 .. 6] + (0.1 * f)).sum;
let m = z(8) + 1 / 2 ^ (z(2) > 0 ^ 6 * 6 + 0.9) / 3;
let a = m * hpf(apf(n, f / 2, z(1 / 18).abs ^ 0.1), f).clip / 8;
let b = (1.pi * z(z(2) + 1 / 2 ^ 32 * 110 + 55)).sin * lag(z(2) + 1 / 2, 0.001) / 3;
let c = (z(n / 4 + 1 * [540 800]).sum / 88 * (z(8 / [7 13 11]).max(0) ^ 8)).sum;
pan2(a + b + c, 0, 1)

/* ScScc-38 "Index" ; https://github.com/lukiss/SCSCC/ */
let t = lfSaw(-7, 0);
let c = bufIndexClip(
	((7 * [0 .. 3]) +.x (5 * [0 .. 3])).localBuf,
	stepper(
		t,
		0,
		lfSaw([0 .. 2] + 0.1 / 3, 0).abs * 16,
		lfSaw([0 .. 2] + 0.1 / 1.pi, 0).abs * 16,
		1,
		0
	)
).midiRatio;
splay(
	leakDc(
		combC(
			lfSaw(1 << [0 .. 2] / 4 * 98 * c, 0) * t.max(0) / 2,
			0.2,
			0.2,
			1
		),
		0.995
	),
	c.sum.sin
)

/* SCSCC-40 "Bonus Level" ; https://github.com/lukiss/SCSCC/ */
let a = { lfNoise0(1 / 2) };
let k = { a() + 1 * 4 };
let x = 12 * [0 .. 3];
let d = x +.x [0 4 7 11];
let m = x +.x [0 3 7 10];
let r = selectT(
	lfSaw( { a().round(1 / 4) } ! 4, 0) + 1 * 8,
	(
		selectT(k(), [0 2 4 5 7 9 11 12])
		+
		selectT(k(), [d m m d d m m d])
	)
).midiRatio.kr;
let e = (lfSaw({ 1 + a() } ! 4, 0) * 8 + 1).abs.kr;
splay(
	lfSaw(
		a/0 ! 4 / 4 + 65 * r,
		0
	) ^ e / 5
)

/* SCSCC-41 "fifs" */
let t = lfSaw(
	-8 / (lfSaw(1 / 2, 1) < 0.5 + 2),
	-1
) + 1 / 2;
let o = splay(
		t ^ 2 * lfSaw(
			131 * midiRatio(
				floor(
					lfSaw(1 / 32, 0) * 8
				) * 5 + round(
					3.1 * lfSaw(1 / 8, 1 / 16).max(0), 2
				) + [9 4 7 0] % 12 +.x [19 0]
			),
			0
		) ^ (2.1 - t)
) / 3;
combC(
	o,
	1 / 4,
	1 / 4,
	1
) / 4 + o

/* SCSCC-42 The Universe is 99.9999999999999999999958% Empty */
let n = lfNoise2([0 .. 4]);
let m = selectT(
	sweep(0, 1) % 4,
	[7 12 19 24]
);
let r = (m + [0 16 7 11 -3]).wrap(-12, 12).midiRatio;
splay(
	blip(
		n / 133 + 1 * 198 * r,
		n + 1 * 2 + 1
	) * (n / 2 + 0.5 / 3),
	1 / 2
)

/* SCSCC-43 The Universe is 0.0000000000000000000042% Full */
let n = lfNoise2([0 .. 9]);
let m = selectT(
	sweep(0, 1) % 4,
	[7 12 19 24]
);
let r = (
	(m + [0 16 7 11 -3]).wrap(-12, 12)
	+.x
	[0 7]
).midiRatio;
splay(
	blip(
		n / 99 + 1 * 147 * r,
		blip(
			[4, 1 / 3, 2],
			n + 1 * 8
		) * n + 1 * 4
	) * blip(2, n + 1 * 5)
) * line(0, 1, 0.1)

/* SCSCC-45 "Lullaby" ; Sub 256 version 194 bytes */
let r = 1 << [0 .. 2] * 1.1;
let a = lfSaw(-1 * r, 1).max(0).lag(0.005);
let m = selectT(
	a2K(quadN(r, [0 .. 2] / 9 + 1, -1, -0.75, 0) + 1 * 18),
	(12 * [0 .. 2]) +.x [0 2 3 5 7 10] +.x [19 0]
).midiRatio * 49;
splay(
	blip(
		blip(3.1, 33) / 3 + 1 * m,
		a + 3
	) * (a ^ 3 + (a ^ 0.3) + 0.1)
) / 8

/* SCSCC-47 "Toggle bits and wrap them" 213 bytes ; Interactive!!! */
let i = toggleFf(
	coinGate(
		[mouseY(0, 1, 0, 0.2)] # 8 / 3,
		lfSaw(
			localIn(1, 0) + 1 * mouseX(0, 23.pi, 0, 0.2),
			0
		)
	)
) * (128 >> (0 .. 7));
let f = i.sum.tan;
let o = lpz2(
	leakDc(
		selectT(
			lfSaw(
				sum(i) + f,
				0
			) + 1 * 4.3 - 1,
			i
		) / 2,
		lfSaw(-1 * f, 0) * 0.005 + 0.995
	).wrap
);
pan2(o, 0, 1 / 8) <! localOut(o)

/* ScScc-49 Lydia ; https://github.com/lukiss/SCSCC/ */
splay(
	lfSaw(
		selectT(
			gendy3(1, 1, 1, 1, [1 .. 5] / 99, 0.5, 0.5, 12, 12) + 1 * 14,
			(12 * [0 .. 3]) +.x (2 * [0 .. 3] ++ (2 * [0 .. 2] + 7))
		).midiRatio.kr * 49,
		0
	) / 5
)

/* SCSCC-50 WIP Ba Be Bi Ba */
let a = ('R[jln-/457Kcjlm+-144Bckno!/144'.ascii - 6).clump(10);
let t = cuspN(cuspN(4, 1, 1.9, 0) + 1.1 * 3, 1, 1.9, 0);
let u = hpz2(t).abs > 0;
let b = midiCps(
	cuspN(2 + t * 99, 1, 1.9, 0) / 99 + 1 * tChoose(
		u,
		a + dc(0)
	).clump(5)
) * lag3Ud(trig1(u, t + 1.1 / 7), 1 / 77, 1 / 23);
eqPan2(
	sum(
		formant(
			midiCps(t + 1 * 6 + 42),
			b[1],
			b[2]
		) * (1 / [1 4 12 17 23])
	) / 8,
	0
)

/* SCSCC-51 #UntzUntz */
let f = 98;
let a = sinOsc(2, 0).max(0);
let b = sinOsc(3 / (2 * f), 0) + 1.001 / 11;
let c = sinOsc(2, 4).max(0);
let d = sinOsc(1.9 / f, 0) + 4 * 4;
let e = sinOsc(sinOsc(4 / f, 0) ^ 1.pi * f + f * sinOsc(f, 0), 0);
let g = sinOsc(1 / 2, 1.9) ^ (sinOsc(0.992 / 7, 0) + 6 * 66);
let h = sum(sinOsc([14 15].fibonacci, 0)) * sinOsc(4 / f, 0) / 2;
pan2(
	leakDc(
		sinOsc(
			log(a ^ b * 11).sin ^ 5 * 4 * f,
			c ^ d * e + (g * h)
		) / 3,
		0.995
	),
	0,
	1
)

/* SCSCC-53 Into the abyss */
let o = lpz2(
	splay(
		leakDc(
			delayC(
				localIn(2, 0) + 1 * 2,
				1,
				sinOsc(0.009 / [1 .. 8], 0).expRange(0.01, 1)
			),
			0.995
		).sin
	)
);
(o / 5) <! localOut(o)

/* https://social.toplap.org/@scscc/117388299280203771 */
let p = [1 .. 32];
let m = 2 ^ (p / 12);
let w = dwhite(Infinity, [0 0 0], 1);
let r = duty(w[1], w[2], w[3]).kr;
pan2(
	sum(
		(
			lfSaw(
				1 / r,
				0
			).max(0) * m
		).fold + 1 / 2 ^ (r * 9 + 4) * sinOsc(r * 98 * p * m, 0)
	),
	0,
	0.1
)
