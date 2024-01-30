{- Alien froggies (Jmcc) #1 ; left-to-right -}
{ :tr |
	let TrRand = { :tr :lo :hi | TRand(lo, hi, tr) };
	let TrExpRand = { :tr :lo :hi | TExpRand(lo, hi, tr) };
	let r = tr.TrRand(-0.2, [0.1, 0.2]).Exp.Mul(11).Fold(1, 30);
	r.Formant(
		tr.TrExpRand([200, 300], 3000),
		tr.TrRand([0, 1], 9).MulAdd(r, r)
	).Mul(0.05)
}.OverlapTexture(0.5, 0.25, 5).Mix

{- Alien meadow (Jmcc) #6 ; left-to-right -}
{ :tr |
	let trRand = { :lo :hi | TRand(lo, hi, tr) };
	let z = trRand(0, 5000);
	let f = SinOsc(trRand(0, 20), 0).MulAdd(0.1 * z, z);
	let a = SinOsc(trRand(0, 20), 0).MulAdd(0.05, 0.05);
	SinOsc(f, 0).Pan2(trRand(-1, 1), a)
}.OverlapTexture(6, 2, 6).Mix

{- Analog bubbles (Jmcc) ; method notation -}
0.4
	.LfSaw(0)
	.MulAdd(24, [8, 7.23]
		.LfSaw(0)
		.MulAdd(3, 80)
	)
	.MidiCps
	.SinOsc(0)
	.Mul(0.04)
	.CombN(0.2, 0.2, 4)
	.Mul(0.1)

{- Analog bubbles (Jmcc) ; as above ; one line -}
0.4.LfSaw(0).Mul(24).Add([8, 7.23].LfSaw(0).MulAdd(3, 80)).MidiCps.SinOsc(0).Mul(0.04).CombN(0.2, 0.2, 4).Mul(0.1)

{- Analog bubbles (Jmcc) ; alternate linearisation -}
[8, 7.23].LfSaw(0)
	.MulAdd(3, 80)
	.Add(0.4
		 .LfSaw(0)
		 .Mul(24)
	)
	.MidiCps
	.SinOsc(0)
	.Mul(0.05)
	.CombN(0.2, 0.2, 4)
	.Mul(0.1)

{- Analog bubbles (Jmcc) ; as above ; one line -}
[8, 7.23].LfSaw(0).MulAdd(3, 80).Add(0.4.LfSaw(0).Mul(24)).MidiCps.SinOsc(0).Mul(0.05).CombN(0.2, 0.2, 4).Mul(0.1)

{- Analog bubbles (Jmcc) #1 ; variable bindings -}
let o = LfSaw([8, 7.23], 0) * 3 + 80;
let m = LfSaw(0.4, 0) * 24 + o;
CombN(SinOsc(m.MidiCps, 0) * 0.04, 0.2, 0.2, 4) * 0.1

{- Analog bubbles (Jmcc) #1 ; applicative order -}
Mul(
	CombN(
		MulAdd(
			SinOsc(
				MulAdd(
					LfSaw(0.4, 0),
					24,
					MulAdd(
						LfSaw([8, 7.23], 0),
						3,
						80
					)
				).MidiCps,
				0),
			0.05,
			0),
		0.2,
		0.2,
		4
	),
	0.1
)

{- Analog bubbles (Jmcc) ; as above ; one line -}
Mul(CombN(Mul(SinOsc(MidiCps(MulAdd(LfSaw(0.4, 0), 24, MulAdd(LfSaw([8, 7.23], 0), 3, 80))), 0), 0.05), 0.2, 0.2, 4), 0.1)

{- Berlin 1977 (Jmcc) #4 ; event control -}
Voicer(1, 16) { :e |
	let freq = (e.x * 24 + 48).MidiCps;
	let env = Decay2(Trig(e.w, 0.001), 0.05 * e.y, 2 * e.y);
	let amp = env * e.z + 0.02;
	let filt = env * (FSinOsc(0.17, 0) * 800) + 1400;
	let pw = SinOsc(0.08, [0, 0.5 * pi]) * 0.45 + 0.5;
	let s = Pulse(freq, pw) * amp;
	CombC(Rlpf(s, filt, 0.15), 0.2, [0.2, 0.17], 1.5) * LagUd(e.w, 0, 2 + e.y)
}.Mix

{- Berlin 1977 (Jmcc) #4 ; let syntax -}
let sequ = { :s :tr | Demand(tr, 0, Dseq(inf, s)) };
let sequR = { :s :tr | Demand(tr, 0, Dshuf(inf, s)) };
let clockRate = MouseX(5, 20, 1, 0.2);
let clockTime = 1 / clockRate;
let clock = Impulse(clockRate, 0);
let patternList = [55, 60, 63, 62, 60, 67, 63, 58];
let note = sequ(patternList, clock);
let clock16 = PulseDivider(clock, 16, 0);
let noteTrs = sequR([-12, -7, -5, 0, 2, 5], clock16) + note;
let freq = noteTrs.MidiCps;
let env = Decay2(clock, 0.05 * clockTime, 2 * clockTime);
let amp = env * 0.1 + 0.02;
let filt = env * FSinOsc(0.17, 0) * 800 + 1400;
let pw = SinOsc(0.08, [0, 0.5 * pi]) * 0.45 + 0.5;
let s = Pulse(freq, pw) * amp;
CombC(Rlpf(s, filt, 0.15), 0.2, [0.2, 0.17], 1.5)

{- Bowed string (Jmcc) ; voicer -}
Voicer(1, 16) { :e |
	let f = (e.x * 24 + 48).MidiCps;
	let k = DynRingzBank(
		BrownNoise() * e.z * LagUd(e.w, e.y * 0.1, e.y * 4),
		12.arithmeticSeries(f, f),
		12.geometricSeries(1, Rand(0.7, 0.9)),
		{ Rand(1, 3) } ! 12
	);
	(k * 0.1).SoftClip.EqPan2(e.i * 2 - 1)
}.Mix * 0.1

{- Bowed string (Jmcc) ; Rand -}
let root = 5;
let scale = [0 2 4 5 7 9 11] + root;
let oct = [24 36 48 60 72 84];
let f = (scale.atRandom + oct.atRandom).MidiCps;
let x = BrownNoise(2) * 0.007 * (LfNoise1(ExpRand(0.125, 0.5)) * 0.6 + 0.4).Max(0);
let k = RingzBank(x, 12.arithmeticSeries(f, f), 12.geometricSeries(1, Rand(0.7, 0.9)), { Rand(1, 3) } ! 12);
(k * 0.1).SoftClip

{- Bowed string (Jmcc) ; .randomFloat -}
let root = 5;
let scale = [0 2 4 5 7 9 11] + root;
let oct = [24 36 48 60 72 84];
let f = (scale.atRandom + oct.atRandom).MidiCps;
let x = BrownNoise(2) * 0.007 * (LfNoise1(ExpRand(0.125, 0.5)) * 0.6 + 0.4).Max(0);
let k = RingzBank(
	x,
	12.arithmeticSeries(f, f),
	12.geometricSeries(1, 0.7.randomFloat(0.9)),
	{ 1.randomFloat(3) } ! 12
);
(k * 0.1).SoftClip

{- Bowed string (Jmcc) ; klank -}
let root = 5;
let scale = [0 2 4 5 7 9 11] + root;
let oct = [24 36 48 60 72 84];
let f = (scale.atRandom + oct.atRandom).MidiCps;
let x = BrownNoise(2) * 0.007 * (LfNoise1(ExpRand(0.125, 0.5)) * 0.6 + 0.4).Max(0);
let d = [
	12.arithmeticSeries(f, f),
	12.geometricSeries(1, Rand(0.7, 0.9)),
	{ Rand(1, 3) } ! 12
].transposed.concatenation;
let k = Klank(x, 1, 0, 1, d);
(k * 0.1).SoftClip

{- Coolant (Jmcc) -}
{ RingzBank(OnePole(BrownNoise() * 0.002, 0.95), { Rand(40, 2040) } ! 10, [0.1], [1]) } ! 2

{- Coolant (Jmcc) ; default values -}
{ RingzBank(OnePole(BrownNoise() * 0.002, 0.95), { Rand(40, 2040) } ! 10, nil, nil) } ! 2 * 0.1

{- Coolant (Jmcc) ; Rand->rand -}
{ RingzBank(OnePole(BrownNoise() * 0.002, 0.95), { 40 + 2000.randomFloat } ! 10, [0.1], [1]) } ! 2

{- Coolant (Jmcc) ; Ringz -}
let o = OnePole(BrownNoise() * 0.01, 0.95);
{ Ringz(o, Rand(40, 2040), 1) * 0.1 } !^ 10

{- Deep trip (Jmcc) #9 ; texture=overlap,12,4,4,inf -}
let f = (LfNoise1(Rand(0, 0.3)) * 60 + 70).MidiCps;
let a = LfNoise2(f * Rand(0, 0.5)) * (LfNoise1(Rand(0, 8)) * SinOsc(Rand(0, 40), 0) * 0.1).Max(0);
let s = Pan2(SinOsc(f, 0) * a, LfNoise1(Rand(0, 5)), 1);
{ CombN(s, 0.5, { Rand(0, 0.2) + 0.3 } ! 2, 20) } !> 2 + s

{- Deep trip (Jmcc) #9 ; graph rewrite ; left-to-right -}
{ :tr |
	let trRand = { :lo :hi | TRand(lo, hi, tr) };
	let f = LfNoise1(trRand(0, 0.3)).MulAdd(60, 70).MidiCps;
	let a = LfNoise2(f.Mul(trRand(0, 0.5))).Mul((LfNoise1(trRand(0, 8)).Mul(SinOsc(trRand(0, 40), 0)).Mul(0.1)).Max(0));
	let s = SinOsc(f, 0).Mul(a).Pan2(LfNoise1(trRand(0, 5)), 1);
	{ s.CombN(0.5, { trRand(0, 0.2) + 0.3 } ! 2, 20) } !+ 2 + s
}.OverlapTexture(12, 4, 4).Mix

{- Hard sync sawtooth with lfo (Jmcc) #6 ; graph-rewrite ; left-to-right -}
let txt = { :tr |
	let f = TRand(0, 50, tr).MulAdd(1, 30).MidiCps;
	SyncSaw(
		[f, f + 0.2],
		SinOsc(0.2, { TRand(0, pi, tr).Mul(2) } ! 2).Mul(2).MulAdd(f, f * 3)
	).Mul(0.05)
}.OverlapTexture(4, 4, 4).Mix;
txt.CombN(0.3, 0.3, 4) + txt.reversed

{- Harmonic swimming (Jmcc) #1 -}
let l = Line(0, -0.02, 60);
1:20.collect { :h |
	let n = LfNoise1({ Rand(-4, 4) } ! 2 + 6) * 0.02 + l;
	SinOsc(50 * (h + 1), 0) * n.Max(0)
}.Sum

{- Harmonic tumbling (Jmcc) #1 -}
let t = XLine([10, 11], 0.1, 60);
0:10.collect { :h |
	let e = Decay2(Dust(t) * 0.02, 0.005, Rand(0, 0.5));
	SinOsc(80 * (h + 1), 0) * e
}.Mix

{- Hell is busy (Jmcc) #1 ; graph rewrite ; left-to-right -}
{ :tr |
	let trRand = { :lo :hi | TRand(lo, hi, tr) };
	let e = LfPulse(trRand(1, 11), 0, trRand(0, 0.7)) * 0.04;
	SinOsc(trRand(400, 2400), 0).Pan2(trRand(-1, 1), e)
}.OverlapTexture(4, 4, 8).Mix

{- Lfo modulation (Jmcc) #1 -}
let o = SinOsc(0.05, 0) * 80 + 160;
let p = SinOsc([0.6, 0.7], 0) * 3600 + 4000;
let s = Rlpf(LfPulse(o, 0, 0.4) * 0.05, p, 0.2);
CombL(s, 0.3, [0.2, 0.25], 2)

{- Moto rev (Jmcc) #1 -}
let f = SinOsc(0.2, 0) * 10 + 21;
let s = LfPulse(f, [0, 0.1], 0.1);
Rlpf(s, 100, 0.1).Clip2(0.4)

{- Police state (Jmcc) #2 -}
let e = LfNoise2(LfNoise2([0.4, 0.4]) * 90 + 620) * (LfNoise2([0.3, 0.3]) * 0.15 + 0.18);
CombL(
	{
		let f = SinOsc(Rand(0.02, 0.12), Rand(0, 2.pi)) * Rand(600, 1600) + Rand(-300, 300);
		Pan2(SinOsc(f, 0) * LfNoise2(100 + Rand(-20, 20)) * 0.1, Rand(-1, 1), 1)
	} !> 4 + e,
	0.3,
	0.3,
	3
) * 0.5

{- Pond life (Jmcc) #1 ; texture=overlap,8,8,4,inf ; requires=kr -}
let f = SinOsc(Rand(20, 50), 0) * Rand(100, 400) + LinRand(500, 2500, 0);
let o = SinOsc(f.kr, 0) * LfPulse(3 / Rand(1, 9), 0, Rand(0.2, 0.5)).kr * 0.04;
EqPan(o, Rand(-1, 1))

{- Pulsing bottles (Jmcc) #2 -}
let n = 6;
{
	let a = LfPulse(4 + Rand(0, 10), 0, Rand(0, 0.7)) * 0.8 / n;
	let l = SinOsc(0.1 + Rand(0, 0.4), Rand(0, 2 * pi));
	Pan2(Resonz(WhiteNoise(), 400 + LinRand(0, 7000, 0), 0.01), l, 1) * a
} !> n

{- Scratchy (Jmcc) #1 -}
let n = BrownNoise(2) * 0.5 - 0.49;
let f = n.Max(0) * 20;
Rhpf(f, 5000, 1)

{- Sprinkler (Jmcc) #1 -}
Bpz2(WhiteNoise() * LfPulse(LfPulse(0.09, 0, 0.16) * 10 + 7, 0, 0.25) * 0.1)

{- Theremin (Jmcc) ; event control -}
Voicer(1, 16) { :e |
	let freq = Lag(LinExp(e.y, 0, 1, 4000, 200), 0.8);
	let a = SinOsc(freq + (freq * SinOsc(4 + 3 * e.j, 0) * 0.02), 0) * e.x * 0.6 * Lag(e.w, 0.2);
	Pan2(a, e.i * 0.25, 0.5 + e.z)
}.Mix * 0.5

{- Tremulate (Jmcc) ; event control ; requires=voicer -}
let s = Voicer(1, 16) { :e |
	let s = SinOsc(e.x * 400 + 500 * [1 1.2 1.5 1.8], 0); {- just minor seventh chord, 1/1 5/4 3/2 9/5 -}
	let a = LfNoise2({ Rand(30, 90) } ! 4 * (0.75 + e.j)).Max(0) * e.z;
	Pan2(s, { Rand(-1, 1) } ! 4 + (e.i * 2 - 1), a * LagUd(e.w, 0, e.k * 2)).Sum
}.Mix * 0.5;
CombN(s, 0.1, 0.1, 1)

{- Uplink (Jmcc) #2 ; texture=overlap,4,1,5,inf -}
let osc = {
	let e = LfPulse(Rand(0, 4), 0, Rand(0, 1)) * Rand(0, 8000) + Rand(0, 2000);
	LfPulse(Rand(0, 20), 0, Rand(0, 1)) * e
};
Pan2(LfPulse(osc() + osc(), 0, 0.5) * 0.04, Rand(0, 0.8), 1)

{- What was I thinking? ; Jmcc -}
let z = Rlpf(
	Pulse(
		MulAdd(SinOsc(4, 0), 1, 80).Max(
			Decay(LfPulse(0.1, 0, 0.05) * Impulse(8, 0) * 500, 2)
		),
		MulAdd(LfNoise1(0.157), 0.4, 0.5)
	) * 0.04,
	MulAdd(LfNoise1(0.2), 2000, 2400),
	0.2
);
let y = z * 0.6;
z + [
	CombL(y, 0.06, MulAdd(LfNoise1(0.3.Rand0), 0.025, 0.035), 1) +
	CombL(y, 0.06, MulAdd(LfNoise1(0.3.Rand0), 0.025, 0.035), 1)
	,
	CombL(y, 0.06, MulAdd(LfNoise1(0.3.Rand0), 0.025, 0.035), 1) +
	CombL(y, 0.06, MulAdd(LfNoise1(0.3.Rand0), 0.025, 0.035), 1)
]

{- What was i thinking? (Jmcc) #2 -}
let i = LfPulse(0.1, 0, 0.05) * Impulse(8, 0) * 500;
let f = (SinOsc(4, 0) + 80).Max(Decay(i, 2));
let p = Pulse(f, LfNoise1(0.157) * 0.4 + 0.5) * 0.04;
let z = Rlpf(p, LfNoise1(0.2) * 2000 + 2400, 0.2) * 0.25;
let y = z * 0.6;
{
	[y, y].collect { :i |
		CombL(i, 0.06, LfNoise1(0.3.Rand0) * 0.025 + 0.035, 1)
	}.Sum
} ! 2 + z

{- Wind metals (Jmcc) ; texture=overlap,5,2,12,inf -}
let n = 6;
let exc = BrownNoise(2) * 0.007 * (LfNoise1(ExpRand(0.125, 0.5)) * 0.75 + 0.25).Max(0);
let f = { Rand(0, Rand(500, 8000)) + ExpRand(60, 4000) } ! n;
let dt = { Rand(0.1, 2) } ! n;
let s = RingzBank(exc, f, nil, dt) * 0.1;
s.SoftClip

{- Zizle (Jmcc) #SC3d1.5 ; texture=overlap,4,4,12,inf -}
let a = { :f | (SinOsc(f * [Rand(0.7, 1.3), 1], { Rand(0, 2 * pi) } ! 2) * 0.1).Sum };
let o = SinOsc(Rand(24, 108).MidiCps, Rand(0, 2 * pi));
let s = o * a(ExpRand(0.3, 8)).Max(0) * a(ExpRand(6, 24)).Abs;
EqPan(s, Rand(-1, 1))

{- Analog bubbles (Jmcc) #1 ; requires=keywords -}
let o = LfSaw(
	freq: [8 7.23],
	iphase: 0
) * 3 + 80;
let m = LfSaw(
	freq: 0.4,
	iphase: 0
) * 24 + o; {- glissando function -}
let s = SinOsc(
	freq: m.MidiCps,
	phase: 0
) * 0.04;
CombN(
	in: s,
	maxDelayTime: 0.2,
	delayTime: 0.2,
	decayTime: 4
) * 0.1 {- echoing sine wave -}

{- Analog bubbles (Jmcc) #1 ; left-to-right -}
0.4.LfSaw(0).Mul(24).Add([8, 7.23].LfSaw(0).MulAdd(3, 80)).MidiCps.SinOsc(0).Mul(0.04).CombN(0.2, 0.2, 4)

{- Analog bubbles (Jmcc) #1 ; left-to-right -}
let o = LfSaw([8, 7.23], 0).MulAdd(3, 80);
let m = LfSaw(0.4, 0).MulAdd(24, o);
SinOsc(m.MidiCps, 0).Mul(0.04).CombN(0.2, 0.2, 4)

{- Babbling brook (Jmcc) #SC3 ; left-to-right -}
let b = { :f :m :a :g |
	BrownNoise()
		.OnePole(0.99)
		.Rhpf(BrownNoise()
			.Lpf(f)
			.MulAdd(m, a), 0.03)
		.Mul(g)
};
[
	{ b(14, 400, 500, 0.06) } ! 2,
	{ b(20, 800, 1000, 0.10) } ! 2
].Sum

{- Coolant (Jmcc) ; requires=filterMethods -}
{ BrownNoise().Mul(0.002).OnePole(0.95).RingzBank({ 40 + 2000.Rand0 } ! 10, [0.1], [1]) } ! 2

{- Modal space (Jmcc) #8 ; left-to-right -}
let b = [0 2 3.2 5 7 9 10].asLocalBuf;
let k = DegreeToKey(b, MouseX(0, 15, 0, 0.1), 12);
let c = { :n :r |
	let o = SinOsc((k + r + (n * 0.04)).MidiCps, 0).Mul(0.1);
	let t = LfPulse([48, 55].MidiCps, 0, 0.15);
	let f = SinOsc(0.1, 0).MulAdd(10, r).MidiCps;
	let d = t.Rlpf(f, 0.1).Mul(0.1);
	let m = o + d;
	m.CombN(0.31, 0.31, 2) + m
};
let n = LfNoise1([3, 3]);
c(n, 48) + c(n, 72) * 0.25

{- Ostinoodles ; Jmcc ; requires=keywords -}
let z = { :tr |
	let sequ = { :list :trig |
		Demand(
			trig: trig,
			reset: 0,
			demandUgens: Dseq(
				repeats: inf,
				list: list
			)
		)
	};
	let root = 81 + TRand(
		lo: -6,
		hi: 6,
		trig: tr
	);
	let major = [0, 2, 4, 5, 7, 9, 11].asLocalBuf;
	let offset = TRand(
		lo: -16,
		hi: 16,
		trig: tr
	);
	let sequence = DegreeToKey(
		bufNum: major,
		in: TScramble(
			trigger: tr,
			inputs: [0, 1, 2, 3] + offset
		),
		octave: 12
	) + root;
	let f = TxLine(
		start: TExpRand(
			lo: 4,
			hi: 24,
			trig: tr
		),
		end: TExpRand(
			lo: 4,
			hi: 24,
			trig: tr
		),
		dur: 12,
		trig: tr
	);
	let trig = Impulse(
		freq: f,
		phase: 0
	);
	let freq = sequ(
		sequence.MidiCps,
		trig
	);
	let sig = LfTri(
		freq: freq.kr,
		iphase: 0
	) * Decay2(
		in: trig,
		attackTime: 0.004,
		decayTime: 0.3
	).kr * 0.1;
	Pan2(
		in: sig,
		pos: TRand(
			lo: -1,
			hi: 1,
			trig: tr
		),
		level: 1
	)
}.OverlapTexture(6, 3, 6).Mix;
6.timesRepeat {
	z := AllpassN(
		in: z,
		maxDelayTime: 0.04,
		delayTime: {
			Rand(
				lo: 0,
				hi: 0.04
			)
		} ! 2,
		decayTime: 16)
};
z

{- Scratchy ; Jmcc ; left-to-right -}
BrownNoise(2).MulAdd(0.5, -0.49).Max(0).Mul(20).Rhpf(5000, 1)

{- Slow beating sines (Jmcc) #7 ; texture=xfade,4,4,inf -}
let n = 20;
let d = 5;
let p = [];
let q = [];
n.timesRepeat {
	let freq = Rand(24, 84).MidiCps;
	p.add(freq);
	{ p.add(freq + d.Rand2) } ! 2;
	{ q.add(freq + d.Rand2) } ! 3
};
[p, q].collect { :freq |
	SinOscBank(freq, [1], { Rand(0, 2 * pi) } ! (3 * n))
} * 0.1 / n

{- Police state ; Jmcc ; requires=keywords -}
let n = 4; {- number of sirens -}
let node = {
	Pan2(
		in: SinOsc(
			freq: SinOsc(
				freq: 0.1.Rand0 + 0.02,
				phase: 2 * pi.Rand0
			) * 600.Rand0 + 1000 + 300.Rand2,
			phase: 0
		),
		pos: 1.Rand2,
		level: LfNoise2(freq: 100 + 20.Rand2) * 0.1
	)
};
let e = LfNoise2(
	freq: LfNoise2(
		freq: [0.4, 0.4]
	) * 90 + 620
) * (
	LfNoise2(
		freq: [0.3, 0.3]
	) * 0.15 + 0.18
);
CombL(
	in: node:/0 !+ 4 + e,
	maxDelayTime: 0.3,
	delayTime: 0.3,
	decayTime: 3
) * 0.5

{- Sample and hold liquidities (Jmcc) #4 ; requires=keywords -}
let r = MouseX(
	minVal: 1,
	maxVal: 200,
	warp: 1,
	lag: 0.1
);
let t = r.Recip;
let c = Impulse(
	freq: r,
	phase: 0
) * 0.4;
let cf = MouseY(
	minVal: 100,
	maxVal: 8000,
	warp: 1,
	lag: 0.1
);
let f = Latch(
	in: WhiteNoise() * cf * 0.5 + cf,
	trig: c
);
let p = Latch(
	in: WhiteNoise(),
	trig: c
);
let i = EqPan2(
	in: SinOsc(
		freq: f,
		phase: 0
	),
	pos: p
) * Decay2(
	in: c,
	attackTime: 0.1 * t,
	decayTime: 0.9 * t
);
CombN(
	in: i,
	maxDelayTime: 0.3,
	delayTime: 0.3,
	decayTime: 2
)

{- Why supercollider? (Jmcc) #0 ; requires=keywords -}
let s = {
	Resonz(
		in: Dust(
			density: 0.2
		) * 50,
		freq: Rand(
			lo: 200,
			hi: 3200
		),
		bwr: 0.003
	)
} !+ 10;
let z = DelayN(
	in: s,
	maxDelayTime: 0.048,
	delayTime: 0.048
);
let x = {
	CombL(
		in: z,
		maxDelayTime: 0.1,
		delayTime: LfNoise1(
			freq: Rand(
				lo: 0,
				hi: 0.1
			)
		) * 0.04 + 0.05,
		decayTime: 15
	)
} !+ 7;
4.timesRepeat {
	x := AllpassN(
		in: x,
		maxDelayTime: 0.050,
		delayTime: {
			Rand(
				lo: 0,
				hi: 0.05
			)
		} ! 2,
		decayTime: 1
	)
};
s + (x * 0.2)

{- Tarmac ; Jmcc ; edit (Rd) -}
let z = { :tr |
	EqPan2(
		RingzBank(
			PinkNoise() * 0.0008,
			{ LinRand(700, 6000, 0) } ! 4,
			nil,
			{ LinRand(0.2, 12, 0) } ! 4
		),
		LfNoise1(1.Rand0)
	) * LfNoise1(LfNoise1(1).MulAdd(3, 4)).MulAdd(0.4, 0.6)
}.OverlapTexture(8, 3, 4).Sum;
6.timesRepeat {
	z := AllpassN(z, 0.040, [0.04.Rand0, 0.04.Rand0], 16)
};
z

{- Repeating harmonic klank (Jmcc) -}
{ :tr |
	let p = 8;
	let s = Decay(Dust(0.8) * 0.01, 3.4) * LfSaw(TRand(0, 40, tr), 0); {- linrand -}
	let f = Choose(tr, [400, 500, 600, 700, 800, 900, 1000, 1200, 1400, 1500, 1600]);
	{
		RingzBank(
			s,
			{ f * TRand(1, 13, tr) } ! p,
			[1],
			{ TRand(0.4, 3.4, tr) } ! p
		)
	} ! 2
}.OverlapTexture(8, 2, 4).Mix

{- Strummable metals ; use mouse to strum strings ; Jmcc -}
let mouseX = MouseX(0, 1, 0, 0.2);
let strings = 1:8.collect { :i |
	let trigger = Hpz1(mouseX > (0.25 + (i * 0.07))).Abs;
	let pluck = PinkNoise() * Decay(trigger, 0.05).kr * 0.04;
	let n = 15;
	EqPan2(
		RingzBank(
			pluck,
			{ 300 * i + LinRand(0, 8000, 0) } ! n,
			nil,
			{ Rand(1, 4) } ! n
		),
		i * 0.2 - 0.5
	)
}.Sum;
LeakDc(
	Lpf(strings, 12000),
	0.995
)
