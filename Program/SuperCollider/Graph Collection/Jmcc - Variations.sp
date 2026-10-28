/* Alien froggies (Jmcc) #1 ; left-to-right */
{ :tr |
	let r = tRand(-0.2, [0.1, 0.2], tr).exp.*(11).fold(1, 30);
	r.formant(
		tExpRand([200, 300], 3000, tr),
		tRand([0, 1], 9, tr).*+(r, r)
	).*(0.05)
}.overlapTexture(0.5, 0.25, 5).mix

/* Alien meadow (Jmcc) #6 ; left-to-right */
{ :tr |
	let z = tRand(0, 5000, tr);
	let f = sinOsc(tRand(0, 20, tr), 0).*+(0.1 * z, z);
	let a = sinOsc(tRand(0, 20, tr), 0).*+(0.05, 0.05);
	sinOsc(f, 0).pan2(tRand(-1, 1, tr), a)
}.overlapTexture(6, 2, 6).mix

/* Analog bubbles (Jmcc) ; Method notation */
0.4
.lfSaw(0)
.*+(
	24,
	[8, 7.23]
	.lfSaw(0)
	.*+(3, 80)
).midiCps
.sinOsc(0)
.*(0.04)
.combN(0.2, 0.2, 4)
.*(0.1)

/* Analog bubbles (Jmcc) ; as above ; one line */
0.4.lfSaw(0).*(24).+([8, 7.23].lfSaw(0).*+(3, 80)).midiCps.sinOsc(0).*(0.04).combN(0.2, 0.2, 4).*(0.1)

/* Analog bubbles (Jmcc) ; Alternate linearisation */
[8 7.23]
.lfSaw(0)
.*+(3, 80)
.+(
	0.4
	.lfSaw(0)
	.*(24)
).midiCps
.sinOsc(0)
.*(0.05)
.combN(0.2, 0.2, 4)
.*(0.1)

/* Analog bubbles (Jmcc) ; as above ; one line */
[8, 7.23].lfSaw(0).*+(3, 80).+(0.4.lfSaw(0).*(24)).midiCps.sinOsc(0).*(0.05).combN(0.2, 0.2, 4).*(0.1)

/* Analog bubbles (Jmcc) #1 ; variable bindings */
let o = lfSaw([8, 7.23], 0) * 3 + 80;
let m = lfSaw(0.4, 0) * 24 + o;
combN(sinOsc(m.midiCps, 0) * 0.04, 0.2, 0.2, 4) * 0.1

/* Analog bubbles (Jmcc) #1 ; applicative order */
*(
	combN(
		*+(
			sinOsc(
				*+(
					lfSaw(0.4, 0),
					24,
					*+(
						lfSaw([8, 7.23], 0),
						3,
						80
					)
				).midiCps,
				0),
			0.05,
			0),
		0.2,
		0.2,
		4
	),
	0.1
)

/* Analog bubbles (Jmcc) ; as above ; one line */
*(combN(*(sinOsc(midiCps(*+(lfSaw(0.4, 0), 24, *+(lfSaw([8, 7.23], 0), 3, 80))), 0), 0.05), 0.2, 0.2, 4), 0.1)

/* Analog bubbles (Jmcc) ; operators, multiple lines */
(
	(
		0.4.lfSaw(0)
		* 24
		+ (
			[8 7.23].lfSaw(0)
			* 3
		)
		+ 81
	).midiCps
	.sinOsc(0)
	* 0.04
).combN(0.2, 0.2, 4)
* 0.1

/* Berlin 1977 (Jmcc) #4 ; Event control */
Voicer(1, 16) { :e |
	let freq = (e.x * 24 + 48).midiCps;
	let env = decay2(trig(e.w, 0.001), 0.05 * e.y, 2 * e.y);
	let amp = env * e.z + 0.02;
	let filt = env * (fSinOsc(0.17, 0) * 800) + 1400;
	let pw = sinOsc(0.08, [0, 0.5.pi]) * 0.45 + 0.5;
	let s = pulse(freq, pw) * amp;
	combC(rlpf(s, filt, 0.15), 0.2, [0.2, 0.17], 1.5) * lagUd(e.w, 0, 2 + e.y)
}.mix

