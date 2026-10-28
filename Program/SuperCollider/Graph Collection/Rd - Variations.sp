/* 20060909 ; rd */
let p = {
	let x = mouseX(0.001, 0.02, 1, 0.1);
	let y = mouseY(120, 400, 1, 0.1);
	let f = lfNoise0(4) * [32, 64];
	let w = lfNoise0(32) * x;
	let z = lfNoise0(2) * 0.1;
	let m = lfNoise0(6);
	let s = pulse(f, w);
	resonz(s, y + z, (m * 0.4) + 0.8) * 0.5
};
let q = {
	let n = lfNoise0(128);
	combN(p(), 0.2, (n * 0.1) + 0.1, 3)
};
let r = {
	let x = mouseX(0.75, 1.25, 1, 0.1);
	let y = mouseY(0.25, 1, 1, 0.1);
	{
		{
			let fr = rand(50, 59) * x;
			let am = rand(0.04, 0.16) * y;
			sinOsc(fr, 0) * am
		} !+ 16
	} ! 2
};
p() + q() + r()

/* 20060911 ; rd */
let t = impulse(22, 0) * (sinOsc(0.5, 0) + 1);
let x = mouseX(0.005, 0.12, 1, 0.1);
let y = mouseY(0.01, 0.52, 1, 0.1);
let z = {
	let n1 = lfNoise0(2);
	let n2 = coinGate(0.05 + n1 + (y * 0.4) + (t * 0.5), t * 0.5);
	let n3 = tExpRand([500, 900], 1600, t);
	ringz(n2, n3, x)
} !> 3;
z.bilateralClip(tRand(0, 1, dust(8))) * 0.25

/* 20060914 ; rd ; graph rewrite ; requires=Sine ; requires=arrayedEnv ; packet size */
let k = 3;
{ :tr |
	let chrd = { :m |
		let ds = 3;
		let du = [5 4 5 7 4 5];
		let d = du * ds;
		let freq = txLine(m, m + tRand(0.05, 0.5, tr), d, tr).midiCps;
		let env = sine(tr, du.max * ds) * tRand(0.005, 0.01, tr);
		let pos = txLine(tRand(-1, 1, tr), tRand(-1, 1, tr), d, tr);
		let osc = sinOsc(freq, 0);
		eqPan2(osc, pos).sum * env
	};
	let scale = [0 2 4 5 7 9 11];
	let octaves = [4 5 6 7];
	let mnn = scale.collect { :n |
		octaves.collect { :o |
			n + (o * 12)
		}
	}.++;
	let chd = {
		tChoose(tr, mnn)
	} ! 6;
	{
		chrd(chd)
	} !+ 7
}.overlapTexture(21, 0, 3).mix

/* 20060916 ; rd */
let mkRead = { :l :t |
	bufRd(1, localBuf(l), tRand(0, 6, t), 0, 1)
};
[1 .. 4].collect { :n |
	let t = dust(1.6);
	let f = mkRead([60, 62, 64, 65, 67, 69], t).midiCps;
	let p = mkRead([-1, -0.5, 0, 0.25, 0.75, 1], t);
	let a = mkRead([0.01, 0.05, 0.1, 0.15, 0.25, 0.35], t);
	eqPan2(sinOsc(f, 0) * a, p)
}.mix * 0.25

/* 20060917 ; rd ; requires=DustRange */
let b = [
	60 71 89 65 36 57 92 97 92 97;
	71 89 60 57 65 36 95 92 93 97
].localBuf;
let clk = dustRange(0.2, 0.9);
let env = decay2(clk, 0.02, 2.5);
let idx = stepper(clk, 0, 0, 15, 1, 0);
let f1 = (bufRd(1, b, idx, 1, 1) - 24).midiCps;
let f2 = lfNoise0([1, 3]) * 1.2 + f1;
let o1 = sinOsc(f1, 0) * env;
let o2 = sinOsc(f2, 0) * env;
o1 + o2 * 0.2

/* 2006-09-17 ; rd ; two mono buffers */
let b = [
	60 71 89 65 36 57 92 97 92 97;
	71 89 60 57 65 36 95 92 93 97
].localBuf;
let clk = dustRange(0.2, 0.9);
let env = decay2(clk, 0.2, 2.5);
let idx = stepper(clk, 0, 0, 15, 1, 0);
let f1 = (bufRd(1, b, idx, 1, 1) - 24).midiCps;
let f2 = lfNoise0([1, 3]) * 1.2 + f1;
sinOsc(f1, 0) + sinOsc(f2, 0) * env * 0.2

/* 20060919 ; rd */
let fw = { :r |
	let t = dust(3);
	let r1 = tiRand(0, 6, t);
	let r2 = tRand(-0.0001, 0.0001, t);
	let b = [
		40 47 42 40 50
		43 35 43 40 47
		45 35 43 42 59
		48 40 47 52 45
		;
		40 40 42 47 50
		35 43 43 40 45
		42 35 48 47 43
		40 59 45 47 52
	].localBuf;
	let f = bufRd(1, b, r1, 0, 2);
	let o1 = blip((r + f).midiCps, 12);
	let o2 = blip((r + f + r2).midiCps, 12);
	o1 + o2 * decay2(t, 0.3, 1.2) * 0.1
};
fw(24) + fw(36)

/* 20060920 ; rd */
let x = mouseX(0.012, 0.19, 1, 0.1) + (lfNoise2(0.2) * 0.1 + 0.05);
let f = formlet(blip(10, 12), lfNoise0([20, 40]) * 43 + 700, 0.005, x);
let o = sinOsc(40, 0) * lfNoise0([5, 10]);
f + o * line(0, 0.25, 2.5)

