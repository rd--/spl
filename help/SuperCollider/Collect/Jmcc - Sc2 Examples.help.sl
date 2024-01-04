(* Analog bubbles ; Jmcc *)
let f = LfSaw(0.4, 0).MulAdd(24, LfSaw([8, 7.23], 0).MulAdd(3, 80)).MidiCps; (* glissando function *)
CombN(SinOsc(f, 0) * 0.04, 0.2, 0.2, 4) (* echoing sine wave *)

(* Lfo modulation of Pulse waves and resonant filters ; Jmcc *)
CombL(
	Rlpf(LfPulse(SinOsc(0.05, 0).MulAdd(80, 160),0, 0.4) * 0.05,
		SinOsc([0.6, 0.7], 0).MulAdd(3600, 4000), 0.2),
	0.3, [0.2, 0.25], 2)

(* Moto rev ; Jmcc *)
Rlpf(LfPulse(SinOsc(0.2, 0).MulAdd(10, 21), 0, 0.1), 100, 0.1).Clip2(0.4)

(* Scratchy ; Jmcc *)
Rhpf(BrownNoise(2).MulAdd(0.5, -0.49).Max(0) * 20, 5000, 1)

(* Sprinkler ; Jmcc *)
Bpz2(WhiteNoise() * LfPulse(LfPulse(0.09, 0, 0.16).MulAdd(10, 7), 0, 0.25) * 0.1)

(* Sprinkler ; mouse ; Jmcc *)
Bpz2(WhiteNoise() * LfPulse(MouseX(0.2, 50, 0, 0.2), 0, 0.25) * 0.1)

(* Harmonic swimming ; Jmcc *)
let f = 50; (* fundamental frequency *)
let p = 20; (* number of partials per channel *)
let z = 0; (* start of oscil daisy chain *)
let offset = Line(0, -0.02, 60); (* causes sound to separate and fade *)
(1 .. p).do { :i |
z := SinOsc(
	f * i, 0).MulAdd( (* freq of partial *)
		Max(0, (* clip negative amplitudes to zero *)
			LfNoise1(
				6 + [4.Rand2, 4.Rand2]).MulAdd( (* amplitude rate *)
					0.02, (* amplitude scale *)
					offset (* amplitude offset *)
				)
		),
		z
	)
};
z

(* Harmonic tumbling ; Jmcc *)
let f = 80; (* fundamental frequency *)
let p = 10; (* number of partials per channel *)
let z = 0; (* start of oscil daisy chain *)
let trig = XLine([10, 10], 0.1, 60); (* trigger probability decreases over time *)
(1 .. p).do { :i |
z := SinOsc(
	f * i, 0).MulAdd( (* freq of partial *)
		Decay2(
			Dust(trig) (* trigger rate *)
			* 0.02, (* trigger amplitude *)
			0.005, (* grain attack time *)
			0.5.Rand0 (* grain decay time *)
		),
		z
	)
};
z

(* Reso pulse ; Jmcc *)
let z = { :tr |
	let f = TChoose(tr, [25 30 34 37 41 42 46 49 53 54 58 61 63 66]).MidiCps;
	LfPulse(f, 0, 0.2) + LfPulse(2 * f + TRand(-0.5, 0.5, tr), 0, 0.2)
}.OverlapTexture(4, 2, 4).Sum;
let lfoFreq = 6;
let lfo = LfNoise0(lfoFreq).MulAdd(1000, 1200);
let left = Rlpf(
	z * 0.02,
	lfo, (* cutoff freq *)
	MouseX(0.2, 0.02, 1, 0.2)
); (* filter bandwidth *)
let delayTime = 2 / lfoFreq;
let right = DelayN(left, delayTime, delayTime); (* delay right channel by two beats *)
[left, right]

(* Pulsing bottles ; Jmcc *)
let n = 6; (* number of 'bottles' *)
{
        EqPan2(
		Resonz(
			WhiteNoise() * LfPulse(4 + 10.Rand0, 0, 0.7.Rand0) * 0.8 / n,
			400 + 7000.LinRand0,
			0.01
		),
		SinOsc(0.1 + 0.4.Rand0, 2.pi.Rand0)
        )
} !> n

(* What was I thinking? ; Jmcc *)
let z = Rlpf(
	Pulse(
		Max(SinOsc(4, 0) + 80,
			Decay(LfPulse(0.1, 0, 0.05) * Impulse(8, 500), 2)
		),
		LfNoise1(0.157).MulAdd(0.4, 0.5)) * 0.04,
	LfNoise1(0.2).MulAdd(2000, 2400),
	0.2);
let y = z * 0.6;
z +  [
	CombL(y, 0.06, LfNoise1(0.3.Rand0).MulAdd(0.025, 0.035), 1)
	+ CombL(y, 0.06, LfNoise1(0.3.Rand0).MulAdd(0.025, 0.035), 1)
	,
	CombL(y, 0.06, LfNoise1(0.3.Rand0).MulAdd(0.025, 0.035), 1)
	+ CombL(y, 0.06, LfNoise1(0.3.Rand0).MulAdd(0.025, 0.035), 1)
]

(* Police state ; Jmcc *)
let n = 4; (* number of sirens *)
CombL(
	{
		EqPan2(
			SinOsc(
				SinOsc(0.1.Rand0 + 0.02, 2.pi.Rand0).MulAdd(600.Rand0, 1000 + 300.Rand2),
				0) * LfNoise2(100 + 20.Rand2) * 0.1,
			1.Rand2
		)
	} !> n
	+ LfNoise2(LfNoise2([0.4, 0.4]).MulAdd(90, 620)).Mul(LfNoise2([0.3, 0.3]).MulAdd(0.15, 0.18)),
	0.3, 0.3, 3)

(* ---- Hell is busy ; texture ; Jmcc *)
let n = 8; (* number of simultaneous events *)
{
	EqPan2(
		SinOsc(400 + 2000.Rand0, 0) * LfPulse(1 + 10.Rand0, 0, 0.7.Rand0) * 0.04,
		1.Rand2)
}.overlap(4, 4, n)

(* ----- pond life ; texture ; Jmcc *)
let n = 8; (* number of simultaneous events *)
{
	EqPan2(
		SinOsc(SinOsc(20 + 30.Rand0, 0).MulAdd(100 + 300.Rand0, 500 + 2000.LinRand0), 0) *
		LfPulse(3 / (1 + 8.Rand0), 0, 0.2 + 0.3.Rand0) * 0.04,
		1.Rand2)
}.overlap(8, 4, n)

(* ---- alien froggies ; texture ; Jmcc *)
let rate = 11;
{ :rep |
	rate := (rate * (0.2.BiLinRand.Exp)).Fold(1, 30);
	Formant(rate, ExpRand(200, 3000), 9.Rand0 * rate + rate) * 0.05
}.overlap(0.5, 0.25, 5)

(* ---- random sine waves ; texture ; Jmcc *)
let n = 12; (* number of simultaneous events *)
let env = EnvLinen(2, 5, 2, 1, -4);
{
	EqPan2(
		SinOsc(2000.Rand0, 0) * EnvGen(1, 0.02, 0, 1, 2, env.asArray),
		1.Rand2)
}.spawn(9 / n)

(* ---- random pulsations ; texture ; Jmcc *)
let n = 8; (* number of simultaneous events *)
let env = EnvLinen(2, 5, 2, 0.02, -4);
{
	EqPan2(
		(SinOsc(2000.Rand0, 0) * EnvGen(1, 1, 0, 1, 2, env.asArray)).AmClip(SinOsc(8 + 80.LinRand0, 0)),
		SinOsc(0.3 + 0.5.Rand0, 2.pi.Rand0) * 0.7)
}.spawn(9 / n)

(* --- tremulate ; texture ; Jmcc *)
{
	let f = 500 + 400.Rand0;
	let r = 30 + 60.Rand0;
	Mix(
		EqPan2(
			(* just minor seventh chord *)
			SinOsc(f * [1, 1.2, 1.5, 1.8], 0) * Max(0, LfNoise2([r, r, r, r]) * 0.1),
			[1.Rand2, 1.Rand2, 1.Rand2, 1.Rand2]
		)
	).CombN(0.1, 0.1, 1)
}.xfade(2, 0.5)

(* ---- textures *)

(* rocks on rails *)
let p = 20; (* number of partials *)
let n = 4; (* number of overlapping events *)
Texture.overlap({
	Pan2(
		Klank( (* p resonant modes *)
			`[ (* filter bank specification array: *)
				Array.fill(p, { 200 + 3000.0.linrand }), (* resonant frequencie *)s
				nil, (* amplitudes default to 1.0 *)
				Array.fill(p, { 0.2 + 1.0.rand }) (* ring times *)
			],
			Resonz(
				Dust(100, 0.04), (* excitation *)
				XLine(3000, 300, 8), (* sweep filter down *)
				0.2 (* band width ratio *)
			)
		),
		Line(1.0.rand2, 1.0.rand2, 8) (* sweep pan *)
	)
}, 2, 3, n, 2)

(* bouncing lightbulbs, pencils, cans, and other assorted objects *)
let e = Env.new([1, 1, 0], [3, 0.001]); (* 3 second cut off envelope to end sound *)
Texture.spawn({
	Pan2(
		Klank( (* resonant filter bank simulates resonant modes of bouncing objects *)
			`[
				Array.fill(4, { 400 + 8000.0.rand }), (* resonant freqs *)
				Array.fill(4, { 1.0.rand }), (* amplitudes *)
				Array.fill(4, { 0.01 + 0.1.rand }) (* ring times *)
			],
			Decay( (* decays excite filter bank, each impulse triggers a decay *)
				Impulse( (* impulses trigger decay envelope *)
					XLine(5 + 2.0.rand2, 600, 4), 0, (* accellerating frequency *)
					XLine(0.09, 0.000009, 4) (* decaying impulse amplitude *)
				),
				0.001 (* decay time - very short *)
			)
		),
		1.0.rand2 (* place each bouncer at a random position in the stereo field *)
	)
	* (* multiply by an envelope is necessary to make the sound end *)
	EnvGen(e, doneAction:2)
}, 2, { 0.6 + 0.6.rand })

(* Klang - Lots-o-sines *)
let n = 60; (* n sines in each channel (twice as many during cross-fade) *)
Texture.xfade({
	let z = [`[Array.fill(n, { 40 + 10000.0.linrand} ), nil, nil],
		`[Array.fill(n, { 40 + 10000.0.linrand} ), nil, nil]
	];
	Klang(z, 1, 0) * 0.1/n;
}, 4, 4, 2)

