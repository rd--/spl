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