/* 20060922 ; rd ; requires=Perc */
let t0 = impulse(1 / 0.30, 0);
let t1 = tDelay(t0, 0.15);
let t = [t0, t1];
let k = tRand(56, 57, t);
let i = tRand(40, 480, t);
let j = tRand(-1, 1, t);
let c = k.midiCps;
let m = (k + 1 + j).midiCps;
let e = perc(t, 0.01, 0.9, [-4, -4]);
let f = sinOsc(c, 0) * i + m;
sinOsc(f, 0) * e * 0.1

/* 20060922 ; rd ; requires=Perc */
let t0 = impulse(1 / 0.30, 0);
let t = [t0, tDelay(t0, 0.15)];
let k = tRand(56, 57, t);
let m = (k + 1 + tRand(-1, 1, t)).midiCps;
let f = sinOsc(k.midiCps, 0) * tRand(40, 480, t) + m;
sinOsc(f, 0) * perc(t, 0.01, 0.9, [-4, -4]) * 0.1

/* 20060925 ; rd */
let b = bufAlloc(1, 2048);
let x = mouseX(100, 12000, 0, 0.1);
let y = mouseY(0.01, 0.15, 0, 0.1);
let t = impulse((lfNoise0([3, 3.25]) * 16) + 18, 0);
let e = decay2(t, 0.01, tRand(0.005, y, t));
let o = bpf(whiteNoise() * e, tRand(10, x, t), tRand(0, 1, t));
let p = pvRandComb(fft(b, o, 0.5, 0, 1, 0), tExpRand(0.15, 1, t), t);
(o * 0.05) + ifft(p, 0, 0)

/* 20060927 ; rd ; requires=kr */
let e = decay2(impulse({ rand(10, 13) } ! 2, 0), 0.001, 0.005);
let f = { rand(4, 7) } ! 2 * sinOsc({ rand(10, 13) } ! 2, 0) * e;
let r4 = { tRand(2220, 2227, impulse(0.7, 0)) } ! 2;
sinOsc(r4.kr, 0) * f.kr * 0.15

/* 20061008 ; rd */
let x = mouseX(15, 0, 0, 0.1);
let y = mouseY(15, 27, 0, 0.1);
let t = dust(9).kr;
let b = tChoose(t, [36, 48, 60, 72]);
let n = lfNoise1([3, 3.05]) * 0.04;
let d = tiRand(x, y, t);
let e = decay2(t, 0.005, tRand(0.02, 0.15, t));
let k = [0 2 3.2 5 7 9 10].localBuf.degreeToKey(d, 12);
let f = (b + k + n).midiCps;
let m = e * sinOsc(f, 0) * 0.2;
let u = pulseDivider(t, 9, 0);
let r0 = tRand(0.0075, 0.125, u);
let r1 = tRand(0.05, 0.15, u);
m * 0.5 + allpassC(m, 0.15, r0, r1)

/* 20061008 ; rd ; requires=kr */
let t = dust(9).kr;
let u = pulseDivider(t, 9, 0);
let d = tiRand(mouseX(15, 0, 0, 0.1), mouseY(15, 27, 0, 0.1), t);
let k = [0 2 3.2 5 7 9 10].localBuf.degreeToKey(d, 12);
let m = lfNoise1([3, 3.05]) * 0.04 + tChoose(t, [36, 48, 60, 72]) + k;
let o = sinOsc(m.midiCps, 0) * decay2(t, 0.005, tRand(0.02, 0.15, t)) * 0.2;
o * 0.5 + allpassC(o, 0.15, tRand(0.0075, 0.125, u), tRand(0.05, 0.15, u))

/* 20061017 ; rd */
let o = sinOsc(lfNoise0([0.5, 1.5]), 0);
let t = impulse(slope(o).abs * [2, 3], 0);
let x = mouseX(960, 3620, 1, 0.2);
let y = mouseY(0.5, 2.0, 0, 0.2);
ringz(decay2(t, 0.1, 0.2), tRand(x, 3940, t), tRand(0.005, 0.275, t) * y)

/* 20061023 ; rd */
let n1 = lfNoise0([0.5, 1.5]);
let o = sinOsc(n1, 0);
let a = slope(o).abs * [2, 3];
let t = impulse(a, 0);
let i = decay2(t, 0.1, 0.2);
let x = mouseX(960, 3620, 1, 0.2);
let y = mouseY(0.5, 2.0, 0, 0.2);
let n2 = tRand(x, 3940, t);
let n3 = tRand(0.005, 0.275, t);
ringz(i, n2, n3 * y)

/* 20061027 ; rd */
let h0 = {
	let a = lfNoise0(1) * 0.2 + 1.2;
	let b = lfNoise0(1) * 0.15 + 0.15;
	let f = 40;
	let h = henonN([f, f * 0.5], a, b, 0, 0);
	saw(h * 3200 + 1600) * 0.35
};
let h1 = {
	let n0 = lfNoise0(32);
	let n1 = lfNoise0(2);
	let a = mouseX(1.2, 1.4, 0, 0.1);
	let b = mouseY(0.2, 0.3, 0, 0.1);
	let h = n0.linLin(-1, 1, 1, 32);
	let p = n1.linLin(-1, 1, 2400, 3200);
	let l = n1.linLin(-1, 1, -0.75, 0.75);
	let g = n1.linLin(-1, 1, 0.55, 0.85);
	let f = 40;
	let o = blip(henonN(f, a, b, 0, 0).linLin(-1, 1, p, p * 2), h);
	eqPan(o, l) * g * 0.35
};
h0() + h1()