(* clustered sines *)
let n = 80;
Texture.xfade({
	let f1 = 100 + 1000.0.rand;
	let f2 = 4.0 * f1;
	let z = Array.fill(2, {
		let y = Array.fill(n, { f1 + f2.rand} );
		`[ (* sine oscil bank specification *)
			y, (* frequencies *)
			f1 / y, (* amplitudes *)
			nil (* phases default to zero *)
		]
	});
	Klang(z, 1, 0) * (0.3/n);
}, 4, 4, 2)

(* Klank - bank of resonators excited by impulses *)
let n = 5; (* number of simultaneous instruments *)
let p = 15; (* number of partials per instrument *)
Texture.overlap({
	let z = `[ (* filter bank specification *)
		Array.fill(p, { 80 + 10000.0.linrand} ), (* frequencies *)
		Array.fill(p, { 1.0.rand2 }), (* amplitudes *)
		Array.fill(p, { 0.2 + 8.0.rand } ) (* ring times *)
	];
	Pan2(
		Klank(z, Dust(0.7, 0.04)),
		1.0.rand2
	)
}, 6, 6, n, 2)

(* Klank - excited by noise bursts *)
let n = 5; (* number of simultaneous instruments *)
let p = 8; (* number of partials per instrument *)
Texture.overlap({
	let exciter = Decay(Dust(0.6, 0.001), 3.1, WhiteNoise);
	let spec = Array.fill(2, {
		`[
			Array.fill(p, { 80 + 10000.0.linrand} ),
			nil,
			Array.fill(p, { 0.2 + 4.0.rand } )
		]
	});
	Klank(spec, exciter)
}, 8, 8, n, 2)

(* resonators at random frequencies excited by BrownNoise *)
let p = 32; (* number of partials per channel *)
Texture.xfade({
	let noise = BrownNoise(0.001);
	let spec = Array.fill(2, {
		`[
			Array.fill(p, { 80 + 10000.0.linrand} ),
			Array.fill(p, { 1.0.rand2 }), (* amplitudes *)
			Array.fill(p, { 0.5 + 2.0.rand } )
		]
	});
	Klank(spec, noise)
}, 6, 6, 2)

(* resonators tuned in a harmonic series with pitch ratios from a just scale *)
let p = 12; (* number of overtones *)
Texture.xfade({
	let noise = BrownNoise(0.001);
	let freq = [1.0, 1.125, 1.25, 1.333, 1.5, 1.667, 1.875, 2.0, (* a list representing a just diatonic scale expressed as ratios. *)
		2.25, 2.5, 2.667, 3.0, 3.333, 3.75, 4.0].choose * 120.0; (* one value is chosen at random and multiplied by a 120 Hz fundamental *)
	let spec = Array.fill(2, {
		`[ (* filter bank specification *)
			Array.series(p, freq, freq ) + Array.fill(p, { 0.5.rand2 }),
			Array.fill(p, { arg i; 1/(i+1) }),
			Array.fill(p, { 0.5 + 4.0.rand } )
		]
	});
	Klank(spec, noise)
}, 1, 7, 2)

(* similar to above, but tuned to odd harmonics only, shorter ring times, *)
(* and using a different noise source *)
let p = 12; (* number of overtones *)
Texture.xfade({
	let noise = LfNoise2(8000, 0.004);
	let freq = [1.0, 1.125, 1.25, 1.333, 1.5, 1.667, 1.875, 2.0, (* a list representing a just diatonic scale expressed as ratios. *)
		2.25, 2.5, 2.667, 3.0, 3.333, 3.75, 4.0].choose * 120.0; (* one value is chosen at random and multiplied by a 120 Hz fundamental *)
	let spec = Array.fill(2, {
		`[
			Array.series(p, freq, 2*freq ) + Array.fill(p, { 0.5.rand2 }),
			Array.fill(p, { arg i; 1/(i+1) }),
			Array.fill(p, { 0.2 + 0.8.rand } )
		]
	});
	Klank(spec, noise)
}, 1, 7, 2)

(* swept resonant noise band exciting a resonator bank *)
let n = 5; (* number of sweepers *)
let p = 10; (* number of partials *)
Texture.overlap({
	let sweep = Resonz(
		WhiteNoise(0.007),
		SinOsc(0.1 + 0.2.rand, 0, 12 + 12.rand2, 60 + 24.rand2).midicps,
		0.1);
	let spec = Array.fill(2, {
		`[
			Array.fill(p, { 80 + 10000.0.linrand} ),
			nil,
			Array.fill(p, { 0.5 + 2.0.rand } )
		]
	});
	Klank(spec, sweep)
}, 4, 4, n, 2)

(* coolant *)
let p = 10; (* number of partials per channel *)
Texture.xfade({
	Klank(
		[
			`[Array.fill(p, { 40 + 2000.0.rand }), nil, nil],
			`[Array.fill(p, { 40 + 2000.0.rand }), nil, nil]
		],
		OnePole(
			BrownNoise(2) * 0.002),
			0.95
		)
	)
}, 4, 4, 2)

(* narrow band filtered Crackle noise *)
let e = Env.linen(2, 5, 2);
Texture.spawn({
	let rf = 2000.0.rand + 80;
	let rf2 = rf + (0.2.rand2 * rf);
	Pan2(
		Resonz(Crackle(1.97 + 0.03.rand) * 0.15, XLine(rf, rf2, 9), 0.2
		), 1.0.rand2, EnvGen(e, doneAction:2))
}, 2, 1)

(* resonant dust *)
let e = Env.linen(2, 5, 2);
Texture.spawn({
	let rf = 2000.0.rand + 80;
	let rf2 = rf + (0.5.rand2 * rf);
	Pan2(EnvGen(e, doneAction:2) *
		Resonz(Dust(50 + 800.rand, 0.3), XLine(rf, rf2, 9), 0.1)
		, 1.0.rand2)
}, 2, 1)

(* uplink *)
let n = 5;
Texture.overlap({
	let freq = LfPulse(20.0.rand, 0, 1.0.rand,
		LfPulse(4.0.rand, 0, 1.0.rand, 8000.rand, 2000.rand));
	freq = freq + LfPulse(20.0.rand, 0, 1.0.rand,
		LfPulse(4.0.rand, 0, 1.0.rand, 8000.rand, 2000.rand));
	Pan2(LfPulse(freq, 0, 0.5, 0.04), 0.8.rand2)
}, 4, 1, n, 2)

(* data space *)
let n = 4;
Texture.overlap({
	let freq = [
		LfPulse(200.0.rand, 0, 1.0.rand, LfPulse(40.0.rand, 0, 1.0.rand, 8000.rand, 2000.rand)),
		LfPulse(20.0.rand, 0, 1.0.rand, LfPulse(4.0.rand, 0, 1.0.rand, 8000.rand, 2000.rand)),
		LfPulse(20.0.rand, 0, 1.0.rand, LfPulse(4.0.rand, 0, 1.0.rand, 8000.rand, 2000.rand))
	].sum;
	let dtime = 0.25.rand + 0.1;
	CombL(Pan2(LfPulse(freq, 0, 0.5, 0.04), LfNoise0(3.0.rand, 0.8)), dtime, dtime, 3)
}, 6, 1, n, 2)

(* cymbalism *)
let p = 15; (* number of partials per channel per 'cymbal'. *)
Texture.xfade({
	let f1 = 500 + 2000.0.rand;
	let f2 = 8000.0.rand;
	let z = Array.fill(2, {
		`[ (* sine oscil bank specification *)
			Array.fill(p, { f1 + f2.rand} ), (* frequencies *)
			nil, (* amplitudes default to 1.0 *)
			Array.fill(p, { 1.0 + 4.0.rand }) (* ring times *)
		]
	});
	Klank(z, Decay(Impulse(3.0.rand + 0.5), 0.004, WhiteNoise(0.03)));
}, 4, 4, 2)

(* cymbalism accellerando *)
let p = 15; (* number of partials per channel per 'cymbal'. *)
Texture.xfade({
	let f1 = 500 + 2000.0.rand;
	let f2 = 8000.0.rand;
	let z = Array.fill(2, {
		`[ (* sine oscil bank specification *)
			Array.fill(p, { f1 + f2.rand} ), (* frequencies *)
			nil, (* amplitudes default to 1.0 *)
			Array.fill(p, { 1.0 + 4.0.rand }) (* ring times *)
		]
	});
	Klank(z, Decay(Impulse(XLine(4.0.linrand + 0.5, 35.0.rand + 0.5, 12)), 0.004,
		WhiteNoise(0.03)));
}, 4, 4, 2)

(* ring modulated Klank *)
let n = 4; (* overlap *)
let p = 8; (* number of partials *)
Texture.overlap({
	let a = Klank(`[Array.rand(p, 100, 10000), nil, Array.rand(p, 0.2, 1.0)],
		Dust(20, 0.02));
	Pan2(SinOsc(LfNoise2(1.0 + 0.3.rand2, 200, 350 + 50.rand), 0, a), 1.0.rand2);
}, 4, 4, 4, 2)

(* analogue daze (commented) ; Jmcc *)
(* define a function so that I can make a couple of copies of this instrument: *)
let anaSynFunc = { :octave :clockRate :pwmrate :fltrate |
	(* create a list of frequencies *)
	let freqList = (
		[55, 63, 60, 63, 57, 65, 62, 65] (* specify in MIDI notes *)
		+ (12 * octave) (* offset by octaves argument *)
	).MidiCps; (* convert to cycles per second *)
	(* use a sequencer to step through the list of frequencies *)
	let freq = Sequencer(
		freqList,
		Impulse(clockRate, 0) (* sequencer steps at each trigger from this oscillator *)
	);
	(* analog VCO->VCF voice: *)
	Rlpf((* resonant lowpass filter *)
		LfPulse((* pulse wave oscillator input to filter *)
			Lag((* take the frequency and use a lag filter to make it glide *)
				freq, (* from one pitch to another *)
				0.05(* Lag time *)
			), 0,
			SinOsc((* pulse width modulator LfO *)
				pwmrate, (* LfO rate *)
				2.pi.Rand0).MulAdd( (* random initial phase *)
					0.4, 0.5)) (* scale and offset give pulse widths from 0.1 to 0.9 *)
		* 0.1, (* pulse oscillator amplitude *)
		SinOsc((* filter cutoff freq LfO *)
			fltrate, (* LfO rate *)
			2.pi.Rand0).MulAdd( (* random initial phase *)
				1400, 2000), (* scale and offset give cutoff freq from 600 to 3400 Hz *)
		1/15 (* 1/Q *)
	)
}; (* end of function definition f *)
(* analogue snare drum *)
let snare = Decay((* an exponential decay envelope *)
	Impulse(2, 0), (* impulses trigger envelope at 2 beats per second *)
	0.15) * (* 0.15 seconds to decay by 60 dB *)
LfNoise0((* step noise used as snare sound *)
	LfNoise1(0.3).MulAdd(6000, 8000)) * (* sweep the noise frequency between 2000 and 14000 Hz *)
[0.07, 0.07] (* amplitude (in stereo, causes whole snare subpatch to be stereo *)
(*               see MultiChannel.help) *)
;
(* create two copies of sequencer patch in separate channels *)
let g = [ (* call function f to create each instrument *)
	anaSynFunc(1, 8, 0.31, 0.2), (* +1 octave,  8 clocks per second, PWM rate, Rlpf rate *)
	anaSynFunc(0, 2, 0.13, 0.11) (* +0 octaves, 2 clocks per second, PWM rate, Rlpf rate *)
]
+ snare; (* add to snares *)
(* comb delay of input plus dry stereo pair reversed *)
let z = 0.4 * ((* scale delayed part down *)
	CombN((* feedback delay *)
		g, (* input dry signal *)
		0.375, 0.375, (* 3/8 second delay *)
		5(* 5 second 60dB decay time *)
	)
	+ g.reverse); (* add dry stereo pair with the channels reversed *)
let e = EnvLinen(2, 56, 2, 1, -4); (* one minute trapezoid envelope *)
z * EnvGen(1, 1, 0, 1, 2, e.asArray) (* wrap a one minute envelope around entire sound *)

(* analogue daze (un-commented) ; Jmcc *)
let pattern = [55 63 60 63 57 65 62 65];
let f = { :octave :clockRate :pwmrate :fltrate |
	Rlpf(LfPulse(Lag(
		Sequencer(
			((pattern + (12 * octave)).MidiCps), (* sequencer pattern *)
			Impulse(clockRate, 0) (* sequencer trigger *)
		),
		0.05 (* Lag time coefficient *)
	), 0,
		SinOsc(pwmrate, 2.pi.Rand0).MulAdd(0.4, 0.5)) * (* pulse width modulator *)
		0.1, (* pulse amplitude *)
		SinOsc(fltrate, 2.pi.Rand0).MulAdd(1400, 2000), (* cutoff freq LfO *)
		1 / 15)
};
let x = Decay(Impulse(2, 0), 0.15) * LfNoise0(LfNoise1(0.3).MulAdd(6000, 8000)) * [0.07, 0.07];
let g = [f(1, 8, 0.31, 0.2), f(0, 2, 0.13, 0.11)] + x;
let z = 0.4 * (CombN(g, 0.375, 0.375, 5) + g.reverse);
let e = EnvLinen(2, 56, 2, 1, -4); (* one minute trapezoid envelope *)
z * EnvGen(1, 1, 0, 1, 2, e.asArray) (* wrap a one minute envelope around entire sound *)

(* synthetic piano ; Jmcc *)
let n = 6; (* number of keys playing *)
{ (* mix an array of notes *)
	let pitch = (36 + 54.Rand0); (* calculate delay based on a random note *)
	let strike = Impulse(0.1 + 0.4.Rand0, 0) * 0.1; (* random period for each key *)
	let hammerEnv = Decay2(strike, 0.008, 0.04); (* excitation envelope *)
	EqPan2(
		(* array of 3 strings per note *)
		(1 .. 3).collect { :i |
			(* detune strings, calculate delay time *)
			let detune = [-0.05, 0, 0.04].at(i);
			let delayTime = 1 / (pitch + detune).MidiCps;
			(* each string gets own exciter *)
			let hammer = LfNoise2(3000) * hammerEnv; (* 3000 Hz was chosen by ear *)
			CombL(hammer, (* used as a string resonator *)
				delayTime, (* max delay time *)
				delayTime, (* actual delay time *)
				6) (* decay time of string *)
		},
		(pitch - 36) / 27 - 1 (* pan position: lo notes left, hi notes right *)
	).sum
} !> n

(* reverberated sine percussion jmc *)
{
	let d = 10; (* number of percolators *)
	let c = 7; (* number of comb delays *)
	let a = 4; (* number of allpass delays *)
	(* sine percolation sound *)
	let s = Mix(Array.fill(d, { Resonz(Dust(2/d, 50), 200 + 3000.0.rand, 0.003)}) );
	(* reverb predelay time *)
	let z = DelayN(s, 0.048);
	(* 7 length modulated comb delays in parallel *)
	let y = Mix(CombL(z, 0.1, LfNoise1(Array.fill(c, {0.1.rand}), 0.04, 0.05), 15));
	(* chain of 4 allpass delays on each of two channels (8 total) *)
	a.do({ y = AllpassN(y, 0.050, [0.050.rand, 0.050.rand], 1) });
	(* add original sound to reverb and play it *)
	s+(0.2*y)
}

(* reverberated noise bursts ; Jmcc *)
{
	(* pink noise percussion sound *)
	let s = Decay(Dust(0.6, 0.2), 0.15, PinkNoise);
	(* reverb predelay time *)
	let z = DelayN(s, 0.048);
	(* 6 modulated comb delays in parallel *)
	let y = Mix(CombL(z, 0.1, LfNoise1(Array.fill(6, {0.1.rand}), 0.04, 0.05), 15));
	(* chain of 4 allpass delays on each of two channels (8 total) *)
	4.do({ y = AllpassN(y, 0.050, [0.050.rand, 0.050.rand], 1) });
	(* add original sound to reverb and play it *)
	s+y
}

(* Mouse control ; Jmcc *)
{
	SinOsc(MouseX(200, 2000, 'exponential'), 0, 0.1)
}

(* analog bubbles - with mouse control ; Jmcc *)
{
	let freq = LfSaw(
		MouseY(0.1, 10, 'exponential'), 0, (* lfo 1 rate *)
		24, (* lfo 1 depth in semitones *)
		(* lfo 2 in lfo 1's add input *)
		LfSaw(
			MouseX(2, 40, 'exponential'), 0, (* lfo 2 rate *)
			-3, 80(* lfo 2 depth & offset in semitones *)
		)
	).midicps; (* convert to frequency *)
	CombN(SinOsc(freq, 0, 0.04), 0.2, 0.2, 2) (* echoing sine wave *)
}

(*----- textures *)

(
(* native algorhythms *)
let imp_seq = {arg s, tr; Demand(tr, 0, s) * tr};
let n = 8; (* n = number of partials for percussion instruments *)
Texture.overlap({ (* make an overlapping texture *)
	(* create an algorhythmic rhythm pattern *)
	let pat = Drand([ (* choose one of the following patterns at random *)
		Dseq([2.0, 0.0, 2.0, 0.0, 1.0, 0.0, 1.0, 1.0], 1),
		Dseq([2.0, 0.0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.0], 1),
		Dseq([2.0, 0.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.0], 1),
		Dseq([2.0, 0.3, 0.3, 1.0, 0.3, 0.3, 1.0, 0.3], 1),
		Dseq([2.0, 0.0, 0.3, 0.0, 0.3, 0.0, 0.3, 0.0], 1),
		Dseq([2.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0], 1),
		Dseq([2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], 1),
		Dseq([0.0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.0, 1.0], 1),
		Dseq([1.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 0.0,
			0.0, 1.0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.0], 1)
	], inf);
	let freq = 40 + 300.0.rand; (* random base frequency *)
	let seq = imp_seq.value((* outputs a sequence of single sample triggers *)
		pat,
		Impulse(10) (* a clock for the sequencer at 10 beats per second *)
	);
	let excitation = Decay( (* a decaying envelope for the noise *)
		seq, (* impulse sequence triggers decay envelopes *)
		0.1, (* 60 dB decay time *)
		PinkNoise(0.01) (* noise is the exciter *)
	);
	let resonator = Klank( (* use Klank as a percussion resonator *)
		`[ (* filter bank specification array: *)
			Array.fill(n, { freq + (4.0*freq).linrand }), (* resonant frequencies *)
			nil, (* amplitudes default to 1.0 *)
			Array.fill(n, { 0.2 + 3.0.linrand }) (* ring times *)
		],
		excitation
	);
	Pan2(resonator, 1.0.rand2) (* random pan position *)
	(* return the Pan2 *)
}, 8, 4, 4, 2); (* sustainTime, fadeTime, overlapDensity, number of channels *)
)

(*----- drawings *)

(
(* this shows the piano excitation function used above *)
plot({
	let strike, env, noise;
	strike = Impulse(0.01);
	env = Decay2(strike, 0.008, 0.04);
	noise = LfNoise2(3000, env * 2);
	[K2A(env), noise]
}, 0.04);
)

(* Berlin 1977 ; mouse x controls clock rate ; Jmcc *)
{
	let sequ = {arg s, tr; Demand(tr, 0, Dseq(inf, s))};
	let sequR = {arg s, tr; Demand(tr, 0, Dshuf(s, inf))}; (* sequ with random selection function *)
	let patternList, clockRate, clockTime, clock, note, freq, amp, filt;
	clockRate = MouseX(5, 20);
	clockTime = clockRate.reciprocal;
	clock = Impulse(clockRate); (* sequencer trigger *)
	patternList = [55, 60, 63, 62, 60, 67, 63, 58];
	note = sequ.value( patternList, clock ); (* midi note pattern sequencer *)
	(* every 16 beats transpose somewhat randomly *)
	note = sequR.value(
		[-12, -7, -5, 0, 2, 5], (* function called at each trigger *)
		PulseDivider(clock, 16)) (* divide clock by 16 *)
	+
	note; (* add transpose to note *)
	freq = note.midicps; (* convert midi note to cycles per second *)
	(* amplitude envelope *)
	amp = Decay2(clock, 0.05 * clockTime, 2 * clockTime, 0.1, 0.02);
	(* filter envelope scaled by LfO *)
	filt = Decay2(clock, 0.05 * clockTime, 2 * clockTime, SinOsc(0.17, 0, 800), 1400);
	CombN(
		Rlpf(
			LfPulse((* for better quality replace 'LfPulse' with 'Pulse' *)
				freq, 0,
				SinOsc(0.08, [0, 0.5.pi], 0.45, 0.5), (* pulse width LfO(s) *)
				amp
			),
			filt,
			0.15(* 1/Q *)
		),
		0.2, [0.2, 0.17], 1.5(* max delay, actual delay(s), decay time *)
	)
}

(* metal plate ;  mouse x controls damping, mouse y controls excitation ; Jmcc *)
{
	let n = 4; (* number of delay lines *)
	let maxdt = 48000 * 0.03; (* maximum delay time -- Server.default.sampleRate *)
	(* allocate buffers for the delay lines *)
	let buffers = Array.fill(n, {LocalBuf.newFrom(Array.fill(maxdt, 0))});
	(* assign random tap times *)
	let tapTimes = Array.rand(n, 0.015, 0.03);
	(* excitation *)
	let excitation = Decay2(Impulse(0.5, 0, 0.2), 0.01, 0.2, LfNoise2(MouseY(10, 8000)));
	(* tap the delay lines *)
	let delayedSignals = n.collect({arg i; Tap(buffers[i], 1, tapTimes[i])});
	(* filter the taps *)
	let filteredDelays = LPF(delayedSignals, MouseX(10, 5000), 0.98);
	(* write to delay lines *)
	n.do({arg i; RecordBuf(filteredDelays[i] + excitation, buffers[i])}); (* write the mixed signal to the delay line *)
	Mix(filteredDelays); (* mix 5 channels to one *)
}

(* Griot modeling ; mouse x controls damping, mouse y controls excitation ; Jmcc *)
{
	let maxdt = 48000 * 0.03; (* maximum delay time - Server.default.sampleRate *)
	let n = 5; (* number of delay lines *)
	(* allocate buffers for the delay lines *)
	let buffers = Array.fill(n, {LocalBuf.newFrom(Array.fill(maxdt, 0))});
	(* assign tap times which determine the string pitches *)
	let tapTimes = Array.series(n, 0.003, 0.0005);
	(* excitation (simplified!) *)
	let env = Env.new([0, 1, 0], [0.01, 0.2], -2);
	let excitation = n.collect({
		arg i;
		LfNoise2(MouseY(10, 10000), EnvGen(env, Impulse(n, 0), levelScale:0.1.rand)) *
		((Demand(Impulse(n, 0), 0, Dbrown(0, n-1, 1, inf)) - i).abs < 1);
	});
	(* tap the delay lines *)
	let delayedSignals = n.collect({arg i; Tap(buffers[i], 1, tapTimes[i])});
	(* filter the taps *)
	let filteredDelays = LPF(delayedSignals, MouseX(10, 10000), 0.98);
	(* write to delay lines *)
	n.do({arg i; RecordBuf(filteredDelays[i] + excitation[i], buffers[i])});
	Mix(filteredDelays).dup; (* mix 5 channels to one *)
}

(* sample and hold liquidities ; mouse x controls clock rate, mouse y controls center frequency ; Jmcc *)
{
	let clockRate, clockTime, clock, centerFreq, freq, panPos, patch;
	clockRate = MouseX(1, 200, 'exponential');
	clockTime = clockRate.reciprocal;
	clock = Impulse(clockRate, 0.4);
	centerFreq = MouseY(100, 8000, 'exponential');
	freq = Latch(WhiteNoise(centerFreq * 0.5, centerFreq), clock);
	panPos = Latch(WhiteNoise, clock);
	patch = CombN(
		Pan2(
			SinOsc(
				freq,
				0,
				Decay2(clock, 0.1 * clockTime, 0.9 * clockTime)
			),
			panPos
		),
		0.3, 0.3, 2
	);
	patch
}

(*---- textures *)

(* random panning sines *)
(
let n = 8;
Texture.xfade({
	Mix(Array.fill(n, {
		Pan2(
			SinOsc(80 + 2000.0.linrand),
			LfNoise1(0.4 + 0.8.rand),
			LfNoise1(0.4 + 0.8.rand, 0.4, 0.5)
		)
	})) * (0.4 / n);
}, 8, 8, 2);
)

(* input thru *)
{ SoundIn([0, 1]) }

(* distort input *)
{
	let gain;
	gain = MouseX(1, 100, 'exponential'); (* mouse x controls gain into distortion *)
	SoundIn([0, 1], gain).distort * 0.4
}

(* ring modulate input *)
{
	let input, modulator;
	input = SoundIn([0, 1]);
	modulator = SinOsc(
		MouseX(10, 4000, 'exponential'), (* mouse x controls ring mod freq *)
		[0, 0.5.pi] (* offset phase ofone osc by 90 degrees *)
	);
	input * modulator
}

(* ring modulate input using ring1 *)
{
	let input, modulator;
	input = SoundIn([0, 1], 0.5);
	modulator = SinOsc(
		MouseX(10, 4000, 'exponential'), (* mouse x controls ring mod freq *)
		[0, 0.5.pi] (* offset phase ofone osc by 90 degrees *)
	);
	input ring1: modulator
}

(* filter the input *)
{
	let rQ;
	rQ = MouseY(0.01, 1, 'exponential'); (* bandwidth ratio = 1/Q *)
	Rlpf(
		SoundIn([0, 1], 0.4 * rQ.sqrt), (* attenuate to offset resonance *)
		MouseX(100, 12000, 'exponential'), (* mouse x controls cutoff freq *)
		rQ
	)
}

(* input limiter *)
{
	CompanderD(
		SoundIn([0, 1]),
		MouseX(0.01, 0.5), (* threshold *)
		1, (* below threshold slope *)
		0.1(* above threshold slope *)
	)
}

(* input noise gate *)
{
	let input;
	input = SoundIn([0, 1]);
	Compander(
		input, input,
		MouseX(0.01, 0.5), (* threshold *)
		10, (* below threshold slope *)
		1(* above threshold slope *)
	)
}

(* pitch shift input *)
{
	PitchShift(
		SoundIn([0, 1], 0.5), (* stereo audio input *)
		0.04, (* grain size *)
		MouseX(0, 2), (* mouse x controls pitch shift ratio *)
		0, (* pitch dispersion *)
		0.004(* time dispersion *)
	)
}

(* use PitchShift to granulate input ; upper left corner is normal playback. x = pitch dispersion, y = time dispersion *)
{
	let grainSize;
	grainSize = 0.1;
	PitchShift(
		SoundIn([0, 1], 0.5),
		grainSize,
		1, (* nominal pitch rate = 1 *)
		MouseX(0, 1), (* pitch dispersion *)
		MouseY(0, grainSize) (* time dispersion *)
	)
}

(* echo input *)
{
	let in;
	in = SoundIn([0, 1], 0.1);
	CombL(
		in,
		0.5, (* max delay time *)
		MouseX(0, 0.5), (* mouse x controls delay time *)
		4, (* echo 60 dB decay time in seconds *)
		1, (* scale by unity *)
		in(* mix with input *)
	)
}

(* Ring modulate & echo input ; Jmc *)
let in = AudioIn([1, 2]) * 0.4 * SinOsc(MouseX(10, 2000, 1, 0.2), [0, 0.5.pi]);
CombL(
	in,
	0.5,
	MouseY(0, 0.5, 0, 0.2), (* mouse y controls delay time *)
	4 (* echo 60 dB decay time in seconds *)
) + in (* mix with input *)

(* Ring modulated and resonant filtered input ; Jmcc *)
let input = AudioIn([1, 2]) * 0.2;
let modulator = SinOsc(
	MouseX(10, 4000, 1, 0.2), (* mouse x controls ring mod freq *)
	[0, 0.5.pi] (* offset phase ofone osc by 90 degrees *)
);
Rlpf(
	input * modulator, (* do ring modulation *)
	MouseY(100, 12000, 1, 0.2), (* mouse y controls cutoff freq *)
	0.1) (* bandwidth ratio = 1/Q *)

(* Distort, ring modulate & echo input, a real noise fest ; Jmcc *)
let in = (AudioIn([1, 2]) * 20).Distort.Ring1(
	SinOsc(MouseX(10, 2000, 1, 0.2), [0, 0.5.pi])
) * 0.02;
CombL(
	in,
	0.5,
	MouseY(0, 0.5, 0, 0.2), (* mouse y controls delay time *)
	4
) + in

(* Sweep verb ; Jmcc *)
let s = AudioIn([1, 2]) * 0.01;
(* reverb predelay time *)
let z = DelayN(s.Sum, 0.048, 0.048);
(* 6 modulated comb delays in parallel *)
let y = CombL(z, 0.1, LfNoise1({ 0.1.Rand0 } ! 6).MulAdd(0.04, 0.05), 15).Sum;
(* chain of 4 allpass delays on each of two channels (8 total) *)
4.timesRepeat {
	y := AllpassN(y, 0.050, [0.050.Rand0, 0.050.Rand0], 1)
};
(* eliminate DC *)
LeakDc(y, 0.995)

(* Monastic resonance ; mouse controls size and reverb time ; Jmcc *)
let decayTime = MouseX(0, 16, 0, 0.2);
let delayScale = MouseY(0.01, 1, 0, 0.2);
let s = AudioIn([1, 2]) * 0.005;
(* reverb predelay time *)
let z = DelayN(Sum(s), 0.048, 0.048);
(* 8 comb delays in parallel *)
let y = Sum(CombL(z, 0.1, { 0.04.Rand2 + 0.05 } ! 8 * delayScale, decayTime));
(* chain of 5 allpass delays on each of two channels (10 total) *)
5.timesRepeat {
	y := AllpassN(y, 0.050, [0.050.Rand0, 0.050.Rand0], 1)
};
(* eliminate DC *)
LeakDc(y, 0.995)

(*---- ; untranslated *)

(* UNTRANS - loop recorder - previous delay contents are ducked when there is new input *)

(* Sweepy noise ; mouse controls lfo ; Jmcc *)
let lfoDepth = MouseY(200, 8000, 2, 0.2);
let lfoRate = MouseX(4, 60, 2, 0.2);
let freq = LfSaw(lfoRate, 0).MulAdd(lfoDepth, lfoDepth * 1.2);
let filtered = Rlpf(WhiteNoise(2) * 0.03, freq, 0.1);
CombN(filtered, 0.3, 0.3, 2) + filtered

(* noise burst sweep ; Jmcc *)
let lfoRate, amp, cfreq, filt;
lfoRate = MouseX(10, 60, 2);
amp = max(0, LfSaw(lfoRate, -1));
cfreq = MouseY(400, 8000, 2);
cfreq = SinOsc(0.2, 0, cfreq, 1.05 * cfreq);
Resonz(WhiteNoise(amp), cfreq, 0.1)

(*---- textures *)

(* string wander-cluster *)
(
let n, t, t3, note, delay;
n = 6;
t = 4;
t3 = t / 3;
note = 50 + 50.rand;
Texture.overlap({
	note = (note + 15.rand - 7).fold(50, 120);
	delay = 1/note.midicps;
	Pan2(CombC(WhiteNoise(0.008), 0.01, delay, delay * 1000), 1.0.rand2)
}, t3, t3, n, 2)
)

(* string wander-cluster with vibrato *)
(
let n, t, t3, note, freq, delay, decayTime;
n = 6;
t = 4;
t3 = t / 3;
note = 60 + 50.rand;
Texture.overlap({
	note = (note + 15.rand - 7).fold(60, 110);
	freq = note.midicps;
	decayTime = 1/freq * 1000;
	freq = SinOsc(4 + 4.0.rand, 0, 0.01 * freq, freq);
	delay = 1/freq;
	Pan2(CombC(WhiteNoise(0.008), 0.01, delay, decayTime), 1.0.rand2)
}, t3, t3, n, 2)
)

(* pipe wander-cluster *)
(
let n, t, t3, note, delay;
n = 6;
t = 4;
t3 = t / 3;
note = 80 + 40.rand;
Texture.overlap({
	note = (note + 15.rand - 7).fold(80, 120);
	delay = 1/note.midicps;
	Pan2(CombL(LPZ2(WhiteNoise(0.01)), 0.01, delay, -0.4), 1.0.rand2)
}, t3, t3, n, 2)
)

(* comb delay sweeps *)
(
let n, t, t3, note, endNote, noteSweep;
n = 6;
t = 4;
t3 = t / 3;
note = 50 + 70.rand;
endNote = (note + 15.rand - 7).fold(50, 120);
Texture.overlap({
	note = (note + 15.rand - 7).fold(50, 120);
	endNote = (endNote + 15.rand - 7).fold(50, 120);
	noteSweep = Line(note, endNote, t);
	Pan2(
		CombC(WhiteNoise(0.005), 0.01, 1/noteSweep.midicps, 1/note.midicps * 1000),
		1.0.rand2
	)
}, t3, t3, n, 2)
)

(* repeating harmonic Klank *)
(
let n, p;
n = 4; (* number of simultaneous events *)
p = 8; (* number of partials per channel *)
Texture.overlap({
	s = Decay(Dust(0.8, 0.01), 3.4, LfSaw(40.0.linrand));
	f = [400, 500, 600, 700, 800, 900, 1000, 1200, 1400, 1500, 1600].choose;
	[
		(z = Array.fill(p, { f * (12.rand + 1) } );
			y = Array.fill(p, { 3.0.rand + 0.4 } );
			Klank(`[z, nil, y], s))
		,
		(z = Array.fill(p, { f * (12.rand + 1) } );
			y = Array.fill(p, { 3.0.rand + 0.4 } );
			Klank(`[z, nil, y], s))
	];
}, 8, 2, n, 2)
)

(* repeating inharmonic Klank *)
(
let n, p;
n = 4; (* number of simultaneous events *)
p = 8; (* number of partials per channel *)
Texture.overlap({
	s = Decay(Dust(0.8, 0.004), 3.4, LfSaw(40.0.linrand));
	[
		(z = Array.fill(p, { 80 + 10000.0.linrand} );
			y = Array.fill(p, { 4.0.rand + 0.4 } );
			Klank(`[z, nil, y], s))
		,
		(z = Array.fill(p, { 80 + 10000.0.linrand} );
			y = Array.fill(p, { 4.0.rand + 0.4 } );
			Klank(`[z, nil, y], s))
	];
}, 8, 8, n, 2);
)

(* saucer base *)
(
let n = 4; (* number of simultaneous events *)
Texture.overlap({
	let a, b, c, pan;
	a = 20.0.rand;
	b = 1000.0.rand;
	c = 5000.0.rand;
	pan = 1.0.rand2;
	Pan2(SinOsc(SinOsc(SinOsc(a, 0, b, 1.1*b), 0, c, 1.1*c), 0, 0.1), pan)
}, 6, 2, n, 2)
)

(* alien meadow *)
(
let n = 6; (* number of simultaneous events *)
Texture.overlap({
	let a, b, c, pan;
	a = 20.0.rand;
	b = 5000.0.rand;
	c = 20.0.rand;
	pan = 1.0.rand2;
	Pan2(SinOsc(SinOsc(a, 0, 0.1*b, b), 0, SinOsc(c, 0, 0.05, 0.05)), pan)
}, 6, 2, n, 2)
)

(* fast LfOs with slow beats *)
(
let n = 4; (* number of simultaneous events *)
Texture.overlap({
	let a, a0, a1, b, c, pan;
	a0 = 200.0.rand + 40;
	a1 = a0 + 1.0.rand2;
	a = [a0, a1];
	b = 2000.0.rand;
	c = [a0 + 1.0.rand2, a1 + 1.0.rand2];
	SinOsc(SinOsc(a, 0, 1.0.rand * b, b), 0, SinOsc(c, 0, 0.05, 0.05))
}, 8, 4, n, 2)
)

(* birdies *)
(
let n = 4; (* number of simultaneous event *)s
Texture.overlap({
	Pan2(SinOsc(
		Lag(LfSaw(
			LfPulse(0.4 + 1.0.rand, 0, 0.8.rand + 0.1, 3.0.rand + 4, 2)
			+ LfPulse(0.4 + 1.0.rand, 0, 0.8.rand + 0.1, 3.0.rand + 4), 0,
			(1000 + 800.rand).neg, 4000 + 1200.rand2), 0.05),
		0, Lag(LfPulse(0.5.rand + 0.2, 0, 0.4, 0.02), 0.3)), 1.0.rand2);
}, 7, 4, n, 2)
)

(* phase modulation with slow beats *)
(* mouse x controls random freq of new events *)
(* mouse y controls modulation index *)
(
let n;
n = 4; (* number of simultaneous events *)
Texture.overlap({
        let x = MouseX(100, 6000, 2);
        let y = MouseY(0, 2);
	let a = 0;
        let f1 = Rand.ir(0, x);
	3.do({
		let f2 = Rand.ir(0, x);
		a = SinOsc([f2, f2+1.0.rand2], 0, y, a);
	});
	SinOsc([f1, f1+1.0.rand2], a, 0.1)
}, 4, 4, n, 2)
)

(* hard sync sawtooth with LfO *)
(
let a, n;
n = 4; (* number of simultaneous events *)
a = Texture.overlap({
	f = (30 + 50.rand).midicps;
	SyncSaw([f, f + 0.2], SinOsc(0.2, [0, 2.pi.Rand0], 2*f, 3*f), 0.05);
}, 4, 4, n, 2);
CombN(a, 0.3, 0.3, 4, 1, a.reverse);
)

(* noise modulated sines *)
(
let a, n;
n = 4; (* number of simultaneous events *)
a = Texture.overlap({
	f = (60 + 40.rand).midicps;
	SinOsc([f, f + 0.2], 0, LfNoise2(f*[0.15, 0.16], 0.1));
}, 4, 4, n, 2);
CombN(a, 0.3, 0.3, 4, 1, a.reverse);
)

(* noise modulated sawtooths *)
(
let a, n;
n = 4; (* number of simultaneous events *)
a = Texture.overlap({
	f = (60 + 40.rand).midicps;
	LfSaw([f, f + 0.2], 0, LfNoise2(f*[0.15, 0.16], 0.1));
}, 4, 4, n, 2);
CombN(a, 0.5, 0.5, 4, 1, a.reverse);
)

(*---- ; untranslated *)

(* UNTRANS Rlpf4 - 4th order resonant lowpass filter *)

(* UNTRANS Rlpf4 - 4th order resonant lowpass filter *)

(* aleatoric quartet - mouse x controls density ; Jmcc *)
let amp, density, dmul, dadd, signal;
amp = 0.07;
density = MouseX(0.01, 1); (* mouse determines density of excitation *)
(* calculate multiply and add for excitation probability *)
dmul = density.reciprocal * 0.5 * amp;
dadd = dmul.neg + amp;
signal = Mix((* mix an array of 4 instruments *)
	Array.fill(4, {
		let excitation, freq;
		excitation = PinkNoise(
			(* if amplitude is below zero it is clipped *)
			(* density determines the probability of being above zero *)
			max(0, LfNoise1(8, dmul, dadd))
		);
		freq = Lag((* lag the pitch so it glissandos between pitches *)
			LfNoise0((* use low freq step noise as a pitch control *)
				[1, 0.5, 0.25].choose, (* choose a frequency of pitch change *)
				7, (* +/- 7 semitones *)
				66 + 30.rand2(* random center note *)
			).round(1), (* round to nearest semitone *)
			0.2(* gliss time *)
		).midicps; (* convert to hertz *)
		Pan2((* pan each intrument *)
			CombL(excitation, 0.02, freq.reciprocal, 3), (* comb delay simulates string *)
			1.0.rand2(* random pan position *)
		);
	}));
(* add some reverb via allpass delays *)
5.do({ signal = AllpassN(signal, 0.05, [0.05.rand, 0.05.rand], 1) });
LeakDC( signal, 0.995); (* delays build up a lot of DC, so leak it out here. *)

(*---- textures *)

(* ritual hymn in praise of the god of the LS-3000 life support unit ; Klang - slow beating sines. *)
(
let n, d;
n = 20; (* n*3 components in each channel *)
d = 5.0; (* beat freq deviation *)
Texture.xfade({
	let z, p, q;
	p = Array.new(3*n);
	q = Array.new(3*n);
	n.do({ let freq;
		freq = (24 + 60.rand).midicps;
		p.add(freq);
		p.add(freq + d.rand2);
		p.add(freq + d.rand2);
	});
	n.do({ arg i;  let freq;
		freq = p.at(3*i);
		q.add(freq + d.rand2);
		q.add(freq + d.rand2);
		q.add(freq + d.rand2);
	});
	z = [`[p, nil, Array.rand(3*n, 0, 2.pi)],
		`[q, nil, Array.rand(3*n, 0, 2.pi)]
	];
	Klang(z) * (0.1/n);
}, 4, 4, 2)
)

(* the church of chance ; Klang - slow beating harmonic sines. *)
(
let n, d, m, x;
n = 8; (* number of notes *)
d = 0.4; (* beat freq deviation *)
m = 5; (* harmonics per note *)
Texture.xfade({
	let z, p, q, k;
	p = Array.new(m*n);
	q = Array.new(m*n);
	k = 24 + 12.rand;
	n.do({ let freq;
		freq = ([0, 2, 4, 5, 7, 9].choose + (7.rand*12) + k).midicps;
		p.add(freq + d.rand2);
		p.add(freq*2 + d.rand2);
		p.add(freq*4 + d.rand2);
		p.add(freq*5 + d.rand2);
		p.add(freq*6 + d.rand2);
	});
	n.do({ arg i;  let freq;
		freq = p.at(m*i);
		q.add(freq + d.rand2);
		q.add(freq*2 + d.rand2);
		q.add(freq*4 + d.rand2);
		q.add(freq*5 + d.rand2);
		q.add(freq*6 + d.rand2);
	});
	z = [`[p, nil, Array.rand(m*n, 0, 2.pi)],
		`[q, nil, Array.rand(m*n, 0, 2.pi)]
	];
	Klang(z) * (0.1/n);
}, 6, 3, 2);
)

(* tapping tools ; mouse x controls impulse rate *)
(
let e = Env.linen(1, 4, 1);
Texture.spawn({
	let rate = XLine(64, 0.125, 60);
	Pan2(
		(* resonant filter bank simulates resonant modes of bouncing objects *)
		Klank(
			`[
				Array.fill(4, { 400 + 8000.0.rand }), (* resonant freqs *)
				nil,
				Array.fill(4, { 0.01 + 0.1.rand }) (* ring times *)
			],
			(* decays excite filter bank *)
			Decay( (* each impulse triggers a decay *)
				Impulse((* impulses trigger decay envelope *)
					(1 + 20.0.linrand) * rate,
					0,
					0.03
				),
				0.001(* decay time - very short *)
			)
		),
		1.0.rand2, (* place each object at a random position in the stereo field *)
		EnvGen(e, doneAction:2)
	)
}, 2, 1, postProcess: {arg z;3.do({z = AllpassN(z, 0.05, [0.05.rand, 0.05.rand], 2)});z})
)

(*---- ; untranslated *)

(* UNTRANS - interaural time delay panning   ("Griot modeling" variant) *)

(* UNTRANS - a variant of "analog daze" that changes the pattern occasionally *)

(* UNTRANS - Berlin 1977 + bass *)

(* UNTRANS - yet another "Griot modeling" variant, much more taxing on CPU: requires a G3 *)

(* modal space ; mouse x controls discrete pitch in dorian mode ; Jmcc *)
let mix;
mix =
(* lead tone *)
SinOsc(
	(DegreeToKey(
		LocalBuf.newFrom([0, 2, 3, 5, 7, 9, 10]),
		MouseX(0, 15), (* mouse indexes into scale *)
		12) (* 12 notes per octave *)
		+ 72
		+ LfNoise1(3, [0.04, 0.04])).midicps,
	0,
	0.1)
(* drone 5ths *)
+ Rlpf(LfPulse([48, 55].midicps, 0, 0.15),
	SinOsc(0.1, 0, 10, 72).midicps, 0.1, 0.1);
CombN(mix, 0.31, 0.31, 2, 1, mix)

(*---- textures *)

(* modified from a patch by Landon Rose ; Jmcc *)
let e,  specList, tring;
tring = [3, 3, 3, 3];
specList	= [
	`[ [32, 43, 54, 89].midicps, nil, tring ],
	`[ [10, 34, 80, 120].midicps, nil, tring ],
	`[ [67, 88, 90, 100].midicps, nil, tring ],
	`[ [14, 23, 34, 45].midicps, nil, tring ],
	`[ [76, 88, 99, 124].midicps, nil, tring ]
] ;
e = Env.sine(4, 1);
Texture.spawn({ arg  index;
        EnvGen(
		e) *
	Klank(
                specList.wrapAt(index),
                PinkNoise([0.001, 0.001])
	)
},
        2, (* two channels *)
        2 (* nextTime *)
)

(* slight mod of "phase mod with slow beats" ;  mouse x controls random freq of new events ; mouse y controls modulation index *)
let e = Env.adsr(0.001, 0.01, 0.25, 0.04, 1, -4);
let n = 4; (* number of simultaneous events *)
Texture.overlap({
	let x = MouseX(100, 6000, 2, 0.2);
	let y = MouseY(0, 2);
	let ph = 0;
	let f1 = Rand.ir(0, x);
	let rate = ExpRand.ir(10.0, 40.0);
	let gate = Impulse(XLine(rate, [3, 0.3].choose * rate, 12, doneAction:2));
	3.do({
		let f2 = Rand.ir(0, x);
		ph = SinOsc([f2, f2 + 1.0.rand2], 0, y, ph);
	});
	EnvGen(e, gate) * SinOsc([f1, f1 + 1.0.rand2], ph, 0.1)
}, 4, 4, n, 2)

(*---- ; untranslated *)

(* UNTRANS - algorhythmic rhythms *)

(* UNTRANS - wolf tones *)

(* UNTRANS - using Sequencer to generate a chaotic waveform *)

(* UNTRANS - making rhythms out of sampled voice *)

(* UNTRANS - screen zones *)

(* deep trip ; graph re-write *)
OverlapTexture( {
        arg tr;
        let f, z, s;
	f = LfNoise1(TRand(0, 0.3, tr), 60, 70).midicps;
	z = SinOsc(f, 0,
		LfNoise2(
			f * TRand(0, 0.5, tr),
			LfNoise1(TRand(0, 8.0, tr), SinOsc(TRand(0, 40.0, tr), 0, 0.1)).max(0)
		)
	);
	s = Pan2(z, LfNoise1(TRand(0, 5.0, tr)));
	s + CombN(s, 0.5, [TRand(0, 0.2, tr) + 0.3, TRand(0, 0.2, tr) + 0.3], 20)
	+ CombN(s, 0.5, [TRand(0, 0.2, tr) + 0.3, TRand(0, 0.2, tr) + 0.3], 20);
}, 12, 4, 4, 2)

(* sidereal time ; graph re-write *)
let p = 15; (* number of partials per channel per 'cymbal'. *)
OverlapTexture({
        arg tr;
	let z, f1, f2, f3, in, out;
	f1 = 100;
	f2 = 6000.0;
	z = Array.fill(2, {
		`[ (* sine oscil bank specification *)
			Array.fill(p, { TExpRand(f1, f2, tr) } ), (* frequencies *)
			nil, (* amplitudes default to 1.0 *)
			Array.fill(p, { 2.0 + TRand(0, 4.0, tr) }) (* ring times *)
		]
	});
	f3 = LinExp(Sweep(tr, 1/12), 0, 1, TExpRand(40.0, 300.0, tr), TExpRand(40.0, 300.0, tr));
	in = LfPulse(f3, TRand(0.1, 0.9, tr), 0, 0.002 * LfNoise2(TRand(0, 8.0, tr)).max(0));
	out = DynKlank(z, in).distort * 0.1;
	CombN(out, 0.6, TRand(0, 0.5, tr) + 0.1, 8, 1, out.reverse);
}, 4, 4, 6, 2)

