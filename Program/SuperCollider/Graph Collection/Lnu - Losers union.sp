/* Feedback loop ; https://github.com/lukiss/Losers-Union-SC-Research ; https://sonomu.club/@lukiss/110559281598022900 */
let i = localIn(2, [0 0]);
let o = splay2(
	leakDc(
		delayC(
			i + ((1 + i) ^ 0.999),
			1,
			sinOsc(0.01 / [1 .. 8], 0).expRange(0.01, 1)
		),
		0.995
	).tanh
);
lpf(o, 5000) / 5 <! localOut(o)

/* Broken Saws ; https://github.com/lukiss/Losers-Union-SC-Research ; https://sonomu.club/@lukiss/110561365086055899 */
let c = [49 175 98 147 65 233];
let r = 3 / 4 / [1 .. c.size];
splay(
	bpf(
		varSaw(
			varSaw(r + 6, 0, 1 / 2) * 2 + c,
			0,
			varSaw(1 / r, 0, 0.5) ^ 2
		) ^ (varSaw(0.001 / r + 8, 0, varSaw(1 / 3, 0, 0.5).abs) * 12 + 13),
		varSaw(
			0.003 / r,
			0,
			varSaw(r * 8, 0, 0.5)
		).lag3(0.1).abs * 4000 + 80,
		1.1 - varSaw(8 * r, 0, 0.5) ^ 2
	) * varSaw(r / c, 0, 0.5) / 2,
	varSaw(1, 0, varSaw(1, 0, 0.5))
) * line(0, 1, 20)

/* ChaosGen writes melodies ; https://github.com/lukiss/Losers-Union-SC-Research ; https://sonomu.club/@lukiss/110751954599483552 */
let p = system.coin(0.5).if {
	gbmanN([8 4 6 2], 1.2, 2.1).linLin(-1, 1, 8, 32).ceiling
} {
	standardN([8 4 6 2], 1, 0.5, 0).linLin(-1, 1, 12, 48).ceiling
};
let f = degreeToKey(
	[0 2 3 5 7 8 10].localBuf,
	p,
	12
).midiCps;
let m = sinOsc([8 4 0.5 1], 0);
let e = perc(m, 0.001, 1 / 8, -4);
splay(
	delayC(
		freeVerb(
			sinOsc(
				f,
				sinOsc(3 * f, 0) * e ^ 2 * (sinOsc(1.1 ^ [0 .. 3] / 16, 0) * 2 + 3)
			) * e,
			m.abs / 2,
			1 - m ^ 2 * 2,
			1 - m.expRange(0.01, 1)
		),
		0.2,
		m.abs / 2048
	),
	m[3]
) / 2

