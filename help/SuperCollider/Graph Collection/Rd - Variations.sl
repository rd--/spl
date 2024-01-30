{- 20060909 ; rd -}
let p = {
	let x = MouseX(0.001, 0.02, 1, 0.1);
	let y = MouseY(120, 400, 1, 0.1);
	let f = LfNoise0(4) * [32, 64];
	let w = LfNoise0(32) * x;
	let z = LfNoise0(2) * 0.1;
	let m = LfNoise0(6);
	let s = Pulse(f, w);
	Resonz(s, y + z, (m * 0.4) + 0.8) * 0.5
};
let q = {
	let n = LfNoise0(128);
	CombN(p(), 0.2, (n * 0.1) + 0.1, 3)
};
let r = {
	let x = MouseX(0.75, 1.25, 1, 0.1);
	let y = MouseY(0.25, 1, 1, 0.1);
	{
		{
			let fr = Rand(50, 59) * x;
			let am = Rand(0.04, 0.16) * y;
			SinOsc(fr, 0) * am
		} !+ 16
	} ! 2
};
p() + q() + r()

{- 20060911 ; rd -}
let t = Impulse(22, 0) * (SinOsc(0.5, 0) + 1);
let x = MouseX(0.005, 0.12, 1, 0.1);
let y = MouseY(0.01, 0.52, 1, 0.1);
let z = {
	let n1 = LfNoise0(2);
	let n2 = CoinGate(0.05 + n1 + (y * 0.4) + (t * 0.5), t * 0.5);
	let n3 = TExpRand([500, 900], 1600, t);
	Ringz(n2, n3, x)
} !> 3;
z.Clip2(TRand(0, 1, Dust(8))) * 0.25

{- 20060914 ; rd ; graph rewrite ; requires=Sine ; requires=arrayedEnv -}
{ :tr |
	let chrd = { :m |
		let ds = 3;
		let du = [5, 4, 5, 7, 4, 5];
		let d = du * ds;
		let freq = TxLine(m, m + TRand(0.05, 0.5, tr), d, tr).MidiCps;
		let env = Sine(tr, du.max * ds) * TRand(0.005, 0.01, tr);
		let pos = TxLine(TRand(-1, 1, tr), TRand(-1, 1, tr), d, tr);
		let osc = SinOsc(freq, 0);
		EqPan2(osc, pos).Sum * env
	};
	let scale = [0, 2, 4, 5, 7, 9, 11];
	let octaves = [4, 5, 6, 7];
	let mnn = scale.collect { :n | octaves.collect { :o | n + (o * 12) } }.concatenation;
	let chd = { Choose(tr, mnn) } ! 6;
	{ chrd(chd) } !+ 7
}.OverlapTexture(21, 0, 3).Mix

{- 20060916 ; rd -}
let mkRead = { :l :t |
	BufRd(1, l.asLocalBuf, TRand(0, 6, t), 0, 1)
};
1:4.collect { :n |
	let t = Dust(1.6);
	let f = mkRead([60, 62, 64, 65, 67, 69], t).MidiCps;
	let p = mkRead([-1, -0.5, 0, 0.25, 0.75, 1], t);
	let a = mkRead([0.01, 0.05, 0.1, 0.15, 0.25, 0.35], t);
	EqPan2(SinOsc(f, 0) * a, p)
}.Mix * 0.25

{- 20060917 ; rd ; requires=DustRange -}
let b0 = [60 71 89 65 36 57 92 97 92 97].asLocalBuf;
let b1 = [71 89 60 57 65 36 95 92 93 97].asLocalBuf;
let clk = DustRange(0.2, 0.9);
let env = Decay2(clk, 0.02, 2.5);
let idx = Stepper(clk, 0, 0, 15, 1, 0);
let f1 = (BufRd(1, [b0, b1], idx, 1, 1) - 24).MidiCps;
let f2 = LfNoise0([1, 3]) * 1.2 + f1;
let o1 = SinOsc(f1, 0) * env;
let o2 = SinOsc(f2, 0) * env;
o1 + o2 * 0.2