(* ostinoodles ; graph rewrite *)
let z = OverlapTexture({
        arg tr;
	let sequ, major, root, f, offset, sequence, trig;
        sequ = {arg s, tr; Demand(tr, 0, Dseq(inf, s))};
        root = 81 + TRand(-6, 6, tr);
        major = [0, 2, 4, 5, 7, 9, 11].as(LocalBuf);
	offset = TRand(-16, 16, tr);
	sequence = (DegreeToKey(major, TScramble(tr, [0, 1, 2, 3] + offset)) + root).midicps;
	trig = Impulse(LinExp(Sweep(tr, 1/12), 0, 1, TExpRand(4.0, 24.0, tr), TExpRand(4.0, 24.0, tr)));
	f = sequ.value(sequence, trig);
	Pan2(
		LfTri(f, 0, Decay2(trig, 0.004, 0.3, 0.1)),
		TRand(-1, 1, tr)
	)}, 6, 3, 6, 2);
6.do({
	z = AllpassN(z, 0.040, [0.040.rand, 0.040.rand], 16)
});
z

(*---- textures ; non-graph *)

(* deep trip *)
(
Texture.overlap( {
	f = LfNoise1(0.3.rand, 60, 70).midicps;
	z = SinOsc(f, 0,
		LfNoise2(
			f * 0.5.rand,
			LfNoise1(8.0.rand, SinOsc(40.0.rand, 0, 0.1)).max(0)
		)
	);
	s = Pan2(z, LfNoise1(5.0.rand));
	s + CombN(s, 0.5, [0.2.rand + 0.3, 0.2.rand + 0.3], 20)
	+ CombN(s, 0.5, [0.2.rand + 0.3, 0.2.rand + 0.3], 20);
}, 12, 4, 4, 2);
)