/* Berlin 1977 (Jmcc) #4 ; let syntax */
let sequ = { :s :tr | demand(tr, 0, dseq(Infinity, s)) };
let sequR = { :s :tr | demand(tr, 0, dshuf(Infinity, s)) };
let clockRate = mouseX(5, 20, 1, 0.2);
let clockTime = 1 / clockRate;
let clock = impulse(clockRate, 0);
let patternList = [55, 60, 63, 62, 60, 67, 63, 58];
let note = sequ(patternList, clock);
let clock16 = pulseDivider(clock, 16, 0);
let noteTrs = sequR([-12, -7, -5, 0, 2, 5], clock16) + note;
let freq = noteTrs.midiCps;
let env = decay2(clock, 0.05 * clockTime, 2 * clockTime);
let amp = env * 0.1 + 0.02;
let filt = env * fSinOsc(0.17, 0) * 800 + 1400;
let pw = sinOsc(0.08, [0, 0.5.pi]) * 0.45 + 0.5;
let s = pulse(freq, pw) * amp;
combC(rlpf(s, filt, 0.15), 0.2, [0.2, 0.17], 1.5)

/* Bowed string (Jmcc) ; voicer */
Voicer(1, 16) { :e |
	let f = (e.x * 24 + 48).midiCps;
	let k = dynRingzBank(
		brownNoise() * e.z * lagUd(e.w, e.y * 0.1, e.y * 4),
		12.arithmeticProgression(f, f),
		12.geometricProgression(1, rand(0.7, 0.9)),
		{ rand(1, 3) } ! 12
	);
	(k * 0.1).softClip.eqPan2(e.i * 2 - 1)
}.mix * 0.1