{- 2006-09-17 ; rd ; two mono buffers -}
let b0 = [60 71 89 65 36 57 92 97 92 97].asLocalBuf;
let b1 = [71 89 60 57 65 36 95 92 93 97].asLocalBuf;
let clk = DustRange(0.2, 0.9);
let env = Decay2(clk, 0.2, 2.5);
let idx = Stepper(clk, 0, 0, 15, 1, 0);
let f1 = (BufRd(1, [b0, b1], idx, 1, 1) - 24).MidiCps;
let f2 = LfNoise0([1, 3]) * 1.2 + f1;
SinOsc(f1, 0) + SinOsc(f2, 0) * env * 0.2

{- 20060919 ; rd -}
let fw = { :r |
	let t = Dust(3);
	let r1 = TiRand(0, 6, t);
	let r2 = TRand(-0.0001, 0.0001, t);
	let b0 = [
		40 47 42 40 50
		43 35 43 40 47
		45 35 43 42 59
		48 40 47 52 45
	].asLocalBuf;
	let b1 = [
		40, 40, 42, 47, 50,
		35, 43, 43, 40, 45,
		42, 35, 48, 47, 43,
		40, 59, 45, 47, 52
	].asLocalBuf;
	let f = BufRd(1, [b0, b1], r1, 0, 2);
	let o1 = Blip((r + f).MidiCps, 12);
	let o2 = Blip((r + f + r2).MidiCps, 12);
	o1 + o2 * Decay2(t, 0.3, 1.2) * 0.1
};
fw(24) + fw(36)

{- 20060920 ; rd -}
let x = MouseX(0.012, 0.19, 1, 0.1) + (LfNoise2(0.2) * 0.1 + 0.05);
let f = Formlet(Blip(10, 12), LfNoise0([20, 40]) * 43 + 700, 0.005, x);
let o = SinOsc(40, 0) * LfNoise0([5, 10]);
f + o * Line(0, 0.25, 2.5)

{- 20060922 ; rd ; requires=Perc -}
let t0 = Impulse(1 / 0.30, 0);
let t1 = TDelay(t0, 0.15);
let t = [t0, t1];
let k = TRand(56, 57, t);
let i = TRand(40, 480, t);
let j = TRand(-1, 1, t);
let c = k.MidiCps;
let m = (k + 1 + j).MidiCps;
let e = Perc(t, 0.01, 0.9, [-4, -4]);
let f = SinOsc(c, 0) * i + m;
SinOsc(f, 0) * e * 0.1

{- 20060922 ; rd ; requires=Perc -}
let t0 = Impulse(1 / 0.30, 0);
let t = [t0, TDelay(t0, 0.15)];
let k = TRand(56, 57, t);
let m = (k + 1 + TRand(-1, 1, t)).MidiCps;
let f = SinOsc(k.MidiCps, 0) * TRand(40, 480, t) + m;
SinOsc(f, 0) * Perc(t, 0.01, 0.9, [-4, -4]) * 0.1

{- 20060925 ; rd -}
let b = BufAlloc(1, 2048);
let x = MouseX(100, 12000, 0, 0.1);
let y = MouseY(0.01, 0.15, 0, 0.1);
let t = Impulse((LfNoise0([3, 3.25]) * 16) + 18, 0);
let e = Decay2(t, 0.01, TRand(0.005, y, t));
let o = Bpf(WhiteNoise() * e, TRand(10, x, t), TRand(0, 1, t));
let p = PvRandComb(Fft(b, o, 0.5, 0, 1, 0), TExpRand(0.15, 1, t), t);
(o * 0.05) + Ifft(p, 0, 0)

