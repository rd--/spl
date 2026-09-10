/* SCSCC-12 "Emergency Sauce" 223 bytes ; https://github.com/lukiss/SCSCC/ */
let z = { :x | LfSaw(x, 0) };
let m = { 1 << (LfNoise2(2) + 1 * 2.2) };
let x = 36;
let f = 3 * [0 .. x - 1] + 16;
let a = Sin(z(m() / 32) + 2 * 2.pi * z(MidiCps(f)));
let b = Sin(Log2(z(m()) + 1 / 2 * (1.1 + z(m() / x) * f)).Sin ^ 8);
let c = z( { -1 * m() } ! x / (m() * x)).Max(0);
FreeVerb(
	Splay(
		Lpz2(a * b * c),
		z(m() / 4)
	),
	m().Sin + 1 / 3,
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
	LfSaw(1 / 5, 0) > 0,
	a,
	[3 3 3 3 4] + a
).MidiRatio;
Splay(
	0:4.collect { :n |
		let q = f[n + 1] * p;
		(
			SinOsc(
				q,
				SinOsc(p / 5 + 3, 0) * SinOsc(7 / q[1], 0)
			) * Negate(
				SinOsc(rotate(p, n) / q, 0) + 3 ^ 2 * p).DbAmp
		).Sum / 4
	},
	SinOsc(1 / 3, 0)
)

/* SCSCC-14 "Quad Melody" 252 bytes */
let z = { :x |
	LfSaw(x, 0)
};
let l = QuadN(
	[2, 1],
	-0.001 * [0 .. 7] + 1,
	-1, -0.75, 0
).Sin;
let a = QuadN(41, 1, -1, -0.75, 0);
let b = Round(l * 5 + (5 + [0 .. 7] + 16), 5).MidiCps;
let c = Sin(1.pi * z(a / 4 + b * MidiRatio(7 * [0 .. 9])));
let d = z(-2 ^ Round(l * 3 / 2, 1) / [1 .. 3]);
let o = Splay(
	c * Lag(
		d + 1 / 2 ^ Abs(z(1 + l) ^ 0.1 * 9) / 2,
		0.003
	),
	l[1]
);
CombC(
	o,
	1,
	Lag(l, 0.1).atAll([4 8]) / 9 + [3 2] / 8,
	l.atAll([7 .. 8]) * 4
) * (1 / 8) + o

/* SCSCC-24 "Loading…" 221 bytes ; https://github.com/lukiss/SCSCC/ */
let r = (12 * [0 .. 4] +.x [0 10 15 19]).MidiRatio;
Splay(
	0:9.collect { :n |
		let a = LfSaw(1 / (2 ^ n % 111), 0);
		let b = LfSaw(-1 << [0 .. 2] / (1 + n), 0);
		let c = PmOsc(
			1 << [0 .. 2] * 0.1,
			0.1 ^ n / [0 .. 2] + 0.1,
			10 - n ^ [0 .. 2] + 3,
			0
		) + 2 * 4;
		let d = Lag(
			b + 1 / 2 ^ c * 6 / (3 << [0 .. 2]),
			0.002
		);
		let e = (1 / 2 < a * 1 / 2 + 1) * 98;
		PmOsc(
			e * r[n + 1],
			e * r[n + 2],
			d[1],
			d[2]
		) * d[3]
	},
	PmOsc(3, 1.pi, 0, 0)
)

/* SCSCC-25 "Feeling Melancholy at the Spa, In A minor" */
let r = MidiRatio(12 * [0 .. 4] +.x (5 * [0 .. 4] ++ [19]));
let z = { :x | LfSaw(x, 0) };
let h = 1 / 2;
let w = CuspL(h, 1, 1.9, 0) + 1 / 2 ^ h * 4;
let t = LfSaw(2 ^ w / 8, [0 .. 7] / 4 - 1).kr;
GVerb(
	Hpf(
		0:7.collect { :n |
			let a = TChoose(
				{ t[n + 1] } ! 4,
				110 * r
			);
			Pluck(
				CuspL(22050, 1, 1.9, 0) / 4,
				t[n + 1],
				h,
				z(n % w) / 77 + 1 / a,
				z(w + n % h) + 2.1 * 4,
				1 - z(w % h).Abs ^ 2 * h + h
			).Sum
		},
		50
	).Sum / 4,
	10, 3, 0.5, 0.5, 15, 1, 0.7, 0.5, 300
)