(* sawed cymbals *)
let p;
p = 15; (* number of partials per channel per 'cymbal'. *)
Texture.overlap({
	let z, f1, f2;
	f1 = 500 + 2000.0.rand;
	f2 = 8000.0.rand;
	z = Array.fill(2, {
		`[ (* sine oscil bank specification *)
			y = Array.fill(p, { f1 + f2.rand} ), (* frequencies *)
			nil, (* amplitudes default to 1.0 *)
			Array.fill(p, { 2.0 + 4.0.rand }) (* ring times *)
		]
	});
	Klank(z, LfSaw(XLine(600.0.rand, 600.0.rand, 12), 0, 0.0005));
}, 4, 4, 6, 2)

(* sidereal time *)
let p;
p = 15; (* number of partials per channel per 'cymbal'. *)
Texture.overlap({
	let z, f1, f2, f3, in, out;
	f1 = 100;
	f2 = 6000.0;
	z = Array.fill(2, {
		`[ (* sine oscil bank specification *)
			y = Array.fill(p, { exprand(f1, f2) } ), (* frequencies *)
			nil, (* amplitudes default to 1.0 *)
			Array.fill(p, { 2.0 + 4.0.rand }) (* ring times *)
		]
	});
	f3 = XLine(exprand(40.0, 300.0), exprand(40.0, 300.0), 12);
	in = LfPulse(f3, rrand(0.1, 0.9), 0) * 0.002 * LfNoise2(8.0.rand).max(0);
	out = Klank(z, in).distort * 0.1;
	CombN(out, 0.6, 0.5.rand + 0.1, 8) + out.reverse;
}, 4, 4, 6, 2)

