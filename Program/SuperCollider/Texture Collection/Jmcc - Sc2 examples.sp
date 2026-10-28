/********** Hell is busy ; Jmcc **********/
let n = 8; /* number of simultaneous events */
{
	eqPan2(
		sinOsc(400 + rand(0, 2000), 0) * lfPulse(1 + rand(0, 10), 0, rand(0, 0.7)) * 0.04,
		rand(-1, 1)
	)
}.overlapTextureProgram(4, 4, n)

/********** Pond life ; Jmcc **********/
let n = 8; /* number of simultaneous events */
{
	eqPan2(
		(
			sinOsc(sinOsc(20 + rand(0, 30), 0).*+(100 + rand(0, 300), 500 + linRand(0, 2000, 0)), 0)
			*
			lfPulse(3 / (1 + rand(0, 8)), 0, 0.2 + rand(0, 0.3)) * 0.04
		),
		rand(-1, 1)
	)
}.overlapTextureProgram(8, 4, n)

/********** Alien froggies ; Jmcc **********/
let rate = 11;
{ :rep |
	rate := (rate * (0.2.BiLinRand.exp)).fold(1, 30);
	formant(rate, expRand(200, 3000), rand(0, 9) * rate + rate) * 0.05
}.overlapTextureProgram(0.5, 0.25, 5)

/********** Random sine waves ; Jmcc **********/
let n = 12; /* number of simultaneous events */
let env = envLinen(2, 5, 2, 1, -4);
{
	eqPan2(
		sinOsc(rand(0, 2000), 0) * envGen(1, 0.02, 0, 1, 2, env),
		rand(-1, 1)
	)
}.spawnTextureProgram { 9 / n }

/********** Random pulsations ; Jmcc **********/
let n = 8; /* number of simultaneous events */
let env = envLinen(2, 5, 2, 0.02, -4);
{
	eqPan2(
		(sinOsc(rand(0, 2000), 0) * envGen(1, 1, 0, 1, 2, env)).amClip(sinOsc(8 + linRand(0, 80, 0), 0)),
		sinOsc(0.3 + rand(0, 0.5), rand(0, 2.pi)) * 0.7
	)
}.spawnTextureProgram { 9 / n }

/********** Tremulate ; Jmcc **********/
{
	let f = 500 + rand(0, 400);
	let r = 30 + rand(0, 60);
	mix(
		eqPan2(
			/* just minor seventh chord */
			sinOsc(f * [1, 1.2, 1.5, 1.8], 0) * max(0, lfNoise2([r, r, r, r]) * 0.1),
			{ rand(-1, 1) } ! 4
		)
	).combN(0.1, 0.1, 1)
}.xFadeTextureProgram(2, 0.5)

/********** Bouncing lightbulbs, pencils, cans, and other assorted objects ; Jmcc **********/
{
	eqPan2(
		ringzBank( /* resonant filter bank simulates resonant modes of bouncing objects */
			decay( /* decays excite filter bank, each impulse triggers a decay */
				impulse( /* impulses trigger decay envelope */
					xLine(5 + rand(-2, 2), 600, 4), 0).*( /* accellerating frequency */
						xLine(0.09, 0.000009, 4)), /* decaying impulse amplitude */
				0.001 /* decay time - very short */
			),
			{ 400 + rand(0, 8000) } ! 4, /* resonant freqs */
			{ rand(0, 1) } ! 4, /* amplitudes */
			{ 0.01 + rand(0, 0.1) } ! 4 /* ring times */
		),
		rand(-1, 1) /* place each bouncer at a random position in the stereo field */
	) * /* multiply by an envelope is necessary to make the sound end */
	cutoff(3, 0.001, -4) /* 3 second cut off envelope to end sound */
}.spawnTextureProgram { 0.6 + 0.6.atRandom }

/********** Bank of resonators excited by impulses ; Jmcc **********/
let n = 5; /* number of simultaneous instruments */
let p = 15; /* number of partials per instrument */
{
	eqPan2(
		ringzBank(
			dust(0.7) * 0.04,
			{ 80 + 10000.linRand} ! p, /* frequencies */
			{ rand(-1, 1) } ! p, /* amplitudes */
			{ 0.2 + rand(0, 8) } ! p /* ring times */
		),
		rand(-1, 1)
	)
}.overlapTextureProgram(6, 6, n)

/********** Excited by noise bursts ; Jmcc ***********/
let n = 5; /* number of simultaneous instruments */
let p = 8; /* number of partials per instrument */
{
	let exciter = decay(dust(0.6) * 0.001, 3.1) * whiteNoise();
	{
		ringzBank(
			exciter,
			{ 80 + 10000.linRand} ! p,
			nil,
			{ 0.2 + rand(0, 4) } ! p
		)
	} ! 2
}.overlapTextureProgram(8, 8, n)

/********** Resonators at random frequencies excited by brownNoise ; Jmcc ***********/
let p = 32; /* number of partials per channel */
{
	let noise = brownNoise() * 0.001;
	{
		ringzBank(
			noise,
			{ 80 + 10000.linRand} ! p,
			{ rand(-1, 1) } ! p, /* amplitudes */
			{ 0.5 + rand(0, 2) } ! p
		)
	} ! 2
}.xFadeTextureProgram(6, 6)

