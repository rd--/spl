/********** Hell is busy ; Jmcc **********/
let n = 8; /* number of simultaneous events */
{
	EqPan2(
		SinOsc(400 + Rand(0, 2000), 0) * LfPulse(1 + Rand(0, 10), 0, Rand(0, 0.7)) * 0.04,
		Rand(-1, 1)
	)
}.overlapTextureProgram(4, 4, n)

/********** Pond life ; Jmcc **********/
let n = 8; /* number of simultaneous events */
{
	EqPan2(
		(
			SinOsc(SinOsc(20 + Rand(0, 30), 0).MulAdd(100 + Rand(0, 300), 500 + LinRand(0, 2000, 0)), 0)
			*
			LfPulse(3 / (1 + Rand(0, 8)), 0, 0.2 + Rand(0, 0.3)) * 0.04
		),
		Rand(-1, 1)
	)
}.overlapTextureProgram(8, 4, n)

/********** Alien froggies ; Jmcc **********/
let rate = 11;
{ :rep |
	rate := (rate * (0.2.BiLinRand.Exp)).Fold(1, 30);
	Formant(rate, ExpRand(200, 3000), Rand(0, 9) * rate + rate) * 0.05
}.overlapTextureProgram(0.5, 0.25, 5)

/********** Random sine waves ; Jmcc **********/
let n = 12; /* number of simultaneous events */
let env = EnvLinen(2, 5, 2, 1, -4);
{
	EqPan2(
		SinOsc(Rand(0, 2000), 0) * EnvGen(1, 0.02, 0, 1, 2, env.asList),
		Rand(-1, 1)
	)
}.spawnTextureProgram(9 / n)

/********** Random pulsations ; Jmcc **********/
let n = 8; /* number of simultaneous events */
let env = EnvLinen(2, 5, 2, 0.02, -4);
{
	EqPan2(
		(SinOsc(Rand(0, 2000), 0) * EnvGen(1, 1, 0, 1, 2, env.asList)).AmClip(SinOsc(8 + LinRand(0, 80, 0), 0)),
		SinOsc(0.3 + Rand(0, 0.5), Rand(0, 2.pi)) * 0.7
	)
}.spawnTextureProgram(9 / n)

/********** Tremulate ; Jmcc **********/
{
	let f = 500 + Rand(0, 400);
	let r = 30 + Rand(0, 60);
	Mix(
		EqPan2(
			/* just minor seventh chord */
			SinOsc(f * [1, 1.2, 1.5, 1.8], 0) * Max(0, LfNoise2([r, r, r, r]) * 0.1),
			{ Rand(-1, 1) } ! 4
		)
	).CombN(0.1, 0.1, 1)
}.xFadeTextureProgram(2, 0.5)

/********** Bouncing lightbulbs, pencils, cans, and other assorted objects ; Jmcc **********/
{
	EqPan2(
		RingzBank( /* resonant filter bank simulates resonant modes of bouncing objects */
			Decay( /* decays excite filter bank, each impulse triggers a decay */
				Impulse( /* impulses trigger decay envelope */
					XLine(5 + Rand(-2, 2), 600, 4), 0).Times( /* accellerating frequency */
						XLine(0.09, 0.000009, 4)), /* decaying impulse amplitude */
				0.001 /* decay time - very short */
			),
			{ 400 + Rand(0, 8000) } ! 4, /* resonant freqs */
			{ Rand(0, 1) } ! 4, /* amplitudes */
			{ 0.01 + Rand(0, 0.1) } ! 4 /* ring times */
		),
		Rand(-1, 1) /* place each bouncer at a random position in the stereo field */
	) * /* multiply by an envelope is necessary to make the sound end */
	Cutoff(3, 0.001, -4) /* 3 second cut off envelope to end sound */
}.spawnTextureProgram({ 0.6 + 0.6.atRandom })

/********** Bank of resonators excited by impulses ; Jmcc **********/
let n = 5; /* number of simultaneous instruments */
let p = 15; /* number of partials per instrument */
{
	EqPan2(
		RingzBank(
			Dust(0.7) * 0.04,
			{ 80 + 10000.LinRand} ! p, /* frequencies */
			{ Rand(-1, 1) } ! p, /* amplitudes */
			{ 0.2 + Rand(0, 8) } ! p /* ring times */
		),
		Rand(-1, 1)
	)
}.overlapTextureProgram(6, 6, n)

/********** Excited by noise bursts ; Jmcc ***********/
let n = 5; /* number of simultaneous instruments */
let p = 8; /* number of partials per instrument */
{
	let exciter = Decay(Dust(0.6) * 0.001, 3.1) * WhiteNoise();
	{
		RingzBank(
			exciter,
			{ 80 + 10000.LinRand} ! p,
			nil,
			{ 0.2 + Rand(0, 4) } ! p
		)
	} ! 2
}.overlapTextureProgram(8, 8, n)

/********** Resonators at random frequencies excited by BrownNoise ; Jmcc ***********/
let p = 32; /* number of partials per channel */
{
	let noise = BrownNoise() * 0.001;
	{
		RingzBank(
			noise,
			{ 80 + 10000.LinRand} ! p,
			{ Rand(-1, 1) } ! p, /* amplitudes */
			{ 0.5 + Rand(0, 2) } ! p
		)
	} ! 2
}.xFadeTextureProgram(6, 6)