(* pentatonic pipes ; Mouse X on right half of screen causes pulsation *)
let n, env, set, mode, root;
n = 5; (* number of overlapped events *)
env = Env.linen(0.2, 8, 1, 20, 'sine');
mode = [0, 3, 5, 7, 10];
root = 36 + 12.rand;
Texture.overlap({arg i;
	let amp, f;
        if(i%20 == 0, {root = 36 + 12.rand; root.postln});
	f = (20.rand.degreeToKey(mode, 12) + root).midicps;
	amp = EnvGen(env);
	Pan2(
		Resonz(
			PinkNoise(amp),
			f,
			0.002,
			4
		).distort * 0.2,
		1.0.rand2
	);
}, 10, 0.01, n, 2, postProcess: {arg z;
	z = z * LinXFade2(1.0, SinOsc(5).max(0), MouseX > 0.5); (* pulsation *)
	CombN(z, 0.3, 0.3, 8, 1, z.reverse);
})

(* ostinoodles *)
let sequ = {arg s, tr; Demand(tr, 0, Dseq(inf, s))};
let major, root;
root = 81 + 6.rand2;
major = [0, 2, 4, 5, 7, 9, 11];
Texture.overlap({
	let f, offset, sequence, trig;
	offset = 16.rand2;
	sequence = (([0, 1, 2, 3] + offset).scramble.degreeToKey(major) + root).midicps;
	trig = Impulse(XLine(exprand(4.0, 24.0), exprand(4.0, 24.0), 12));
	f = sequ.value(sequence, trig);
	Pan2(
		LfTri(f, 0, Decay2(trig, 0.004, 0.3, 0.1)),
		1.0.rand2
	);
}, 6, 3, 6, 2, postProcess: {arg z;
	6.do({
		z = AllpassN(z, 0.040, [0.040.rand, 0.040.rand], 16)
	});
	z
});