/* Bowed string (Jmcc) ; rand */
let root = 5;
let scale = [0 2 4 5 7 9 11] + root;
let oct = [24 36 48 60 72 84];
let f = (scale.atRandom + oct.atRandom).midiCps;
let x = brownNoise([0.007] # 2, 0) * (lfNoise1(expRand(0.125, 0.5)) * 0.6 + 0.4).max(0);
let k = ringzBank(x, 12.arithmeticProgression(f, f), 12.geometricProgression(1, rand(0.7, 0.9)), { rand(1, 3) } ! 12);
(k * 0.1).softClip

/* Bowed string (Jmcc) */
let root = 5;
let scale = [0 2 4 5 7 9 11] + root;
let oct = [24 36 48 60 72 84];
let f = (scale.atRandom + oct.atRandom).midiCps;
let x = brownNoise([0.007] # 2, 0) * (lfNoise1(expRand(0.125, 0.5)) * 0.6 + 0.4).max(0);
let k = ringzBank(
	x,
	12.arithmeticProgression(f, f),
	12.geometricProgression(1, (0.7 -- 0.9).atRandom),
	{ (1 -- 3).atRandom } ! 12
);
(k * 0.1).softClip

/* Bowed string (Jmcc) ; klank */
let root = 5;
let scale = [0 2 4 5 7 9 11] + root;
let oct = [24 36 48 60 72 84];
let f = (scale.atRandom + oct.atRandom).midiCps;
let x = brownNoise([0.007] # 2, 0) * (lfNoise1(expRand(0.125, 0.5)) * 0.6 + 0.4).max(0);
let d = [
	12.arithmeticProgression(f, f),
	12.geometricProgression(1, rand(0.7, 0.9)),
	{ rand(1, 3) } ! 12
].transpose.++;
let k = klank(x, 1, 0, 1, d);
(k * 0.1).softClip

/* Coolant (Jmcc) */
{ ringzBank(onePole(brownNoise() * 0.002, 0.95), { rand(40, 2040) } ! 10, [0.1], [1]) } ! 2

/* Coolant (Jmcc) ; default values */
{ ringzBank(onePole(brownNoise() * 0.002, 0.95), { rand(40, 2040) } ! 10, nil, nil) } ! 2 * 0.1

/* Coolant (Jmcc) ; rand->rand */
{ ringzBank(onePole(brownNoise() * 0.002, 0.95), { (40 -- 2040).atRandom } ! 10, [0.1], [1]) } ! 2

/* Coolant (Jmcc) ; ringz */
let o = onePole(brownNoise() * 0.01, 0.95);
{ ringz(o, rand(40, 2040), 1) * 0.1 } !^ 10

/* Deep trip (Jmcc) #9 ; texture=overlap,12,4,4,inf */
let f = (lfNoise1(rand(0, 0.3)) * 60 + 70).midiCps;
let a = lfNoise2(f * rand(0, 0.5)) * (lfNoise1(rand(0, 8)) * sinOsc(rand(0, 40), 0) * 0.1).max(0);
let s = pan2(sinOsc(f, 0) * a, lfNoise1(rand(0, 5)), 1);
{ combN(s, 0.5, { rand(0, 0.2) + 0.3 } ! 2, 20) } !> 2 + s

/* Deep trip (Jmcc) #9 ; graph rewrite ; left-to-right */
{ :tr |
	let f = lfNoise1(tRand(0, 0.3, tr)).*+(60, 70).midiCps;
	let a = lfNoise2(f.*(tRand(0, 0.5, tr))).*((lfNoise1(tRand(0, 8, tr)).*(sinOsc(tRand(0, 40, tr), 0)).*(0.1)).max(0));
	let s = sinOsc(f, 0).*(a).pan2(lfNoise1(tRand(0, 5, tr)), 1);
	{ s.combN(0.5, { tRand(0, 0.2, tr) + 0.3 } ! 2, 20) } !+ 2 + s
}.overlapTexture(12, 4, 4).mix

/* Hard sync sawtooth with lfo (Jmcc) #6 ; graph-rewrite ; left-to-right */
let txt = { :tr |
	let f = tRand(0, 50, tr).*+(1, 30).midiCps;
	syncSaw(
		[f, f + 0.2],
		sinOsc(0.2, { tRand(0, 1.pi, tr).*(2) } ! 2).*(2).*+(f, f * 3)
	).*(0.05)
}.overlapTexture(4, 4, 4).mix;
txt.combN(0.3, 0.3, 4) + txt.reverse

/* Harmonic swimming (Jmcc) #1 */
let l = line(0, -0.02, 60);
[1 .. 20].collect { :h |
	let n = lfNoise1({ rand(-4, 4) } ! 2 + 6) * 0.02 + l;
	sinOsc(50 * (h + 1), 0) * n.max(0)
}.sum

/* Harmonic tumbling (Jmcc) #1 */
let t = xLine([10, 11], 0.1, 60);
[0 .. 10].collect { :h |
	let e = decay2(dust(t) * 0.02, 0.005, rand(0, 0.5));
	sinOsc(80 * (h + 1), 0) * e
}.mix

/* Hell is busy (Jmcc) #1 ; graph rewrite ; left-to-right */
{ :tr |
	let e = lfPulse(tRand(1, 11, tr), 0, tRand(0, 0.7, tr)) * 0.04;
	sinOsc(tRand(400, 2400, tr), 0).pan2(tRand(-1, 1, tr), e)
}.overlapTexture(4, 4, 8).mix

/* Lfo modulation (Jmcc) #1 */
let o = sinOsc(0.05, 0) * 80 + 160;
let p = sinOsc([0.6, 0.7], 0) * 3600 + 4000;
let s = rlpf(lfPulse(o, 0, 0.4) * 0.05, p, 0.2);
combL(s, 0.3, [0.2, 0.25], 2)

/* Moto rev (Jmcc) #1 */
let f = sinOsc(0.2, 0) * 10 + 21;
let s = lfPulse(f, [0, 0.1], 0.1);
rlpf(s, 100, 0.1).clip(-0.4, 0.4)

/* Police state (Jmcc) #2 */
let e = lfNoise2(lfNoise2([0.4, 0.4]) * 90 + 620) * (lfNoise2([0.3, 0.3]) * 0.15 + 0.18);
combL(
	{
		let f = sinOsc(rand(0.02, 0.12), rand(0, 2.pi)) * rand(600, 1600) + rand(-300, 300);
		pan2(sinOsc(f, 0) * lfNoise2(100 + rand(-20, 20)) * 0.1, rand(-1, 1), 1)
	} !> 4 + e,
	0.3,
	0.3,
	3
) * 0.5

/* Pond life (Jmcc) #1 ; texture=overlap,8,8,4,inf ; requires=kr */
let f = sinOsc(rand(20, 50), 0) * rand(100, 400) + linRand(500, 2500, 0);
let o = sinOsc(f.kr, 0) * lfPulse(3 / rand(1, 9), 0, rand(0.2, 0.5)).kr * 0.04;
eqPan(o, rand(-1, 1))

/* Pulsing bottles (Jmcc) #2 */
let n = 6;
{
	let a = lfPulse(4 + rand(0, 10), 0, rand(0, 0.7)) * 0.8 / n;
	let l = sinOsc(0.1 + rand(0, 0.4), rand(0, 2.pi));
	pan2(resonz(whiteNoise(), 400 + linRand(0, 7000, 0), 0.01), l, 1) * a
} !> n

/* Scratchy (Jmcc) #1 */
let n = brownNoise([0.5] # 2, -0.49);
let f = n.max(0) * 20;
rhpf(f, 5000, 1)

/* Sprinkler (Jmcc) #1 */
bpz2(whiteNoise() * lfPulse(lfPulse(0.09, 0, 0.16) * 10 + 7, 0, 0.25) * 0.1)

/* Theremin (Jmcc) ; Event control */
Voicer(1, 16) { :e |
	let freq = lag(linExp(e.y, 0, 1, 4000, 200), 0.8);
	let a = sinOsc(freq + (freq * sinOsc(4 + 3 * e.j, 0) * 0.02), 0) * e.x * 0.6 * lag(e.w, 0.2);
	pan2(a, e.i * 0.25, 0.5 + e.z)
}.mix * 0.5

/* Tremulate (Jmcc) ; Event control */
let s = Voicer(1, 16) { :e |
	let s = sinOsc(e.x * 400 + 500 * [1 1.2 1.5 1.8], 0); /* just minor seventh chord, 1/1 5/4 3/2 9/5 */
	let a = lfNoise2({ rand(30, 90) } ! 4 * (0.75 + e.j)).max(0) * e.z;
	pan2(s, { rand(-1, 1) } ! 4 + (e.i * 2 - 1), a * lagUd(e.w, 0, e.k * 2)).sum
}.mix * 0.5;
combN(s, 0.1, 0.1, 1)

/* Uplink (Jmcc) #2 ; texture=overlap,4,1,5,inf */
let osc = {
	let e = lfPulse(rand(0, 4), 0, rand(0, 1)) * rand(0, 8000) + rand(0, 2000);
	lfPulse(rand(0, 20), 0, rand(0, 1)) * e
};
pan2(lfPulse(osc() + osc(), 0, 0.5) * 0.04, rand(0, 0.8), 1)

/* What was I thinking? ; Jmcc */
let z = rlpf(
	pulse(
		*+(sinOsc(4, 0), 1, 80).max(
			decay(lfPulse(0.1, 0, 0.05) * impulse(8, 0) * 500, 2)
		),
		*+(lfNoise1(0.157), 0.4, 0.5)
	) * 0.04,
	*+(lfNoise1(0.2), 2000, 2400),
	0.2
);
let y = z * 0.6;
z + [
	combL(y, 0.06, *+(lfNoise1(rand(0, 0.3)), 0.025, 0.035), 1) +
	combL(y, 0.06, *+(lfNoise1(rand(0, 0.3)), 0.025, 0.035), 1)
	,
	combL(y, 0.06, *+(lfNoise1(rand(0, 0.3)), 0.025, 0.035), 1) +
	combL(y, 0.06, *+(lfNoise1(rand(0, 0.3)), 0.025, 0.035), 1)
]

/* What was i thinking? (Jmcc) #2 */
let i = lfPulse(0.1, 0, 0.05) * impulse(8, 0) * 500;
let f = (sinOsc(4, 0) + 80).max(decay(i, 2));
let p = pulse(f, lfNoise1(0.157) * 0.4 + 0.5) * 0.04;
let z = rlpf(p, lfNoise1(0.2) * 2000 + 2400, 0.2) * 0.25;
let y = z * 0.6;
{
	[y, y].collect { :i |
		combL(i, 0.06, lfNoise1(rand(0, 0.3)) * 0.025 + 0.035, 1)
	}.sum
} ! 2 + z

/* Wind metals (Jmcc) ; texture=overlap,5,2,12,inf */
let n = 6;
let exc = brownNoise([0.007] # 2, 0) * (lfNoise1(expRand(0.125, 0.5)) * 0.75 + 0.25).max(0);
let f = { rand(0, rand(500, 8000)) + expRand(60, 4000) } ! n;
let dt = { rand(0.1, 2) } ! n;
let s = ringzBank(exc, f, nil, dt) * 0.1;
s.softClip

/* Zizle (Jmcc) #SC3d1.5 ; texture=overlap,4,4,12,inf */
let a = { :f | (sinOsc(f * [rand(0.7, 1.3), 1], { rand(0, 2.pi) } ! 2) * 0.1).sum };
let o = sinOsc(rand(24, 108).midiCps, rand(0, 2.pi));
let s = o * a(expRand(0.3, 8)).max(0) * a(expRand(6, 24)).abs;
eqPan(s, rand(-1, 1))

/* Analog bubbles (Jmcc) #1 ; requires=keywords */
let o = lfSaw(
	freq: [8 7.23],
	iphase: 0
) * 3 + 80;
let m = lfSaw(
	freq: 0.4,
	iphase: 0
) * 24 + o; /* glissando function */
let s = sinOsc(
	freq: m.midiCps,
	phase: 0
) * 0.04;
combN(
	in: s,
	maxDelayTime: 0.2,
	delayTime: 0.2,
	decayTime: 4
) * 0.1 /* echoing sine wave */

/* Analog bubbles (Jmcc) #1 ; left-to-right */
0.4.lfSaw(0).*(24).+([8, 7.23].lfSaw(0).*+(3, 80)).midiCps.sinOsc(0).*(0.04).combN(0.2, 0.2, 4)

/* Analog bubbles (Jmcc) #1 ; left-to-right */
let o = lfSaw([8, 7.23], 0).*+(3, 80);
let m = lfSaw(0.4, 0).*+(24, o);
sinOsc(m.midiCps, 0).*(0.04).combN(0.2, 0.2, 4)

/* Babbling brook (Jmcc) #SC3 ; left-to-right */
let b = { :f :m :a :g |
	brownNoise()
		.onePole(0.99)
		.rhpf(brownNoise()
			.lpf(f)
			.*+(m, a), 0.03)
		.*(g)
};
[
	{ b(14, 400, 500, 0.06) } ! 2,
	{ b(20, 800, 1000, 0.10) } ! 2
].sum

/* Coolant (Jmcc) ; requires=filterMethods */
{ brownNoise().*(0.002).onePole(0.95).ringzBank({ 40 + rand(0, 2000) } ! 10, [0.1], [1]) } ! 2

/* Modal space (Jmcc) #8 ; left-to-right */
let b = [0 2 3.2 5 7 9 10].localBuf;
let k = degreeToKey(b, mouseX(0, 15, 0, 0.1), 12);
let c = { :n :r |
	let o = sinOsc((k + r + (n * 0.04)).midiCps, 0).*(0.1);
	let t = lfPulse([48, 55].midiCps, 0, 0.15);
	let f = sinOsc(0.1, 0).*+(10, r).midiCps;
	let d = t.rlpf(f, 0.1).*(0.1);
	let m = o + d;
	m.combN(0.31, 0.31, 2) + m
};
let n = lfNoise1([3, 3]);
c(n, 48) + c(n, 72) * 0.25

/* Ostinoodles ; Jmcc ; requires=keywords */
let z = { :tr |
	let sequ = { :list :trig |
		demand(
			trig: trig,
			reset: 0,
			demandUgens: dseq(
				repeats: Infinity,
				list: list
			)
		)
	};
	let root = 81 + tRand(
		lo: -6,
		hi: 6,
		trig: tr
	);
	let major = [0 2 4 5 7 9 11].localBuf;
	let offset = tRand(
		lo: -16,
		hi: 16,
		trig: tr
	);
	let sequence = degreeToKey(
		bufNum: major,
		in: tScramble(
			trigger: tr,
			inputs: [0, 1, 2, 3] + offset
		),
		octave: 12
	) + root;
	let f = txLine(
		start: tExpRand(
			lo: 4,
			hi: 24,
			trig: tr
		),
		end: tExpRand(
			lo: 4,
			hi: 24,
			trig: tr
		),
		dur: 12,
		trig: tr
	);
	let trig = impulse(
		freq: f,
		phase: 0
	);
	let freq = sequ(
		sequence.midiCps,
		trig
	);
	let sig = lfTri(
		freq: freq.kr,
		iphase: 0
	) * decay2(
		in: trig,
		attackTime: 0.004,
		decayTime: 0.3
	).kr * 0.1;
	pan2(
		in: sig,
		pos: tRand(
			lo: -1,
			hi: 1,
			trig: tr
		),
		level: 1
	)
}.overlapTexture(6, 3, 6).mix;
6.timesRepeat {
	z := allpassN(
		in: z,
		maxDelayTime: 0.04,
		delayTime: {
			rand(
				lo: 0,
				hi: 0.04
			)
		} ! 2,
		decayTime: 16)
};
z

/* Scratchy ; Jmcc ; left-to-right */
brownNoise([0.5] # 2, -0.49).max(0).*(20).rhpf(5000, 1)

/* Slow beating sines (Jmcc) #7 ; texture=xFade,4,4,inf */
let n = 20;
let d = 5;
let p = [];
let q = [];
n.timesRepeat {
	let freq = rand(24, 84).midiCps;
	p.add!(freq);
	{ p.add!(freq + rand(-d, d)) } ! 2;
	{ q.add!(freq + rand(-d, d)) } ! 3
};
[p, q].collect { :freq |
	sinOscBank(freq, [1], { rand(0, 2.pi) } ! (3 * n))
} * 0.1 / n

/* Police state ; Jmcc ; requires=keywords */
let n = 4; /* number of sirens */
let node = {
	pan2(
		in: sinOsc(
			freq: sinOsc(
				freq: rand(0, 0.1) + 0.02,
				phase: rand(0, 2.pi)
			) * rand(0, 600) + 1000 + rand(-300, 300),
			phase: 0
		),
		pos: rand(-1, 1),
		level: lfNoise2(freq: 100 + rand(-20, 20)) * 0.1
	)
};
let e = lfNoise2(
	freq: lfNoise2(
		freq: [0.4, 0.4]
	) * 90 + 620
) * (
	lfNoise2(
		freq: [0.3, 0.3]
	) * 0.15 + 0.18
);
combL(
	in: node/0 !+ 4 + e,
	maxDelayTime: 0.3,
	delayTime: 0.3,
	decayTime: 3
) * 0.5

/* Sample and hold liquidities (Jmcc) #4 ; requires=keywords */
let r = mouseX(
	minVal: 1,
	maxVal: 200,
	warp: 1,
	lag: 0.1
);
let t = r.reciprocal;
let c = impulse(
	freq: r,
	phase: 0
) * 0.4;
let cf = mouseY(
	minVal: 100,
	maxVal: 8000,
	warp: 1,
	lag: 0.1
);
let f = latch(
	in: whiteNoise() * cf * 0.5 + cf,
	trig: c
);
let p = latch(
	in: whiteNoise(),
	trig: c
);
let i = eqPan2(
	in: sinOsc(
		freq: f,
		phase: 0
	),
	pos: p
) * decay2(
	in: c,
	attackTime: 0.1 * t,
	decayTime: 0.9 * t
);
combN(
	in: i,
	maxDelayTime: 0.3,
	delayTime: 0.3,
	decayTime: 2
)

/* Why supercollider? (Jmcc) #0 ; requires=keywords */
let s = {
	resonz(
		in: dust(
			density: 0.2
		) * 50,
		freq: rand(
			lo: 200,
			hi: 3200
		),
		bwr: 0.003
	)
} !+ 10;
let z = delayN(
	in: s,
	maxDelayTime: 0.048,
	delayTime: 0.048
);
let x = {
	combL(
		in: z,
		maxDelayTime: 0.1,
		delayTime: lfNoise1(
			freq: rand(
				lo: 0,
				hi: 0.1
			)
		) * 0.04 + 0.05,
		decayTime: 15
	)
} !+ 7;
4.timesRepeat {
	x := allpassN(
		in: x,
		maxDelayTime: 0.050,
		delayTime: {
			rand(
				lo: 0,
				hi: 0.05
			)
		} ! 2,
		decayTime: 1
	)
};
s + (x * 0.2)

/* Tarmac ; Jmcc ; edit (Rd) */
let z = { :tr |
	eqPan2(
		ringzBank(
			pinkNoise() * 0.0008,
			{ linRand(700, 6000, 0) } ! 4,
			nil,
			{ linRand(0.2, 12, 0) } ! 4
		),
		lfNoise1(rand(0, 1))
	) * lfNoise1(lfNoise1(1).*+(3, 4)).*+(0.4, 0.6)
}.overlapTexture(8, 3, 4).sum;
6.timesRepeat {
	z := allpassN(z, 0.040, [rand(0, 0.04), rand(0, 0.04)], 16)
};
z

/* Repeating harmonic klank (Jmcc) */
{ :tr |
	let p = 8;
	let s = decay(dust(0.8) * 0.01, 3.4) * lfSaw(tRand(0, 40, tr), 0); /* linrand */
	let f = tChoose(tr, [4 5 6 7 8 9 10 12 14 15 16] * 100);
	{
		ringzBank(
			s,
			{ f * tRand(1, 13, tr) } ! p,
			[1],
			{ tRand(0.4, 3.4, tr) } ! p
		)
	} ! 2
}.overlapTexture(8, 2, 4).mix

/* Strummable metals ; use mouse to strum strings ; Jmcc */
let mouseX = mouseX(0, 1, 0, 0.2);
let strings = [1 .. 8].collect { :i |
	let trigger = hpz1(mouseX > (0.25 + (i * 0.07))).abs;
	let pluck = pinkNoise() * decay(trigger, 0.05).kr * 0.04;
	let n = 15;
	eqPan2(
		ringzBank(
			pluck,
			{ 300 * i + linRand(0, 8000, 0) } ! n,
			nil,
			{ rand(1, 4) } ! n
		),
		i * 0.2 - 0.5
	)
}.sum;
leakDc(
	lpf(strings, 12000),
	0.995
)
