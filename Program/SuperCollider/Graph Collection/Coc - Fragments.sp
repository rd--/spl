/* Wandering sines ; https://github.com/cianoc/supercollider_fragments */
let f = (lfNoise1(0.5) * 600 + (lfSaw(1.5, 0) * 50 + 500)).abs;
let o = sinOsc(f, 0) * 0.1;
let d = combN(o, 3.0, [1.35, 0.7], 6);
pan2(o, 0, 1) + d

/* Random sine waves */
{
	pan2(sinOsc(sinOsc(1 / 10, rand(0, 6)) * 200 + 600, 0), rand(0, 1), 0.05)
} !+ 15

/* Nice use of blip */
let t = impulse(6, 0);
let o = blip(tRand(48, 72, t).midiCps, tRand(1, 12, t)) * tRand(-0.5, 0.4, t).max(0);
let p = pan2(o, tRand(-1.0, 1.0, t), decay2(t, 0.1, 3) * 0.5);
p + combL(p, 2.0, 4 / 6, 6)

/* Interesting rising sounds */
[1 .. 5].collect { :c |
	pan2(sinOsc(lfSaw((c * 0.2 + 1) / 3, 0) * 500 + 700, 0), lfNoise0(1), 0.05)
}.mix

/* Use of dust with rising sounds ; rand */
{
	let s = ringzBank(dust(1 / 3) * 0.1, { expRand(1000, 10000) } ! 3, [1], { rand(1, 4) } ! 15);
	pan2(s, lfTri(rand(3, 10), 0), 0.1)
} !+ 20

/* Pretty nice but inessential ; rand */
[1 .. 12].collect { :i |
	let freq = mouseX(rand(0.1, 5), rand(3, 20), 0, 0.2);
	let amp = lfNoise0(mouseX(rand(1, 6), rand(1, 6), 0, 0.2)).max(0);
	let osc = sinOsc(sinOsc(freq, 0) * mouseY(10, 50, 0, 0.2) + rand(200, 5000), 0) * amp;
	pan2(osc, rand(-1, 1), 0.03)
}.mix

/* Random impulses */
{
	let freq = expRand(100, 3000);
	let amp = decay2(dust(1 / 5), 0.1, (freq ^ -0.7) * 100);
	pan2(sinOsc(freq * (lfNoise1(1 / 6) * 0.4 + 1), 0) * amp, lfNoise1(1 / 8), 1)
} !+ 15 * 0.1

/* Random impulses ; decay2 */
{
	let freq = expRand(100, 3000);
	let t = dust(1 / 5);
	let amp = decay2(t, 0.01, freq ^ -0.7 * 100);
	pan2(sinOsc(freq * (lfNoise1(1 / 6) * 0.4 + 1), 0) * amp, lfNoise1(1 / 8), 1)
} !+ 15 * 0.1

/* Angry birds */
let lfo = lfNoise1([28, 27]) * 400 + 2000;
sinOsc(lfo, 0) * 0.1

/* Lasers ; requires=kr */
sinOsc(adsr(dust(1), 0.1, 0.4, 0.8, 0.5, [-4]).kr * 10000, 0) * 0.1

/* saw as an Lfo */
let lfo = lfSaw(2, 0) * -100 + 600;
sinOsc(lfo, 0) * 0.1

/* Synched impulses */
let sync = 5;
[
	sinOsc(100, 0) * decay2(impulse(3 / sync, 0), 0.01, 1),
	sinOsc(300, 0) * decay2(impulse(7 / sync, 0), 0.01, 1),
	sinOsc(500, 0) * decay2(impulse(5 / sync, 0), 0.01, 1),
	sinOsc(700, 0) * decay2(impulse(2 / sync, 0), 0.01, 1),
	sinOsc(900, 0) * decay2(impulse(9 / sync, 0), 0.01, 1),
	sinOsc(1100, 0) * decay2(impulse(6 / sync, 0), 0.01, 1),
	sinOsc(1300, 0) * decay2(impulse(1 / sync, 0), 0.01, 1)
].sum * 0.1

/* Synched impulses, abstracted */
let sync = 5;
let f = { :frq :num |
	sinOsc(frq, 0) * decay2(impulse(num / sync, 0), 0.01, 1)
};
[f(100, 3), f(300, 7), f(500, 5), f(700, 2), f(900, 9), f(1100, 6), f(1300, 1)].splay * 0.2

/* Synchronised impulses, structured */
let sync = 5;
let freq = [1, 3, 5, 7, 9, 11, 13];
let numer = [3, 7, 5, 2, 9, 6, 1];
freq.indices.collect { :i |
	sinOsc(freq[i] * 100, 0) * decay2(impulse(numer[i] / sync, 0), 0.01, 1)
}.splay * 0.2

/* Nice buzzing effect */
let speed = 14;
let f = sinOsc(1000, 0) * 150 + 300;
let t = impulse(1 / 3, 0);
[1 .. 12].collect { :n |
	sinOsc(f * n, 0) * (lfNoise1(rand(speed, speed * 2)) * 0.5 + 0.5) / n
}.sum * 0.1

/* Additive sawtooth */
let f = 100;
let t = impulse(1 / 3, 0);
let dt = [1.4, 1.1, 2, 1, 1.8, 2.9, 4, 0.3, 1, 3.6, 2.3, 1.1];
[1 .. 12].collect { :n |
	sinOsc(f * n, 0) * decay2(t, 0.01, dt[n]) / n
}.sum * 0.1