(* bowed garage door springs *)
Texture.overlap({
	Pan2(
		Klank(
	                `[
				Array.rand(4, 50.0, 2000.0),
				nil,
				Array.rand(4, 0.2, 12.0)
	                ],
	                PinkNoise(LfNoise1(3.0.rand, 0.0008, 0.0022))
		).abs * [-1, 1].choose,
		LfNoise1(1.0.rand)
	)
}, 8, 3, 4, 2, postProcess: {arg z;
	6.do({
		z = AllpassN(z, 0.040, [0.040.rand, 0.040.rand], 16)
	});
	z
})

(* contamination zone *)
Texture.overlap({
	let f;
	f = exprand(800, 8000);
	Pan2(
		Rlpf(
			Klank(
		                `[
					Array.rand(4, 50.0, 2000.0),
					nil,
					Array.rand(4, 0.2, 4.0)
		                ],
		                PinkNoise(LfNoise1(3.0.rand, 0.0008, 0.0022))
			).abs * [-1, 1].choose,
			SinOsc(1.0.linrand, 0, 0.7 * f, f),
			0.1
		),
		LfNoise1(1.0.rand),
		LfPulse(15.0.linrand, 0, 0.2 + 0.2.rand)
	)
}, 8, 3, 4, 2, postProcess: {arg z;
	6.do({
		z = AllpassN(z, 0.040, [0.040.rand, 0.040.rand], 16)
	});
	z
});