/* Stretching again ; https://github.com/lukiss/Losers-Union-SC-Research */
let c = 16;
let f = 41;
let t = [0 .. c].collect { :n |
	pulseDivider(impulse(f, 0), c, 15 - n)
};
splay(
	playBuf(
		1,
		sfAcquireMono('Floating'),
		lfNoise2([1] # c) * 0.1 / c + 1,
		t,
		sweep(0, mouseX(0.001, 1 / 5, 1, 0.2)) % 1 * 180000,
		0,
		0
	) * sine(t, c / f),
	7 / 8
) / 2

/* KaosSprinkler ; https://github.com/lukiss/Losers-Union-SC-Research */
let c = 1.5 ^ [0, 4 .. 12];
let e = standardN(c, 1, 0.5, 0).expRange(0.01, 1);
splay(
	leakDc(
		-12.dbAmp * standardN(
			e * c * 220,
			lfdNoise3([1] # 4) * 0.1 + 0.97215,
			1 / 4,
			1 / 4
		) * e.reverse,
		0.995
	),
	standardN(e.last * 14, 1, 0.5, 0)
)

/* Phasing Patterns ; https://github.com/lukiss/Losers-Union-SC-Research ; https://sonomu.club/@lukiss/110888653997752683 */
let f = (48 + [0 .. 2].collect { :n |
	[0 -5 15 10] + (n * 12)
}.++).midiCps;
splay(
	sinOsc(
		f,
		sinOsc(f * 2, 0) * (sinOsc(1 / f.arcCosh / (sinOsc(1 / f, 0) * f), 0) * 8 + 8)
	) * (sinOsc(1.2 ^ f.normalizeSum, 0) ^ 1.5 * sinOsc(f.arcTan, 0)),
	sinOsc(1 / 8, 0)
) / 3

/* Mistakes were made ; https://github.com/lukiss/Losers-Union-SC-Research */
let p = 9 / 7 ^ [0 .. 16];
let c = { :freq |
	linCongC(freq, 1.1, 0.13, 1, 0)
};
let d = (c(c(p.arcTan) ^ 2 * 4) ^ 4 * 8).abs;
let t = c(c(d / p.arcTan).round(1 / d) ^ 4 * d * 8).sin;
let f = tRand(0, 64, t).ceiling.midiCps;
splay(
	leakDc(
		pluck(
			(sinOsc(
				f * p * p.log,
				0
			) * sinOsc(f * p * p.log / 2, 0) * 2 * d).sin,
			t,
			0.1,
			t.expRange(0.01, 1) / d / p,
			(t ^ 1.5 * f) * (d / p.scramble),
			(p * (1 - t.expRange(0.01, 1))).sin.expRange(0.9999, 0.5)
		),
		0.995
	)
).tanh / 3

/* Grains, Daily ; https://github.com/lukiss/Losers-Union-SC-Research */
let m = { :lo :hi |
	standardL(lfdNoise1(1).expRange(0.01, 1) * 8 + 0.1, 2, 0.5, 0).expRange(lo, hi)
};
let f = {
	standardL(m(1, 128), m(1, 3), 0.5, 0).expRange(40, 5000)
};
let n = 8;
leakDc(
	grainFm(
		n,
		impulse(f() / m(0.5, 8), 0),
		m(0.1, 4) / f(),
		f(),
		m(1 / 4, 4) * f(),
		m(1 / 4, 4),
		standardL(f() / 2, 1, 0.5, 0) / 2,
		-1,
		1024
	).splay,
	0.995
).softClip / 2

/* Spa saw Shower Wash ; https://github.com/lukiss/Losers-Union-SC-Research ; https://sonomu.club/@lukiss/111427906537919703 */
let c = 2048.sineTable(1 / [1 .. 128], [0]).normalizeSignal.wavetableFormat.localBuf;
let w = { :freq |
	lfdNoise3(freq).linLin(-1, 1, 80, 6880) /* linCurve */
};
let f = sinOsc(
	{ rand(3.3, 4.4) } ! 6,
	0
) * 0.01 + 1 * [82 123 196 147 41 55];
let o = splay(
	osc(
		c,
		f,
		osc(
			c,
			f * 3,
			0
		) * sinOsc(1 / rand(33, 45), 0).pi
	) / 5,
	sinOsc(1 / 1.pi, 0)
);
o := bHiPass4(o, w(1 / 7), 1) + bpf(o, w(1 / 5), 1) + moogFf(o, w(1 / 3), 2, 0);
4.timesRepeat {
	o := allpassC(o, 1, { rand(1 / 16, 1 / 32) } ! 2, 1)
};
o

/* Suspect jazz ; https://github.com/lukiss/Losers-Union-SC-Research */
let x = henonL(1 + lfdNoise1(3).expRange(0.01, 1) * 8, 1.4, 0.3, 0, 0).fold;
let t = [0 .. 8].collect { :n |
	pulseDivider(x, 8, 7 - n)
};
let d = 1.5 + x.expRange(0.01, 1);
let e = { :c |
	perc(t, 0.004, d, c)
};
let c = [0 3 7 -2];
let f = demand(
	t,
	0,
	[
		drand(Infinity, c),
		dxrand(
			Infinity,
			48 + [0 .. 2].collect { :o |
				o * 12 + c
			}.++
		)
	].sum
).midiCps;
let o = sinOsc(
	(brownNoise() * 0.015 + 1) * f,
	(brownNoise() / 4 * sinOsc([3.25 0.5 2] * f, 0) * e(-28)).sum
) * e(-6) * (sinOsc(d + 2, 0) * 0.25 + 0.5);
splay(o, 3 / 4)

/* Phase Modulation Washer ; https://github.com/lukiss/Losers-Union-SC-Research ; https://sonomu.club/@lukiss/111071167369230347 */
let p = [1, 3 .. 64];
let n = 110;
let f = p / 1.pi * p.degreesToRadians * n;
splay(
	pmOsc(
		f,
		f * 2,
		sinOsc(f / n, 0) * sinOsc(n / f, 0) * 2,
		sinOsc(3 / p, 0).pi
	) * sinOsc(1 / p, 0),
	sinOsc(sinOsc(0.1 / n, 0) * 8, 0) / sinOsc(1 / n, 0) / 2
) / 3

/* Something awfully old ; https://github.com/lukiss/Losers-Union-SC-Research ; requires=kr */
let a = localBuf(1, 8 * 2048);
let f = {
	lfdNoise3([0.001] # 7).tan.abs.kr
};
splay(
	leakDc(
		combC(
			warp1(
				1,
				a,
				f(),
				f() * 0.03,
				4.arithmeticProgression(1 / 7, 1 / 7) * 0.12,
				-1,
				4,
				0,
				4
			),
			0.4,
			0.4,
			2
		).softClip,
		0.995
	)
) <! recordBuf(a, 0, 1, 0, 1, 0, 1, 0, lfdNoise3(500) + (pinkNoise() * 8))

/* Drone for the Evening ; https://github.com/lukiss/Losers-Union-SC-Research ; https://sonomu.club/@lukiss/111024677229943163 */
let p = (1, 3 .. 64);
let f = (lfdNoise1(8) / 16 + 33).midiCps;
let c = p ^ (p / p.sum).arcTan * f * p;
splay(
	sinOsc(
		c,
		sinOsc(c * 3, 0) * sinOsc((sinOsc(p / c, 0) * 8 + 8) / c, 0).pi
	) * sinOsc(p / c, 0),
	sinOsc(1 / 3, 0) * sinOsc(1 / 32, 0)
) / 3

/* Tw 14 Nov 2022 Ballad ; https://github.com/lukiss/Losers-Union-SC-Research */
let s = [0 1 3 5 7 8 10];
let d = dseq(Infinity, [1, 3 .. 21]);
let f = ddup(
	lfPar(0.05, 0) * d / [3 7 5 1],
	dseq(Infinity, s.degreeToKey([9 .. 42], 12)).midiCps
);
let n = 8;
leakDc(
	grainFm(
		n,
		tDuty(1 / d, 0, 1),
		2 + lfPar(0.3, 0) / d * 2,
		[2 3],
		f,
		f % d / 12,
		lfPar(440, 0) / 2,
		-1, /* Cannot be localBuf, Env.perc.discretize */
		512
	).splay * 0.23,
	0.995
).sum

/* 12 May 2020 ; https://github.com/lukiss/Losers-Union-SC-Research */
let s = [0 2 4 7 9];
let l = { :freq :mul |
	(lfdNoise3(freq) * mul).abs
};
let i = 1 / 16;
let t = impulse(l(1.pi, 1.pi), 0);
combC(
	{
		sinOsc(
			demand(
				t,
				0,
				drand(Infinity, s.degreeToKey([9 .. 42], 1.pi.pi))
			).midiCps,
			0
		) * (t.lag3Ud(0, i) + (t.lag3Ud(i + l(9, i * 4), l(1.pi, 1.pi)) / 1.pi))
	} !^ 5,
	i,
	i,
	1.pi
) / 3

/* 9 Jan 2019 ; https://github.com/lukiss/Losers-Union-SC-Research */
let a = 40;
let f = { :b |
	lfNoise1(1).expRange(10, b)
};
splay(
	leakDc(
		formant(
			[
				({ a := a + 5 } ! 6).midiCps,
				({ f(29).round(7) } ! 6).midiRatio
			].product,
			{ f(1000) } ! 6,
			{ f(500) } ! 6
		),
		0.995
	)
) / 5

/* 3 Nov 2018 ; https://github.com/lukiss/Losers-Union-SC-Research ; requires=kr */
let a = 9;
let f = { :b |
	lfNoise2(b.sign).expRange(9, b)
};
splay(
	leakDc(
		formant(
			[
				({ a := a + 7 } ! 6).midiCps,
				({ f(99).round(12) } ! 6).midiRatio
			].product,
			{ f(2200) } ! 6,
			{ f(300) } ! 6
		) * sinOscFb(
			f(0.05),
			{ f(0.5) } ! 6
		).kr,
		0.995
	)
) / 13

/* Drone 22 Maj 2021 ; https://github.com/lukiss/Losers-Union-SC-Research */
let n = 4;
let s = [0 1 4 5 7 9 10];
let f = s.degreeToKey([7 .. 53], 12).midiCps;
let l = { :mul |
	(lfdNoise3([0.05] # n) * mul).abs
};
let d = {
	{
		demand(
			impulse(1 / [30 .. 53].atRandom, 0),
			0,
			dxrand(Infinity, f)
		)
	} ! n
};
splay(
	hpf(
		combC(
			pmOsc(
				d(),
				d(),
				l(2),
				l(0.5)
			) * (l(0.25) + 1 / 4),
			1 / 4,
			1 / 4 - l(1 / 16),
			7
		),
		110
	) * -12.dbAmp
)

/* 30 Apr. 2020 ; https://github.com/lukiss/Losers-Union-SC-Research */
let t = {
	tDuty(drand(Infinity, [1 .. 8] / 16), 0, 1)
};
let r = { :lo :hi |
	tRand(lo, hi, t())
};
normalizer(
	companderD(
		leakDc(
			lorenzL(
				22050,
				r(19, 11),
				r(1, 18),
				r(0.1, 5),
				r(0.01, [0.06] # 2),
				0.1,
				0,
				0
			),
			0.995
		),
		0.8,
		r(0.01, 0.5),
		r(0.01, 0.5),
		0.01,
		0.075
	),
	-2.dbAmp,
	0.02
).fold(-0.8, 0.8)

/* 22 Nov. 2021 ; https://github.com/lukiss/Losers-Union-SC-Research */
let k = 1 / 100000;
let n = {
	1 + ((k * [1 .. 7])).scramble
};
splay(
	varSaw(
		33 * n(),
		0,
		lfSaw(1 / 3 * n(), 0) * lfSaw(n() / 3, 0)
	) * (lfSaw(5 / 3, 0) * (lfSaw(7 / 3 * n().-, 0).tan)).abs
).tanh

/* 12 Juli 2019 ; https://github.com/lukiss/Losers-Union-SC-Research ; rd edit */
let f = { :freq :mul |
	let z = lfdNoise3(freq) * mul;
	z.ring1(z % 0.01).hypotenuse(z)
};
let o = formant(
	f(f(3, 13), 220),
	f(f(2, 10), f(f(3, 13), 2320)),
	f(f(3, 5), 2500)
);
let a = f(f(2, 12), 1).excess(
	f(f(1, 14), f(4.4, 0.5) + 0.3)
);
(o * a).eqPan2(0).softClip

/* 12 Juli 2019 ; https://github.com/lukiss/Losers-Union-SC-Research ; rd edit */
let k = 8;
let f = { :freq :mul |
	let z = lfdNoise3(freq) * mul;
	z.ring1(z % 0.01).hypotenuse(z)
};
let o = formant(
	f(f(3, 13), 220),
	f(f(2, 10), f(f(3, 13), 2320)),
	f(f(3, 5), 2500)
);
let a = {
	f(f(2 / k, 12), 1).excess(
		f(f(1, 14), f(4.4, 0.5) + 0.3)
	)
} ! k;
(o * a).splay.softClip / k.sqrt

/* 5 Sep. 2020 ; https://github.com/lukiss/Losers-Union-SC-Research ; requires=kr */
let l = {
	lfdNoise3(1).abs.kr
};
let r = { :freq :mul |
	(gendy3(6, 6, l(), l(), freq, l(), l(), 5, l() * 5) * mul).abs.kr
};
-12.dbAmp * splay(
	[1 .. 6].collect { :n |
		combC(
			leakDc(
				fm7Matrix(
					{
						[
							rand(0, 80).midiCps,
							0,
							blip(r(l(), 24), r(l(), 228)).abs.kr
						]
					} ! 6,
					[6 6].constantArray(
						r(0.02, 0.5)
					)
				)[n],
				0.995
			),
			0.5,
			0.05 + r(0.04, l()),
			1
		)
	}
)

/* Ambient Ligeti inspired soundscape ; https://github.com/lukiss/Losers-Union-SC-Research */
let r = { :n |
	{ lfdNoise3(1 / 86).abs } ! n
};
splay(
	leakDc(
		freeVerb(
			warp1(
				1,
				sfAcquireMono('Floating'),
				r(9),
				[-36 -9 -14 0 -19 -5 3 -2 -24 -7].midiRatio,
				8 * r(9) + 8 / 86,
				-1,
				12,
				1 / 4 * r(9),
				4
			) * r(9),
			r(9),
			0.5 + r(9),
			r(9)
		),
		0.995
	),
	2 / 4
).tanh * line(0, 1, 12)

/* 27 Jan 2023 ; https://github.com/lukiss/Losers-Union-SC-Research */
let d = dust(1);
let m = {
	tRand(0.5, 2.5, d).lag3(1 / 16)
};
let c = [0 .. 9].collect { :n |
	m() ^ n
};
let n = c / c.sum;
let e = tChoose(
	dust(1 + m()),
	[
		c.sum,
		n,
		c.round(32),
		n.atan2(m()),
		c.sin,
		c.tan,
		n.hypotenuse(c)
	]
);
let a = ((lfSaw(c.tan / m(), 0).abs ^ e.max(0)).log10.sin.abs ^ 10).tanh;
splay(
	sinOsc(c.log10 * c, 0) * a,
	sinOsc(m() * m(), 0) * 0.5
) / 23

/* 27 Oktober 2022 ; https://github.com/lukiss/Losers-Union-SC-Research */
let a = [41 73 123 196];
let f = sinOsc(440, 0);
[0 .. 8].do { :i |
	a := a * 5.midiRatio;
	f := sinOsc(f * a.rotate(i + 3), 0) * sinOsc(f, 0).tanh
};
splay(
	leakDc(f.tanh, 0.995),
	sinOsc(f.sum.abs, 0)
)

/* 23 Mars ; https://github.com/lukiss/Losers-Union-SC-Research */
let d = { :n |
	{
		gendy3(1, 1, 1, 1, lfNoise1(2) + 1, 0.5, 0.5, 12, 12).abs.round(1 / 16).kr
	} ! n
};
let t = dust(d(5) / 2).kr;
splay(
	freeVerb(
		leakDc(
			ifft(
				pvBinScramble(
					fft(
						{ localBuf(1, 4096) } ! 2,
						standardL(d(2) * 5000, 1, 0.5, 0),
						0.5,
						0,
						1,
						0
					),
					d(1),
					d(1),
					t
				),
				0,
				0
			) * t.lag3Ud(0.01, d(5)),
			0.995
		),
		d(1) / 3,
		d(1),
		d(1) / 2
	),
	0.5
)

/* 20 jan. 2023 ; https://github.com/lukiss/Losers-Union-SC-Research */
let l = { :lo :hi |
	tChoose(
		dust([3] # 2),
		cuspN(1.1 ^ [0 .. 5], 1, 1.9, 0).tanh
	).expRange(lo, hi)
};
let a = { l(0.001, 1) } ! 6;
let f = l(12, 999);
let e = Env(a, a / a.sum / f, a.- * 9, nil, nil, 0).circle(0, 'lin').asEnvGen(1);
let g = perc(e > 0.1, 0.005, 0.9 / f, -4);
let p = (1 - g).linLin(0, 1, -1, 1);
(xFade2(e, (e * f).sin, p, 1) + g).tanh.splay

/* Tennis ; https://github.com/lukiss/Losers-Union-SC-Research ; requires=NonLocalBuffer */
let nf = 48000; /* sample rate */
let b = 1000; /* bufAlloc(1, nf).bufClear */
let n = leakDc(
	standardL(22050, lfNoise1(1).linLin(-1, 1, 0.72, 1.40), 0.5, 0),
	0.995
);
let z = sweep(0, 1 - n.expRange(0.01, 1)) % 1 * nf;
let t = (n.lag3(0.1) > 0);
let w = recordBuf(b, z, t, 1 - t, t, 1, t, 0, n);
let p = playBuf(
	1,
	b,
	(1 - n.round(1 / 16)) / tRand(1, z / 100, t).lag3(0.001),
	t,
	z,
	1,
	0
) <! w;
eqPan2(
	leakDc(
		moogFf(
			p,
			p.expRange(0.01, 1) * 11025,
			2,
			0
		),
		0.995
	).softClip,
	tRand(-1, 1, t)
)

/* Cheap Singing Synth ; simpler (rd) ; https://github.com/lukiss/Losers-Union-SC-Research */
let tab = [
	600 1040 2250 2450 2750;
	60 70 110 120 130;
	0 -7 -9 -9 -20
	:;
	400 1620 2400 2800 3100;
	40 80 100 120 120;
	0 -12 -9 -12 -18
	:;
	250 1750 2600 3050 3340;
	60 90 100 120 120;
	0 -30 -16 -22 -28
	:;
	400 750 2400 2600 2900;
	40 80 100 120 120;
	0 -11 -21 -20 -40
	:;
	350 600 2400 2675 2950;
	40 80 100 120 120;
	0 -20 -32 -28 -36
];
let x = lorenzL(24, 10, 28, 2.667, 0.05, 0.1, 0, 0).sin.linLin(-1, 1, 1, 4) / diwhite(Infinity, 2, 10);
let dur = duty(x, 0, x);
let trg = tDuty(dur, 0, 1);
let scl = [0 2 4 5 7 9 11];
let mel = scl.degreeToKey([26 .. 42], 12);
let mnn = demand(
	trg,
	0,
	dseq(Infinity, mel.scramble)
);
let env = adsr(
	trig(trg, dur * lfNoise2(4).linLin(-1, 1, 0.5, 1)),
	dur / 48,
	1 / 4,
	1,
	dur / 2,
	-4
);
let voc = selectXFocus(
	mnn.linLin(mel.first, mel.last, 0, tab.size),
	tab,
	0.9,
	true
);
let atk = pinkNoise() * (1 - env);
let sus = lfNoise2(voc.second) * ((env - voc.third.dbAmp) / 2) + voc.first;
splay(
	bpf(
		syncSaw(
			lfNoise2(voc.second) * mnn / (voc.first) + mnn.midiCps,
			atk + sus
		),
		env - (perc(trg, 0, 1 / (2 ^ [0 .. 5]) / 8, -4) * 0.5) * voc.first + 30,
		voc.second / voc.first
	).softClip * voc.third.dbAmp * env
)