{- 20060927 ; rd ; requires=kr -}
let e = Decay2(Impulse({ Rand(10, 13) } ! 2, 0), 0.001, 0.005);
let f = { Rand(4, 7) } ! 2 * SinOsc({ Rand(10, 13) } ! 2, 0) * e;
let r4 = { TRand(2220, 2227, Impulse(0.7, 0)) } ! 2;
SinOsc(r4.kr, 0) * f.kr * 0.15

{- 20061008 ; rd -}
let x = MouseX(15, 0, 0, 0.1);
let y = MouseY(15, 27, 0, 0.1);
let t = Dust(9).kr;
let b = Choose(t, [36, 48, 60, 72]);
let n = LfNoise1([3, 3.05]) * 0.04;
let d = TiRand(x, y, t);
let e = Decay2(t, 0.005, TRand(0.02, 0.15, t));
let k = DegreeToKey([0, 2, 3.2, 5, 7, 9, 10].asLocalBuf, d, 12);
let f = (b + k + n).MidiCps;
let m = e * SinOsc(f, 0) * 0.2;
let u = PulseDivider(t, 9, 0);
let r0 = TRand(0.0075, 0.125, u);
let r1 = TRand(0.05, 0.15, u);
m * 0.5 + AllpassC(m, 0.15, r0, r1)

{- 20061008 ; rd ; requires=kr -}
let t = Dust(9).kr;
let u = PulseDivider(t, 9, 0);
let d = TiRand(MouseX(15, 0, 0, 0.1), MouseY(15, 27, 0, 0.1), t);
let k = DegreeToKey([0, 2, 3.2, 5, 7, 9, 10].asLocalBuf, d, 12);
let m = LfNoise1([3, 3.05]) * 0.04 + Choose(t, [36, 48, 60, 72]) + k;
let o = SinOsc(m.MidiCps, 0) * Decay2(t, 0.005, TRand(0.02, 0.15, t)) * 0.2;
o * 0.5 + AllpassC(o, 0.15, TRand(0.0075, 0.125, u), TRand(0.05, 0.15, u))

{- 20061017 ; rd -}
let o = SinOsc(LfNoise0([0.5, 1.5]), 0);
let t = Impulse(Slope(o).Abs * [2, 3], 0);
let x = MouseX(960, 3620, 1, 0.2);
let y = MouseY(0.5, 2.0, 0, 0.2);
Ringz(Decay2(t, 0.1, 0.2), TRand(x, 3940, t), TRand(0.005, 0.275, t) * y)

{- 20061023 ; rd -}
let n1 = LfNoise0([0.5, 1.5]);
let o = SinOsc(n1, 0);
let a = Slope(o).Abs * [2, 3];
let t = Impulse(a, 0);
let i = Decay2(t, 0.1, 0.2);
let x = MouseX(960, 3620, 1, 0.2);
let y = MouseY(0.5, 2.0, 0, 0.2);
let n2 = TRand(x, 3940, t);
let n3 = TRand(0.005, 0.275, t);
Ringz(i, n2, n3 * y)

{- 20061027 ; rd -}
let h0 = {
	let a = LfNoise0(1) * 0.2 + 1.2;
	let b = LfNoise0(1) * 0.15 + 0.15;
	let f = 40;
	let h = HenonN([f, f * 0.5], a, b, 0, 0);
	Saw(h * 3200 + 1600) * 0.35
};
let h1 = {
	let n0 = LfNoise0(32);
	let n1 = LfNoise0(2);
	let a = MouseX(1.2, 1.4, 0, 0.1);
	let b = MouseY(0.2, 0.3, 0, 0.1);
	let h = n0.Range(1, 32);
	let p = n1.Range(2400, 3200);
	let l = n1.Range(-0.75, 0.75);
	let g = n1.Range(0.55, 0.85);
	let f = 40;
	let o = Blip(HenonN(f, a, b, 0, 0).Range(p, p * 2), h);
	EqPan(o, l) * g * 0.35
};
h0() + h1()