(* array manipulation of multi channel audio *)
Texture.xfade({
	let a, b, c, d, e;
	(* 2 channels each of 3 different processes: *)
	a = Array.fill(2, {
		SinOsc(2000.0.rand, 0,
			Decay2(Impulse(8.0.rand),
				0.01, 0.3, 0.1))
	});
	b = Array.fill(2, {
		Resonz(GrayNoise(
			LfNoise2(4.0.rand, 2).max(0)),
			2000.0.rand, 0.05)
	});
	c = Array.fill(2, {
		Klank(
			`[
				Array.rand(8, 80.0, 3000.0),
				nil,
				Array.rand(8, 0.2, 2.0)
			],
			Dust(2, 0.1)
		)
	});
	a = a ++ b ++ c;	 (* concatenate all channels *)
	a = a.scramble; (* scramble channels *)
	d = a.copyRange(0, 2); (* copy first half, assign to d *)
	e = a.copyRange(3, 5); (* copy second half, assign to e *)
	(* echo elements of d *)
	d = CombN(d, 0.3, Array.rand(3, 0.1, 0.3), 4, 1, d);
	(* absolute value distortion on elements of e *)
	e = e.abs;
	f = (d ++ e).scramble; (* concatenate, scramble *)
	f = f.clump(2); (* make into groups of 2 channels *)
	Mix(f); (* mix stereo pairs to one pair *)
}, 9, 1, 2);

(*---- c.f. mridigam *)

(* choip choip choip ; graph re-write *)
let t = 12;
let z = OverlapTexture({
        arg tr;
        let tline = {arg lhs, rhs, dur, tr; LinLin(in: Sweep(trig: tr, rate: 1 / dur), srclo: 0, srchi: 1, dstlo: lhs, dsthi: rhs)};
        let txline = {arg lhs, rhs, dur, tr; LinExp(in: Sweep(trig: tr, rate: 1 / dur), srclo: 0, srchi: 1, dstlo: lhs, dsthi: rhs)};
	let impulses = Impulse(
		txline.value(TExpRand(1, 30, tr), TExpRand(1, 30, tr), t, tr)
	);
	let f = txline.value(TExpRand(600.0, 8000.0, tr), TExpRand(600.0, 8000.0, tr), t, tr);
	Pan2(
		Decay2(
			impulses * txline.value(TExpRand(0.01, 0.5, tr), TExpRand(0.01, 0.5, tr), t, tr),
			0.01,
			0.2,
			SinOsc(Decay2(impulses, 0.05, 0.5, -0.9*f, f))
		),
		tline.value(TRand(-1, 1, tr), TRand(-1, 1, tr), t, tr)
	);
}, t-2, 1, 8, 2);
4.do({ z = AllpassN(z, 0.1, [Rand.ir(0, 0.05), Rand.ir(0, 0.05)], 4) });
z

(*---- textures ; non-graph *)

(* tarmac *)
Texture.overlap({arg i;
        let imp_seq = {arg s, tr; Demand(tr, 0, Dseq.dr(s, inf)) * tr};
	let t, d;
	t = Impulse(8);
	d = rrand(0.05, 0.5);
	Pan2(
		Rlpf(
			Klank(
		                `[
					Array.linrand(4, 50.0, 4000.0),
					nil,
					Array.rand(4, 0.2, 12.0)
		                ],
		                PinkNoise(LfNoise1(3.0.rand, 0.0008, 0.0022))
			).max(0) * [-1, 1].choose,
			Decay2(t, 0.004, d, 5000.0.rand, 100.0.rand + 100),
			0.2
		),
		LfNoise1(1.0.rand),
		Decay2(
	            	imp_seq.value(
		            	(
		            		[
		            			[1, 0, 0],
		            			[1, 1, 0],
		            			[1, 1, 0, 0],
		            			[1, 1, 1, 0, 0, 0],
		            			[1, 1, 1, 0, 0, 0, 0, 0],
		            			[1, 1, 1, 1, 0, 0, 0, 0],
		            			[1, 1, 1, 1, 1, 0, 0, 0],
		            			[1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
		            		].choose.scramble),
				t), 0.004, d)
	)
}, 12, 3, 6, 2);

Texture.overlap({
	Pan2(
		Klank(
	                `[
				Array.linrand(4, 700.0, 6000.0),
				nil,
				Array.linrand(4, 0.2, 12.0)
	                ],
	                PinkNoise(0.0008)
		),
		LfNoise1(1.0.rand),
		LfNoise1(LfNoise1(1, 3, 4), 0.4, 0.6)
	)
}, 8, 3, 4, 2, postProcess: {arg z;
	6.do({
		z = AllpassN(z, 0.040, [0.040.rand, 0.040.rand], 16)
	});
	z
});

(* choip choip choip *)
let t = 12;
Texture.overlap({
	let impulses = Impulse(
		XLine(exprand(1, 30), exprand(1, 30), t)
	);
	let f = XLine(exprand(600.0, 8000.0), exprand(600.0, 8000.0), t);
	Pan2(
		Decay2(
			impulses * XLine(exprand(0.01, 0.5), exprand(0.01, 0.5), t),
			0.01,
			0.2,
			SinOsc(Decay2(impulses, 0.05, 0.5, -0.9*f, f))
		),
		Line(1.0.rand2, 1.0.rand2, t)
	)
}, t-2, 1, 8, 2, postProcess: {arg z;
	4.do({ z = AllpassN(z, 0.1, [0.05.rand, 0.05.rand], 4) });
	z})


(*---- ; untranslated *)

(* UNTRANS - mix of three other examples... *)

(* UNTRANS - pentatonic pipes and bells *)

(* UNTRANS - dancing shadows *)

(* Strummable guitar ; use mouse to strum strings ; Jmcc *)
let pitch, mousex, out;
pitch = [ 52, 57, 62, 67, 71, 76 ]; (* e a d g b e *)
mousex = MouseX;
out = MixFill(pitch.size, { arg i;
	let trigger, pluck, period, string;
	(* place trigger points from 0.25 to 0.75 *)
	trigger = HPZ1(mousex > (0.25 + (i * 0.1))).abs;
	pluck = PinkNoise(Decay(trigger, 0.05));
	period = pitch.at(i).midicps.reciprocal;
	string = CombL(pluck, period, period, 4);
	Pan2(string, i * 0.2 - 0.5);
});
LPF(out, 12000);
LeakDC(out);

(* Strummable 12 string guitar ; use mouse to strum strings ; Jmcc *)
let pitch, mousex, out;
pitch = [ 52, 57, 62, 67, 71, 76 ]; (* e a d g b e *)
mousex = MouseX;
out = MixFill(pitch.size, { arg i;
	let pos, trigger1, trigger2, pluck1, pluck2, period, string1, string2;
	(* place trigger points from 0.25 to 0.75 *)
	pos = 0.25 + (i * 0.1);
	period = pitch.at(i).midicps.reciprocal;
	trigger1 = HPZ1(mousex > pos).abs;
	pluck1 = PinkNoise(Decay(trigger1, 0.05));
	string1 = CombL(pluck1, period, period, 4);
	trigger2 = HPZ1(mousex > (pos + 0.015)).abs;
	pluck2 = PinkNoise(Decay(trigger2, 0.05));
	string2 = CombL(pluck2, period/2, period/2, 4);
	Pan2(string1 + string2, i * 0.2 - 0.5);
});
LPF(out, 12000);
LeakDC(out);

(* Bidirectional strummable guitar ; use mouse to strum strings ; Jmcc *)
let pitch1, pitch2, mousex, out;
pitch1 = [ 52, 57, 62, 67, 71, 76 ]; (* e a d g b e *)
pitch2 = pitch1 + 7;
mousex = MouseX;
out = MixFill(pitch1.size, { arg i;
	let trigger, pluck1, pluck2, period1, period2, string1, string2;
	(* place trigger points from 0.25 to 0.75 *)
	trigger = HPZ1(mousex > (0.25 + (i * 0.1)));
	pluck1 = PinkNoise(Decay(trigger.max(0), 0.05));
	period1 = pitch1.at(i).midicps.reciprocal;
	string1 = CombL(pluck1, period1, period1, 4);
	pluck2 = BrownNoise(Decay(trigger.neg.max(0), 0.05));
	period2 = pitch2.at(i).midicps.reciprocal;
	string2 = CombL(pluck2, period2, period2, -4);
	Pan2(string1 + string2, i * 0.2 - 0.5);
});
LPF(out, 12000);
LeakDC(out);

(* harmonic zither ; use mouse to strum strings ; Jmcc *)
let pitch, mousex, mousey, out, triggerSpacing, panSpacing;
pitch = [ 50, 53.86, 57.02, 59.69, 62, 64.04, 65.86, 67.51, 69.02, 71.69, 72.88, 74 ]; (* harmonic series *)
mousex = MouseX;
mousey = MouseY;
triggerSpacing = 0.5 / (pitch.size - 1);
panSpacing = 1.5 / (pitch.size - 1);
out = MixFill(pitch.size, { arg i;
	let trigger, pluck, period, string;
	(* place trigger points from 0.25 to 0.75 *)
	trigger = HPZ1(mousex > (0.25 + (i * triggerSpacing))).abs;
	pluck = PinkNoise(Decay(trigger, 0.05));
	period = pitch.at(i).midicps.reciprocal;
	string = CombL(pluck, period, period, 8);
	Pan2(string, i * panSpacing - 0.75);
});
LPF(out, 12000);
LeakDC(out);

(* Strummable metals ; use mouse to strum strings ; Jmcc *)
let mousex, out;
mousex = MouseX;
out = MixFill(8, { arg i;
	let trigger, pluck, period, metal, z, n=15;
	(* place trigger points from 0.25 to 0.75 *)
	trigger = HPZ1(mousex > (0.25 + (i * 0.07))).abs;
	pluck = PinkNoise(Decay(trigger, 0.05, 0.04));
	z = `[ (* filter bank specification *)
		y = Array.fill(n, { (300 * i) + 8000.0.linrand} ), (* frequencies *)
		nil, (* amplitudes default to 1.0 *)
		Array.fill(n, { 1.0 + 4.0.rand }) (* ring times *)
	];
	metal = Klank(z, pluck);
	Pan2(metal, i * 0.2 - 0.5);
});
LPF(out, 12000);
LeakDC(out);

(* Strummable pipes ; Jmcc *)
let mousex, out;
mousex = MouseX;
out = MixFill(8, { arg i;
	let trigger, pluck, period, metal, z, n=15, freq;
	(* place trigger points from 0.25 to 0.75 *)
	trigger = HPZ1(mousex > (0.25 + (i * 0.07))).abs;
	pluck = PinkNoise(Lag(Trig(trigger, 1), 0.2, 0.01));
	freq = ([0, 3, 5, 7, 10, 12, 15, 17].at(i) + 60).midicps;
	z = `[ (* filter bank specification *)
		y = Array.fill(n, { arg j; (j+1) * freq } ), (* frequencies *)
		nil, (* amplitudes default to 1.0 *)
		Array.fill(n, { 0.2.rand }) (* ring times *)
	];
	metal = Klank(z, pluck);
	Pan2(metal, i * 0.2 - 0.5);
});
LPF(out, 12000);
out = LeakDC(out);
6.do({ out = AllpassN(out, 0.1, [0.05.rand, 0.05.rand], 4) });
out

(* Strummable silk ; Jmcc *)
let mousex = MouseX(0, 1, 0, 0.2);
let out = (1 .. 8).collect { :ix |
	var n = 15;
	(* place trigger points from 0.25 to 0.75 *)
	let trigger = Hpz1(mousex > (0.25 + (ix - 1 * 0.07))).Abs;
	let pluck = PinkNoise() * Decay(Impulse(14, 0).Mul(Lag(Trig(trigger, 1), 0.2) * 0.01), 0.04);
	let freq = ([-2 0 3 5 7 10 12 15].at(ix) + 60).MidiCps;
	let metal = RingzBank(pluck,
		(1 .. n) * freq, (* frequencies *)
		nil, (* amplitudes default to 1.0 *)
		{ Rand(0.3, 1.0) } ! n); (* ring times *)
	EqPan2(metal, ix * 0.2 - 0.5)
}.Sum.Lpf( 12000).LeakDc(0.995);
6.timesRepeat {
	out := AllpassN(out, 0.1, [0.05.Rand0, 0.05.Rand0], 4)
};
out

(* inharmonic warbulence ; Jmcc ; graph rewrite *)
let z = OverlapTexture({
        arg tr;
	let f, r, n, a, z;
	f = TRand(24, 96, tr).midicps;
	a = min(1, (500/f));
	r = TxLine(TExpRand(0.1, 20, tr), TExpRand(0.1, 20, tr), 25.6, tr);
	n = 12;
	a * MixFill(n, { arg i;
		g = TRand(0, n, tr) + 1;
		Pan2(
			SinOsc(f*g, 0, SinOsc( r * TRand(0.9, 1.1, tr), TRand(0, 2.pi, tr), 0.08, -0.04).max(0)) * (2/g),
			TRand(-1, 1, tr)
		)
	}) * 0.1}, 12.8, 6.4, 6, 2);
MixFill(5, { CombN(z, 0.3, [Rand.ir(0.1, 0.3), Rand.ir(0.1, 0.3)], 8) }) * 0.3;

(*---- textures *)

(* arachnid espresso ; ERROR ; Jmcc *)
Texture.overlap({
        let imp_seq = {arg s, tr; Demand(tr, 0, Dseq(s, inf)) * tr};
        let sequ = {arg s, tr; Demand(tr, 0, Dseq(s, inf))};
	let t, c, e, f, n, r, p, pf;
	#p, pf = [[1, 1], [1, 1], [-1, 2]].choose; (* choose string or pipe *)
	r = [8, 4, 2].choose;
	c = Impulse(r);
	t = imp_seq.value(([
		[1, 1, 0, 0, 0, 0, 0, 0],
		[1, 1, 1, 0, 0, 0, 0, 0],
		[1, 1, 1, 1, 0, 0, 0, 0]
	].choose.scramble), c);
	e = Trig(t, rrand(0.3, 0.9)/r);
	f = pf*Lag(sequ.value((Array.fill([1, 2, 3, 4].choose, { rrand(24, 96).midicps })), t), 0.1/r);
	n = LPZ2(LfNoise2(min(f*24, 12000), 0.2 * e));
	Pan2( CombC(n, 0.1, 1/f, min(0.5, exprand(90, 240)/f) * p) * 0.2, 1.0.rand2);
}, 19, 0.5, 5, 2, postProcess: {arg signal;
	6.do({ signal = AllpassL(signal, 0.03, [0.03.rand, 0.03.rand], 3) });
	signal})

(* inharmonic warbulence ; Jmcc *)
Texture.overlap({
	let f, r, n, a;
	f = rrand(24, 96).midicps;
	a = min(1, (500/f));
	r = XLine(exprand(0.1, 20), exprand(0.1, 20), 25.6);
	n = 12;
	a * MixFill(n, { arg i;
		g = n.asFloat.rand + 1;
		Pan2(
			SinOsc(f*g, 0, SinOsc( r * rrand(0.9, 1.1), 2.pi.Rand0, 0.08, -0.04).max(0)) * (2/g),
			1.0.rand2
		)
	});
}, 12.8, 6.4, 6, 2, postProcess: {arg signal;
	MixFill(5, { CombN(signal, 0.3, [rrand(0.1, 0.3), rrand(0.1, 0.3)], 8) }) * 0.3;
})

(* clipped inharmonic warbulence ; Jmcc *)
Texture.overlap({
	let r = LinExp(LfNoise1(1/16), -1, 1, 0.1, 20);
	let f, n, a;
	f = rrand(24, 96).midicps;
	a = min(1, (500/f));
	n = 12;
	a * MixFill(n, { arg i;
		g = n.asFloat.rand + 1;
		Pan2(
			SinOsc(f*g, 0, SinOsc( r * rrand(0.9, 1.1), 2.pi.Rand0, 0.08, -0.04).max(0)).max(0) * (2/g),
			1.0.rand2
		)
	});
}, 12.8, 6.4, 6, 2, postProcess: {
	arg signal;
	signal = LeakDC(signal);
	signal = MixFill(8, { CombN(signal, 0.3, [rrand(0.1, 0.3), rrand(0.1, 0.3)], 20) }) * 0.3;
})

(* pulse harmonic warbulence ; Jmcc *)
Texture.overlap({
	let f, r, n;
	f = rrand(24, 96).midicps;
	r = XLine(exprand(0.1, 20), exprand(0.1, 20), 25.6);
	n = 12;
	MixFill(n, { arg i;
		Pan2(
			SinOsc(f * i + f, 0, SinOsc( r * rrand(0.9, 1.1), 2.pi.Rand0, 0.1, -0.05).max(0)) * (1/(i+1)),
			1.0.rand2
		)
	}) * LfPulse(exprand(0.2, 1.2), rrand(0.1, 0.2));
}, 12.8, 6.4, 6, 2, postProcess: {arg signal;
	MixFill(5, { CombN(signal, 0.3, [rrand(0.1, 0.3), rrand(0.1, 0.3)], 8) }) * 0.5;
})

(*---- c.f *)

(* SEE drone + rhythm *)

(* SEE early space music LP, side 1 *)

(* SEE early space music LP, side 2 *)