/********** Resonators tuned in a harmonic series with pitch ratios from a just scale ; Jmcc *********/
let p = 12; /* number of overtones */
{
	let noise = BrownNoise() * 0.001;
	let freq = [
		1 1.125 1.25 1.333 1.5 1.667 1.875 2 /* a list representing a just diatonic scale expressed as ratios. */
		2.25 2.5 2.667 3 3.333 3.75 4
	].atRandom * 120; /* one value is chosen at random and multiplied by a 120 Hz fundamental */
	{
		RingzBank(
			noise,
			{ Rand(-0.5, 0.5) } ! p + p.arithmeticProgression(freq, freq),
			1 / 1:p,
			{ 0.5 + Rand(0, 4) } ! p
		)
	} ! 2
}.xFadeTextureProgram(1, 7)

/********** Odd harmonics only, short ring times, LfNoise source ; Jmcc **********/
let p = 12; /* number of overtones */
{
	let noise = LfNoise2(8000) * 0.004;
	let freq = [
		1 1.125 1.25 1.333 1.5 1.667 1.875 2 /* a list representing a just diatonic scale expressed as ratios */
		2.25 2.5 2.667 3 3.333 3.75 4
	].atRandom * 120; /* one value is chosen at random and multiplied by a 120 Hz fundamental */
	{
		RingzBank(
			noise,
			{ Rand(-0.5, 0.5) } ! p + p.arithmeticProgression(freq, 2 * freq),
			1 / 1:p,
			{ 0.2 + Rand(0, 0.8) } ! p
		)
	} ! 2
}.xFadeTextureProgram(1, 7)

/********** Pipe wander-cluster ; Jmcc **********/
let n = 6;
let t = 4;
let t3 = t / 3;
let note = 80 + 40.atRandom;
{
	let delay = 1 / note.MidiCps;
	note := (note + 15.atRandom - 7).fold(80, 120);
	EqPan2(CombL(Lpz2(WhiteNoise() * 0.01), 0.01, delay, -0.4), Rand(-1, 1))
}.overlapTextureProgram(t3, t3, n)

/********** Fast LfOs with slow beats ; Jmcc **********/
let n = 4; /* number of simultaneous events */
{
	let a0 = Rand(0, 200) + 40;
	let a1 = a0 + Rand(-1, 1);
	let a = [a0, a1];
	let b = Rand(0, 2000);
	let c = [a0 + Rand(-1, 1), a1 + Rand(-1, 1)];
	SinOsc(SinOsc(a, 0).MulAdd(Rand(0, 1.0) * b, b), 0).Times(SinOsc(c, 0).MulAdd(0.05, 0.05))
}.overlapTextureProgram(8, 4, n)

/********** Birdies ; Jmcc **********/
let n = 4; /* number of simultaneous events */
{
	EqPan2(
		SinOsc(
			Lag(
				LfSaw(
					LfPulse(0.4 + Rand(0, 1), 0, Rand(0, 0.8) + 0.1).MulAdd(Rand(0, 3) + 4, 2)
					+
					LfPulse(0.4 + Rand(0, 1), 0, Rand(0, 0.8) + 0.1).Times(Rand(0, 3) + 4),
					0
				).MulAdd(
					(1000 + Rand(0, 800)).-,
					4000 + Rand(-1200, 1200)
				),
				0.05
			),
			0
		).Times(
			Lag(LfPulse(Rand(0, 0.5) + 0.2, 0, 0.4) * 0.02, 0.3)
		),
		Rand(-1, 1)
	)
}.overlapTextureProgram(7, 4, n)

/********** Birdies ; Jmcc **********/
let n = 4; /* number of simultaneous events */
{
	let p1 = MulAdd(LfPulse(0.4 + Rand(0, 1), 0, Rand(0, 0.8) + 0.1), Rand(0, 3) + 4, 2);
	let p2 = MulAdd(LfPulse(0.4 + Rand(0, 1), 0, Rand(0, 0.8) + 0.1), Rand(0, 3) + 4, 0);
	let freq = Lag(MulAdd(LfSaw(p1 + p2, 0), (1000 + Rand(0, 800)).-, 4000 + Rand(-1200, 1200)), 0.05);
	let amp = Lag(MulAdd(LfPulse(0.2 + Rand(0, 0.5), 0, 0.4), 0.02, 0), 0.3);
	EqPan2(SinOsc(freq, 0) * amp, Rand(-1, 1))
}.overlapTextureProgram(7, 4, n)

/********** Slight mod of 'phase mod with slow beats' ; Jmcc **********/
let n = 4; /* number of simultaneous events */
{
	let x = MouseX(100, 6000, 1, 0.2); /* mouse x controls random freq of new events */
	let y = MouseY(0, 2, 0, 0.2); /* mouse y controls modulation index */
	let ph = 0;
	let f1 = Rand(0, x);
	let rate = ExpRand(10, 40);
	let gate = Impulse(XLine(rate, [3 0.3].atRandom * rate, 12), 0);
	3.timesRepeat {
		let f2 = Rand(0, x);
		ph := SinOsc([f2, f2 + Rand(-1, 1)], 0).MulAdd(y, ph)
	};
	Adsr(gate, 0.001, 0.01, 0.25, 0.04, -4) * SinOsc([f1, f1 + Rand(-1, 1)], ph) * 0.1
}.overlapTextureProgram(4, 4, n)