/* Lovely bells */
let t = impulse(1 / 3, 0);
let m = { rand(1, 3) } ! 2;
let env = decay2(t, 0.01 * m, 1 * m) / [1 .. 6];
sinOsc([60 64 67 71 74 78].midiCps, 0).sum * env * 0.1

/* Interesting drone */
let freq = [40 42 43 45 47 48 41 42].midiCps;
let amp = lfNoise1({ rand(0.1, 0.5) } ! 8) * 0.5 + 0.5;
pan2(sinOsc(freq, 0), { rand(-1, 1) } ! 8, amp).mix * 0.1

/* Great inharmonic spectrum */
let freq = [72 135 173 239 267 306 355 473 512 572 626];
let amp = [0.25 0.11 0.12 0.04 0.1 0.15 0.05 0.01 0.03 0.02 0.12] * 0.2;
splay(sinOsc(freq, 0) * amp)

/* Random bells, let it run for a while */
let k = 12;
let tr = dust(3 / 7);
{
	sinOsc(rand(50, 4000), 0) * decay2(tr, 0.01, rand(0.2, 3)) * rand(0.1, 1)
} !^ k / k

/* Shimmering harmonics */
let harmonics = 16;
{
	let amp = sinOsc(1 / rand(3, 6), 0) * rand(0.1, 0.9);
	pan2(sinOsc(expRand(100, 2000), 0), rand(-1, 1), amp)
} !+ harmonics / (2 * harmonics)

/* Worth experimenting with */
let tr = dust(3 / 7);
let f0 = rand(100, 400);
[1 .. 16].collect { :partial |
	let env = asr(tr, 0, 5, [0]) / partial;
	let amp = lfNoise1(rand(5, 12)).max(0);
	pan2(sinOsc(f0 * partial, 0), rand(-1, 1), env * amp)
}.mix * 0.5

/* Multiple sines */
let speeds = [1 .. 11] / 20;
let f0 = (mouseX(0, 36, 0, 0.2).round(7) + 24).midiCps;
let harmonics = 16;
[1 .. harmonics].collect { :partial |
	pan2(sinOsc(f0 * partial, 0), rand(-1, 1), sinOsc(speeds.atRandom, 0).max(0))
}.mix / harmonics * 0.5

/* More bells */
let env = decay2(dust(1 / 3), 0.01, 2) * 0.1;
let osc = sinOsc({ rand(300, 1200) } ! 12, 0);
pan2(osc, { rand(-1, 1) } ! 12, env).mix

/* Pink noise, frequencies emerge */
rlpf(pinkNoise() * 0.3, { lfNoise0(12) } ! 2 * 500 + 500, 0.2)

/* Random drones */
{
	ringzBank(
		pinkNoise() * 0.0005,
		{ expRand(60, 10000) } ! 15,
		[1],
		[1]
	)
} ! 2

/* This one floats in and out */
let totalPartials = 3;
{
	let base = expRand(50, 100);
	let freq = { rand(1, 24) * base * rand(1, 1.1) } ! totalPartials;
	let amp = { rand(0.1, 0.5) } ! 10;
	let res = ringzBank(greyNoise() * rand(0.03, 0.1), freq, amp, [1]);
	pan2(res, lfNoise1(1), (sinOsc(10 / rand(1, 5), 0) * 0.005).max(0))
} !> 8 * lfNoise1(1 / 10).abs

/* Phase modulation, all three */
{
	let car = lfNoise0(9) * 300 + 700;
	let mod = lfNoise0(9) * 500 + 700;
	let ix = lfNoise0(9) * 6 + 12;
	pmOsc(car, mod, ix, 0) * 0.15
} ! 2

/* Ping pong */
let rate = 5;
let tr = impulse(5, 0);
let freq = tRand([36, 60], [72, 86], tr).midiCps;
let ratio = 2;
let env = decay2(tr, 0, 1.25 / rate);
pmOsc(freq, freq * ratio, 3 + env * 4, 0) * env * 0.25

/* Sample and hold */
let i = latch(lfSaw(mouseX(1.1, 30, 0, 0.2), 0) * 5 + 5, impulse(10, 0));
pmOsc(300, 356, i, 0) * 0.1

/* Envelope used also for the index */
let f = latch(
	(sinOsc([100 200 300 550], 0) * 100 + 110).sum,
	impulse(7, 0)
);
let e = decay2(impulse(7, 0), 0.02, 0.2);
pmOsc(f, f * [1.25, mouseX(1, 3, 0, 0.2)], e * [5, mouseY(3, 9, 0, 0.2)], 0) * e * 0.1

/* Generating melodic runs */
sinOsc(latch(lfSaw(mouseX(0.1, 20, 0, 0.2), 0) * 500 + 600, impulse(10, 0)), 0) * 0.1

/* Generating melodic runs, use line instead of mouse */
sinOsc(latch(lfSaw(line(0.1, 20, 60), 0) * 500 + 600, impulse(10, 0)), 0) * 0.1

/* Rise fall pad ; Event control */
voicer(1, 16) { :e |
	let mnn = e.x * 24 + 48;
	let freq = mnn.midiCps;
	let gate = e.w;
	let osc1 = saw(freq + lfTri(0.3, 0));
	let osc2 = saw((mnn - 0.03).midiCps);
	let filterEnv = adsr(gate, 1, 1.4, 0.05, 0.2, 0);
	let ampEnv = adsr(gate, 0.1, 0.01, 0.6, 1.5, 0) * e.z;
	pan2(rlpf(osc1 + osc2, 3000 * filterEnv + freq, 1.5), e.i * 2 - 1, ampEnv)
}.mix