/********** Resonators tuned in a harmonic series with pitch ratios from a just scale ; Jmcc *********/
let p = 12; /* number of overtones */
{
	let noise = brownNoise() * 0.001;
	let freq = [
		1 1.125 1.25 1.333 1.5 1.667 1.875 2 /* a list representing a just diatonic scale expressed as ratios. */
		2.25 2.5 2.667 3 3.333 3.75 4
	].atRandom * 120; /* one value is chosen at random and multiplied by a 120 Hz fundamental */
	{
		ringzBank(
			noise,
			{ rand(-0.5, 0.5) } ! p + p.arithmeticProgression(freq, freq),
			1 / [1 .. p],
			{ 0.5 + rand(0, 4) } ! p
		)
	} ! 2
}.xFadeTextureProgram(1, 7)

/********** Odd harmonics only, short ring times, LfNoise source ; Jmcc **********/
let p = 12; /* number of overtones */
{
	let noise = lfNoise2(8000) * 0.004;
	let freq = [
		1 1.125 1.25 1.333 1.5 1.667 1.875 2 /* a list representing a just diatonic scale expressed as ratios */
		2.25 2.5 2.667 3 3.333 3.75 4
	].atRandom * 120; /* one value is chosen at random and multiplied by a 120 Hz fundamental */
	{
		ringzBank(
			noise,
			{ rand(-0.5, 0.5) } ! p + p.arithmeticProgression(freq, 2 * freq),
			1 / [1 .. p],
			{ 0.2 + rand(0, 0.8) } ! p
		)
	} ! 2
}.xFadeTextureProgram(1, 7)

/********** Pipe wander-cluster ; Jmcc **********/
let n = 6;
let t = 4;
let t3 = t / 3;
let note = 80 + 40.atRandom;
{
	let delay = 1 / note.midiCps;
	note := (note + 15.atRandom - 7).fold(80, 120);
	eqPan2(combL(lpz2(whiteNoise() * 0.01), 0.01, delay, -0.4), rand(-1, 1))
}.overlapTextureProgram(t3, t3, n)

/********** Fast LfOs with slow beats ; Jmcc **********/
let n = 4; /* number of simultaneous events */
{
	let a0 = rand(0, 200) + 40;
	let a1 = a0 + rand(-1, 1);
	let a = [a0, a1];
	let b = rand(0, 2000);
	let c = [a0 + rand(-1, 1), a1 + rand(-1, 1)];
	sinOsc(sinOsc(a, 0).*+(rand(0, 1.0) * b, b), 0).*(sinOsc(c, 0).*+(0.05, 0.05))
}.overlapTextureProgram(8, 4, n)

/********** Birdies ; Jmcc **********/
let n = 4; /* number of simultaneous events */
{
	eqPan2(
		sinOsc(
			lag(
				lfSaw(
					lfPulse(0.4 + rand(0, 1), 0, rand(0, 0.8) + 0.1).*+(rand(0, 3) + 4, 2)
					+
					lfPulse(0.4 + rand(0, 1), 0, rand(0, 0.8) + 0.1).*(rand(0, 3) + 4),
					0
				).*+(
					(1000 + rand(0, 800)).-,
					4000 + rand(-1200, 1200)
				),
				0.05
			),
			0
		).*(
			lag(lfPulse(rand(0, 0.5) + 0.2, 0, 0.4) * 0.02, 0.3)
		),
		rand(-1, 1)
	)
}.overlapTextureProgram(7, 4, n)

/********** Birdies ; Jmcc **********/
let n = 4; /* number of simultaneous events */
{
	let p1 = *+(lfPulse(0.4 + rand(0, 1), 0, rand(0, 0.8) + 0.1), rand(0, 3) + 4, 2);
	let p2 = *+(lfPulse(0.4 + rand(0, 1), 0, rand(0, 0.8) + 0.1), rand(0, 3) + 4, 0);
	let freq = lag(*+(lfSaw(p1 + p2, 0), (1000 + rand(0, 800)).-, 4000 + rand(-1200, 1200)), 0.05);
	let amp = lag(*+(lfPulse(0.2 + rand(0, 0.5), 0, 0.4), 0.02, 0), 0.3);
	eqPan2(sinOsc(freq, 0) * amp, rand(-1, 1))
}.overlapTextureProgram(7, 4, n)

/********** Slight mod of 'phase mod with slow beats' ; Jmcc **********/
let n = 4; /* number of simultaneous events */
{
	let x = mouseX(100, 6000, 1, 0.2); /* mouse x controls random freq of new events */
	let y = mouseY(0, 2, 0, 0.2); /* mouse y controls modulation index */
	let ph = 0;
	let f1 = rand(0, x);
	let rate = expRand(10, 40);
	let gate = impulse(xLine(rate, [3 0.3].atRandom * rate, 12), 0);
	3.timesRepeat {
		let f2 = rand(0, x);
		ph := sinOsc([f2, f2 + rand(-1, 1)], 0).*+(y, ph)
	};
	adsr(gate, 0.001, 0.01, 0.25, 0.04, -4) * sinOsc([f1, f1 + rand(-1, 1)], ph) * 0.1
}.overlapTextureProgram(4, 4, n)