/* SCSCC-26 */
let c = MidiRatio(12 * (0 .. 2) +.x (5 * (0 .. 3) ++ [19]));
let m = { LfdNoise3(5 # [0.1]) + 1 / 2 };
let k = 6;
Splay(
	0:k.collect { :n |
		let q = LfPulse(
			[4 .. 8].prime * m(),
			0,
			m() / (m() * 2)
		) * 2 + 1;
		let f = q * 49;
		LeakDc(
			(
				Formant(
					c.atAllWrap(n - (6 * [0 .. 4] + 3)) * f,
					c.atAllWrap(7 + n * [0 .. 4]) + m() * f * (1 + m() * q),
					c.atAllWrap(4 + n * [0 .. 4]) + m() * f / (2 + m() * q)
				) * (m() ^ 4)
			).Sum,
			0.995
		) / 12
	}
)

/* SCSCC #32 Baum 219 */
let f = Index(
	(12 * [0 .. 5] +.x (5 * [0 .. 3] ++ [19])).asLocalBuf,
	Round(
		QuadC(1, 1, -1, -0.75, 0) + 1 / 2 * 30,
		Ceiling(QuadC(0.9, 1, -1, -0.75, 0) + 1 * 12)
	)
);
let z = Formlet(
	Hpz1(f).Abs * QuadC(22050, 1, -1, -0.75, 0),
	55 * f.MidiRatio,
	0.002,
	1
).Sin;
let o = PitchShift(
	z,
	1,
	(8 + f).Log,
	0.1,
	0.1
) + z;
Pan2(
	CombC(o, 0.2, 0.2, 1) / 6 + o / 4,
	0,
	1
)

/* SCSCC #33 "Nudge" */
let m = { LfdNoise3(1 / 3) + 1 / 2 };
let b = { :x | Blip(x, m() ^ 1.pi * 16) };
let r = MidiRatio(
	(2 * [0 .. 1] +.x (5 * [0 .. 3] ++ [19])) +.x (24 * [0 .. 2])
);
let c = r.asStream.collect { :x |
	x * (m:/0 ! 2 / 33 + 1 * 29)
};
Splay(
	{
		let p = b(m() / 9 + 4).Fold(m() / 9, 1);
		let q = b(c.next).Fold(b(c.next), b(c.next));
		LeakDc(
			Bpf(
				p ^ 5 * q,
				b(m() * 8) + 1.1 * 2000 + 100,
				1 / 3 + m()
			) / 2,
			0.995
		)
	} ! 10,
	b(m())
).transpose.Sum / 2

/* ScScc-38 "Index" ; https://github.com/lukiss/SCSCC/ */
let t = LfSaw(-7, 0);
let c = Index(
	((7 * [0 .. 3]) +.x (5 * [0 .. 3])).asLocalBuf,
	Stepper(
		t,
		0,
		LfSaw([0 .. 2] + 0.1 / 3, 0).Abs * 16,
		LfSaw([0 .. 2] + 0.1 / 1.pi, 0).Abs * 16,
		1,
		0
	)
).MidiRatio;
Splay(
	LeakDc(
		CombC(
			LfSaw(1 << [0 .. 2] / 4 * 98 * c, 0) * t.Max(0) / 2,
			0.2,
			0.2,
			1
		),
		0.995
	),
	c.Sum.Sin
)

/* SCSCC-40 "Bonus Level" ; https://github.com/lukiss/SCSCC/ */
let a = { LfNoise0(1 / 2) };
let k = { a() + 1 * 4 };
let x = 12 * [0 .. 3];
let d = x +.x [0 4 7 11];
let m = x +.x [0 3 7 10];
let r = Select(
	LfSaw( { a().round(1 / 4) } ! 4, 0) + 1 * 8,
	(
		Select(k(), [0 2 4 5 7 9 11 12])
		+
		Select(k(), [d m m d d m m d])
	)
).MidiRatio.kr;
let e = Abs(LfSaw({ 1 + a() } ! 4, 0) * 8 + 1).kr;
Splay(
	LfSaw(
		a:/0 ! 4 / 4 + 65 * r,
		0
	) ^ e / 5
)

/* SCSCC-42 The Universe is 99.9999999999999999999958% Empty */
let n = LfNoise2([0 .. 4]);
let m = Select(
	Sweep(0, 1) % 4,
	[7 12 19 24]
);
let r = Wrap(m + [0 16 7 11 -3], -12, 12).MidiRatio;
Splay(
	Blip(
		n / 133 + 1 * 198 * r,
		n + 1 * 2 + 1
	) * (n / 2 + 0.5 / 3),
	1 / 2
)

/* SCSCC-45 "Lullaby" ; Sub 256 version 194 bytes */
let r = 1 << [0 .. 2] * 1.1;
let a = LfSaw(-1 * r, 1).Max(0).Lag(0.005);
let m = Select(
	A2K(QuadN(r, [0 .. 2] / 9 + 1, -1, -0.75, 0) + 1 * 18),
	(12 * [0 .. 2]) +.x [0 2 3 5 7 10] +.x [19 0]
).MidiRatio * 49;
Splay(
	Blip(
		Blip(3.1, 33) / 3 + 1 * m,
		a + 3
	) * (a ^ 3 + (a ^ 0.3) + 0.1)
) / 8

/* ScScc-49 Lydia ; https://github.com/lukiss/SCSCC/ */
Splay(
	LfSaw(
		Select(
			Gendy3(1, 1, 1, 1, [1 .. 5] / 99, 0.5, 0.5, 12, 12) + 1 * 14,
			(12 * [0 .. 3]) +.x (2 * [0 .. 3] ++ (2 * [0 .. 2] + 7))
		).MidiRatio.kr * 49,
		0
	) / 5
)

/* SCSCC-51 #UntzUntz */
let f = 98;
let a = SinOsc(2, 0).Max(0);
let b = SinOsc(3 / (2 * f), 0) + 1.001 / 11;
let c = SinOsc(2, 4).Max(0);
let d = SinOsc(1.9 / f, 0) + 4 * 4;
let e = SinOsc(SinOsc(4 / f, 0) ^ 1.pi * f + f * SinOsc(f, 0), 0);
let g = SinOsc(1 / 2, 1.9) ^ (SinOsc(0.992 / 7, 0) + 6 * 66);
let h = Sum(SinOsc([14 15].fibonacci, 0)) * SinOsc(4 / f, 0) / 2;
Pan2(
	LeakDc(
		SinOsc(
			Log(a ^ b * 11).Sin ^ 5 * 4 * f,
			c ^ d * e + (g * h)
		) / 3,
		0.995
	),
	0,
	1
)

/* SCSCC-53 Into the abyss */
let o = Lpz2(
	Splay(
		LeakDc(
			DelayC(
				LocalIn(2, 0) + 1 * 2,
				1,
				SinOsc(0.009 / [1 .. 8], 0).ExpRange(0.01, 1)
			),
			0.995
		).Sin
	)
);
(o / 5) <! LocalOut(o)

