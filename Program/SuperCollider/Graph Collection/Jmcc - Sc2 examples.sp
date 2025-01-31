/********** Analog bubbles ; Jmcc **********/
let f = LfSaw(0.4, 0).MulAdd(24, LfSaw([8, 7.23], 0).MulAdd(3, 80)).MidiCps; /* glissando function */
CombN(SinOsc(f, 0) * 0.04, 0.2, 0.2, 4) /* echoing sine wave */

/********** Lfo modulation of Pulse waves and resonant filters ; Jmcc **********/
CombL(
	Rlpf(LfPulse(SinOsc(0.05, 0).MulAdd(80, 160),0, 0.4) * 0.05,
		SinOsc([0.6, 0.7], 0).MulAdd(3600, 4000), 0.2),
	0.3, [0.2, 0.25], 2)

/********** Moto rev ; Jmcc **********/
Rlpf(LfPulse(SinOsc(0.2, 0).MulAdd(10, 21), 0, 0.1), 100, 0.1).Clip2(0.4)

/********** Scratchy ; Jmcc **********/
Rhpf(BrownNoise(0.5 # 2, -0.49).Max(0) * 20, 5000, 1)

/********** Sprinkler ; Jmcc **********/
Bpz2(WhiteNoise() * LfPulse(LfPulse(0.09, 0, 0.16).MulAdd(10, 7), 0, 0.25) * 0.1)

/********** Sprinkler ; mouse ; Jmcc **********/
Bpz2(WhiteNoise() * LfPulse(MouseX(0.2, 50, 0, 0.2), 0, 0.25) * 0.1)

/********** Harmonic swimming ; Jmcc **********/
let f = 50; /* fundamental frequency */
let p = 20; /* number of partials per channel */
let z = 0; /* start of oscil daisy chain */
let offset = Line(0, -0.02, 60); /* causes sound to separate and fade */
1:p.do { :i |
	z := SinOsc(
		f * i, 0).MulAdd( /* freq of partial */
			Max(0, /* clip negative amplitudes to zero */
				LfNoise1(
					6 + [4.Rand2, 4.Rand2]).MulAdd( /* amplitude rate */
						0.02, /* amplitude scale */
						offset /* amplitude offset */
					)
			),
			z
		)
};
z

/********** Harmonic tumbling ; Jmcc **********/
let f = 80; /* fundamental frequency */
let p = 10; /* number of partials per channel */
let z = 0; /* start of oscil daisy chain */
let trig = XLine([10, 10], 0.1, 60); /* trigger probability decreases over time */
1:p.do { :i |
	z := SinOsc(
		f * i, 0).MulAdd( /* freq of partial */
			Decay2(
				Dust(trig) /* trigger rate */
				* 0.02, /* trigger amplitude */
				0.005, /* grain attack time */
				0.5.Rand0 /* grain decay time */
			),
			z
		)
};
z

/********** Reso pulse ; Jmcc **********/
let z = { :tr |
	let f = TChoose(tr, [25 30 34 37 41 42 46 49 53 54 58 61 63 66]).MidiCps;
	LfPulse(f, 0, 0.2) + LfPulse(2 * f + TRand(-0.5, 0.5, tr), 0, 0.2)
}.OverlapTexture(4, 2, 4).Sum;
let lfoFreq = 6;
let lfo = LfNoise0(lfoFreq).MulAdd(1000, 1200);
let left = Rlpf(
	z * 0.02,
	lfo, /* cutoff freq */
	MouseX(0.2, 0.02, 1, 0.2)
); /* filter bandwidth */
let delayTime = 2 / lfoFreq;
let right = DelayN(left, delayTime, delayTime); /* delay right channel by two beats */
[left, right]

/********** Pulsing bottles ; Jmcc **********/
let n = 6; /* number of 'bottles' */
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

/********** What was I thinking? ; Jmcc **********/
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

/********** Police state ; Jmcc **********/
let n = 4; /* number of sirens */
CombL(
	{
		EqPan2(
			SinOsc(
				SinOsc(0.1.Rand0 + 0.02, 2.pi.Rand0).MulAdd(600.Rand0, 1000 + 300.Rand2),
				0) * LfNoise2(100 + 20.Rand2) * 0.1,
			1.Rand2
		)
	} !> n
	+ LfNoise2(LfNoise2([0.4, 0.4]).MulAdd(90, 620)).Times(LfNoise2([0.3, 0.3]).MulAdd(0.15, 0.18)),
	0.3, 0.3, 3)

/********** analogue daze (commented) ; Jmcc **********/
/* define a function so that I can make a couple of copies of this instrument */
let anaSynFunc = { :octave :clockRate :pwmrate :fltrate |
	/* create a list of frequencies */
	let freqList = (
		[55, 63, 60, 63, 57, 65, 62, 65] /* specify in MIDI notes */
		+ (12 * octave) /* offset by octaves argument */
	).MidiCps; /* convert to cycles per second */
	/* use a sequencer to step through the list of frequencies */
	let freq = Sequencer(
		freqList,
		Impulse(clockRate, 0) /* sequencer steps at each trigger from this oscillator */
	);
	/* analog VCO->VCF voice */
	Rlpf( /* resonant lowpass filter */
		LfPulse( /* pulse wave oscillator input to filter */
			Lag( /* take the frequency and use a lag filter to make it glide */
				freq, /* from one pitch to another */
				0.05 /* Lag time */
			), 0,
			SinOsc( /* pulse width modulator LfO */
				pwmrate, /* LfO rate */
				2.pi.Rand0).MulAdd( /* random initial phase */
					0.4, 0.5)) /* scale and offset give pulse widths from 0.1 to 0.9 */
		* 0.1, /* pulse oscillator amplitude */
		SinOsc( /* filter cutoff freq LfO */
			fltrate, /* LfO rate */
			2.pi.Rand0).MulAdd( /* random initial phase */
				1400, 2000), /* scale and offset give cutoff freq from 600 to 3400 Hz */
		1 / 15 /* 1/Q */
	)
}; /* end of function definition f */
/* analogue snare drum */
let snare = Decay( /* an exponential decay envelope */
	Impulse(2, 0), /* impulses trigger envelope at 2 beats per second */
	0.15).Times( /* 0.15 seconds to decay by 60 dB */
		LfNoise0( /* step noise used as snare sound */
			LfNoise1(0.3).MulAdd(6000, 8000)) * /* sweep the noise frequency between 2000 and 14000 Hz */
		[0.07, 0.07]); /* amplitude (in stereo, causes whole snare subpatch to be stereo, see MultiChannel.help) */
/* create two copies of sequencer patch in separate channels */
let g = [ /* call function f to create each instrument */
	anaSynFunc(1, 8, 0.31, 0.2), /* +1 octave,  8 clocks per second, PWM rate, Rlpf rate */
	anaSynFunc(0, 2, 0.13, 0.11) /* +0 octaves, 2 clocks per second, PWM rate, Rlpf rate */
] + snare; /* add to snares */
/* comb delay of input plus dry stereo pair reversed */
let z = 0.4 * ( /* scale delayed part down */
	CombN( /* feedback delay */
		g, /* input dry signal */
		0.375, 0.375, /* 3 / 8 second delay */
		5 /* 5 second 60dB decay time */
	)
	+ g.reverse); /* add dry stereo pair with the channels reversed */
let e = EnvLinen(2, 56, 2, 1, -4); /* one minute trapezoid envelope */
z * EnvGen(1, 1, 0, 1, 2, e.asList) /* wrap a one minute envelope around entire sound */

/********** Analogue daze (un-commented) ; Jmcc **********/
let pattern = [55 63 60 63 57 65 62 65];
let f = { :octave :clockRate :pwmrate :fltrate |
	Rlpf(LfPulse(Lag(
		Sequencer(
			((pattern + (12 * octave)).MidiCps), /* sequencer pattern */
			Impulse(clockRate, 0) /* sequencer trigger */
		),
		0.05 /* Lag time coefficient */
	), 0,
		SinOsc(pwmrate, 2.pi.Rand0).MulAdd(0.4, 0.5)) * /* pulse width modulator */
		0.1, /* pulse amplitude */
		SinOsc(fltrate, 2.pi.Rand0).MulAdd(1400, 2000), /* cutoff freq LfO */
		1 / 15)
};
let x = Decay(Impulse(2, 0), 0.15) * LfNoise0(LfNoise1(0.3).MulAdd(6000, 8000)) * [0.07, 0.07];
let g = [f(1, 8, 0.31, 0.2), f(0, 2, 0.13, 0.11)] + x;
let z = 0.4 * (CombN(g, 0.375, 0.375, 5) + g.reverse);
let e = EnvLinen(2, 56, 2, 1, -4); /* one minute trapezoid envelope */
z * EnvGen(1, 1, 0, 1, 2, e.asList) /* wrap a one minute envelope around entire sound */

/********** synthetic piano ; Jmcc **********/
let n = 6; /* number of keys playing */
{ /* mix an list of notes */
	let pitch = (36 + 54.Rand0); /* calculate delay based on a random note */
	let strike = Impulse(0.1 + 0.4.Rand0, 0) * 0.1; /* random period for each key */
	let hammerEnv = Decay2(strike, 0.008, 0.04); /* excitation envelope */
	EqPan2(
		/* list of 3 strings per note */
		1:3.collect { :i |
			/* detune strings, calculate delay time */
			let detune = [-0.05, 0, 0.04].at(i);
			let delayTime = 1 / (pitch + detune).MidiCps;
			/* each string gets own exciter */
			let hammer = LfNoise2(3000) * hammerEnv; /* 3000 Hz was chosen by ear */
			CombL(hammer, /* used as a string resonator */
				delayTime, /* max delay time */
				delayTime, /* actual delay time */
				6) /* decay time of string */
		},
		(pitch - 36) / 27 - 1 /* pan position: lo notes left, hi notes right */
	).sum
} !> n

/********** Strummable silk ; Jmcc **********/
let mousex = MouseX(0, 1, 0, 0.2);
let out = 1:8.collect { :ix |
	let n = 15;
	/* place trigger points from 0.25 to 0.75 */
	let trigger = Hpz1(mousex > (0.25 + (ix - 1 * 0.07))).Abs;
	let pluck = PinkNoise() * Decay(Impulse(14, 0).Times(Lag(Trig(trigger, 1), 0.2) * 0.01), 0.04);
	let freq = ([-2 0 3 5 7 10 12 15].at(ix) + 60).MidiCps;
	let metal = RingzBank(pluck,
		1:n * freq, /* frequencies */
		nil, /* amplitudes default to 1.0 */
		{ Rand(0.3, 1.0) } ! n); /* ring times */
	EqPan2(metal, ix * 0.2 - 0.5)
}.Sum.Lpf( 12000).LeakDc(0.995);
6.timesRepeat {
	out := AllpassN(out, 0.1, [0.05.Rand0, 0.05.Rand0], 4)
};
out

/********** Reverberated sine percussion ; Jmcc **********/
let d = 10; /* number of percolators */
let c = 7; /* number of comb delays */
let a = 4; /* number of allpass delays */
let s = Sum({ Resonz(Dust(2 / d) * 50, 200 + 3000.Rand0, 0.003) } ! d); /* sine percolation sound */
let z = DelayN(s, 0.048, 0.048); /* reverb predelay time */
let y = Sum(CombL(z, 0.1, LfNoise1({ 0.1.Rand0 } ! c).MulAdd(0.04, 0.05), 15)); /* 7 length modulated comb delays in parallel */
a.timesRepeat { /* chain of 4 allpass delays on each of two channels (8 total) */
	y := AllpassN(y, 0.050, [0.050.Rand0, 0.050.Rand0], 1)
};
s + (0.2 * y) /* add original sound to reverb and play it */

/********** Reverberated noise bursts ; Jmcc **********/
let s = Decay(Dust(0.6) * 0.2, 0.15) * PinkNoise(); /* pink noise percussion sound */
let z = DelayN(s, 0.048, 0.048); /* reverb predelay time */
let y = Sum(CombL(z, 0.1, LfNoise1({ 0.1.Rand0 } ! 6).MulAdd(0.04, 0.05), 15)); /* 6 modulated comb delays in parallel */
4.timesRepeat { /* chain of 4 allpass delays on each of two channels (8 total) */
	y := AllpassN(y, 0.050, [0.05.Rand0, 0.05.Rand0], 1)
};
s + y /* add original sound to reverb and play it */

/********** Mouse control ; Jmcc **********/
SinOsc(MouseX(200, 2000, 1, 0.2), 0) * 0.1

/********** Analog bubbles ; with mouse control ; Jmcc **********/
let freq = LfSaw(
	MouseY(0.1, 10, 1, 0.2), 0).MulAdd( /* lfo 1 rate */
		24, /* lfo 1 depth in semitones */
		/* lfo 2 in lfo 1's add input */
		LfSaw(
			MouseX(2, 40, 1, 0.2), 0).MulAdd( /* lfo 2 rate */
				-3, 80) /* lfo 2 depth & offset in semitones */
	).MidiCps; /* convert to frequency */
CombN(SinOsc(freq, 0) * 0.04, 0.2, 0.2, 2) /* echoing sine wave */

/********** Input thru ; Jmcc **********/
AudioIn([1, 2])

/********** Distort input ; Jmcc **********/
let gain = MouseX(1, 100, 1, 0.2); /* mouse x controls gain into distortion */
AudioIn([1, 2]).Times(gain).Distort * 0.4

/********** Ring modulate input ; Jmcc **********/
let input = AudioIn([1, 2]);
let modulator = SinOsc(
	MouseX(10, 4000, 1, 0.2), /* mouse x controls ring mod freq */
	[0, 0.5.pi] /* offset phase ofone osc by 90 degrees */
);
input * modulator

/********** Ring modulate input using Ring1 ; Jmcc **********/
let input = AudioIn([1, 2]) * 0.5;
let modulator = SinOsc(
	MouseX(10, 4000, 1, 0.2), /* mouse x controls ring mod freq */
	[0, 0.5.pi] /* offset phase ofone osc by 90 degrees */
);
input.Ring1(modulator)

/********** Filter the input ; Jmcc **********/
let rQ = MouseY(0.01, 1, 1, 0.2); /* bandwidth ratio = 1/Q */
Rlpf(
	AudioIn([1, 2]) * 0.4 * rQ.Sqrt, /* attenuate to offset resonance */
	MouseX(100, 12000, 1, 0.2), /* mouse x controls cutoff freq */
	rQ
)

/********** Input noise gate ; Jmcc **********/
let input = AudioIn([1, 2]);
Compander(
	input, input,
	MouseX(0.01, 0.5, 0, 0.2), /* threshold */
	10, /* below threshold slope */
	1, /* above threshold slope */
	0.01, 0.1
)

/********** Pitch shift input ; Jmcc **********/
PitchShift(
	AudioIn([1, 2]) * 0.5, /* stereo audio input */
	0.04, /* grain size */
	MouseX(0, 2, 0, 0.2), /* mouse x controls pitch shift ratio */
	0, /* pitch dispersion */
	0.004/* time dispersion */
)

/********** Use PitchShift to granulate input ; upper left corner is normal playback ; Jmcc **********/
let grainSize = 0.1;
PitchShift(
	AudioIn([1, 2]) * 0.5,
	grainSize,
	1, /* nominal pitch rate = 1 */
	MouseX(0, 1, 0, 0.2), /* pitch dispersion */
	MouseY(0, grainSize, 0, 0.2) /* time dispersion */
)

/********** Echo input ; Jmcc **********/
let in = AudioIn([1, 2]) * 0.1;
CombL(
	in,
	0.5, /* max delay time */
	MouseX(0, 0.5, 0, 0.2), /* mouse x controls delay time */
	4) /* echo 60 dB decay time in seconds */
+ in /* mix with input */

/********** Ring modulate & echo input ; Jmcc **********/
let in = AudioIn([1, 2]) * 0.4 * SinOsc(MouseX(10, 2000, 1, 0.2), [0, 0.5.pi]);
CombL(
	in,
	0.5,
	MouseY(0, 0.5, 0, 0.2), /* mouse y controls delay time */
	4 /* echo 60 dB decay time in seconds */
) + in /* mix with input */

/********** Ring modulated and resonant filtered input ; Jmcc **********/
let input = AudioIn([1, 2]) * 0.2;
let modulator = SinOsc(
	MouseX(10, 4000, 1, 0.2), /* mouse x controls ring mod freq */
	[0, 0.5.pi] /* offset phase ofone osc by 90 degrees */
);
Rlpf(
	input * modulator, /* do ring modulation */
	MouseY(100, 12000, 1, 0.2), /* mouse y controls cutoff freq */
	0.1) /* bandwidth ratio = 1/Q */

/********** Distort, ring modulate & echo input, a real noise fest ; Jmcc **********/
let in = (AudioIn([1, 2]) * 20).Distort.Ring1(
	SinOsc(MouseX(10, 2000, 1, 0.2), [0, 0.5.pi])
) * 0.02;
CombL(
	in,
	0.5,
	MouseY(0, 0.5, 0, 0.2), /* mouse y controls delay time */
	4
) + in

/********** Sweep verb ; Jmcc **********/
let s = AudioIn([1, 2]) * 0.01;
let z = DelayN(s.Sum, 0.048, 0.048); /* reverb predelay time */
let y = CombL(z, 0.1, LfNoise1({ 0.1.Rand0 } ! 6).MulAdd(0.04, 0.05), 15).Sum; /* 6 modulated comb delays in parallel */
4.timesRepeat { /* chain of 4 allpass delays on each of two channels (8 total) */
	y := AllpassN(y, 0.050, [0.050.Rand0, 0.050.Rand0], 1)
};
LeakDc(y, 0.995) /* eliminate DC */

/********** Monastic resonance ; mouse controls size and reverb time ; Jmcc **********/
let decayTime = MouseX(0, 16, 0, 0.2);
let delayScale = MouseY(0.01, 1, 0, 0.2);
let s = AudioIn([1, 2]) * 0.005;
let z = DelayN(Sum(s), 0.048, 0.048); /* reverb predelay time */
let y = Sum(CombL(z, 0.1, { 0.04.Rand2 + 0.05 } ! 8 * delayScale, decayTime)); /* 8 comb delays in parallel */
5.timesRepeat { /* chain of 5 allpass delays on each of two channels (10 total) */
	y := AllpassN(y, 0.050, [0.050.Rand0, 0.050.Rand0], 1)
};
LeakDc(y, 0.995) /* eliminate DC */

/********** Berlin 1977 ; mouse x controls clock rate ; Jmcc **********/
let clockRate = MouseX(5, 20, 0, 0.2);
let clockTime = 1 / clockRate;
let clock = Impulse(clockRate, 0); /* sequencer trigger */
let patternList = [55 60 63 62 60 67 63 58];
let note = Sequencer(patternList, clock); /* midi note pattern sequencer */
let octNote = Sequencer( /* every 16 beats transpose somewhat randomly */
	[-12 -7 -5 0 2 5].shuffled, /* function called at each trigger */
	PulseDivider(clock, 16, 0) /* divide clock by 16 */
) + note; /* add transpose to note */
let freq = octNote.MidiCps; /* convert midi note to cycles per second */
let amp = Decay2(clock, 0.05 * clockTime, 2 * clockTime).MulAdd(0.1, 0.02); /* amplitude envelope */
let filt = Decay2(clock, 0.05 * clockTime, 2 * clockTime).MulAdd(SinOsc(0.17, 0) * 800, 1400); /* filter envelope scaled by Lfo */
CombN(
	Rlpf(
		Pulse( /* for better quality replace 'LfPulse' with 'Pulse' */
			freq,
			SinOsc(0.08, [0, 0.5.pi]).MulAdd(0.45, 0.5) /* pulse width LfO(s) */
		) * amp,
		filt,
		0.15 /* 1/Q */
	),
	0.2,
	[0.2, 0.17],
	1.5 /* max delay, actual delay(s), decay time */
)

/********** Aleatoric quartet ; mouse x controls density ; Jmcc **********/
let amp = 0.07;
let density = MouseX(0.01, 1, 0, 0.2); /* mouse determines density of excitation */
let dmul = density.Reciprocal * 0.5 * amp; /* calculate multiply and add for excitation probability */
let dadd = dmul.- + amp;
let signal = Sum( /* mix a list of 4 instruments */
	{
		/* if amplitude is below zero it is clipped, density determines the probability of being above zero */
		let excitation = PinkNoise() * Max(0, LfNoise1(8).MulAdd(dmul, dadd));
		let freq = Lag( /* lag the pitch so it glissandos between pitches */
			LfNoise0( /* use low freq step noise as a pitch control */
				[1, 0.5, 0.25].atRandom /* choose a frequency of pitch change */
			).MulAdd(7, /* +/- 7 semitones */
				66 + 30.Rand2 /* random center note */
			).RoundTo(1), /* round to nearest semitone */
			0.2 /* gliss time */
		).MidiCps; /* convert to hertz */
		EqPan2( /* pan each intrument */
			CombL(excitation, 0.02, 1 / freq, 3), /* comb delay simulates string */
			1.Rand2/* random pan position */
		)
	} ! 4
);
5.timesRepeat { signal := AllpassN(signal, 0.05, [0.05.Rand0, 0.05.Rand0], 1) }; /* add some reverb via allpass delays */
LeakDc(signal, 0.995) /* delays build up a lot of DC, so leak it out here. */

/********** Modal space ; mouse x controls discrete pitch in dorian mode ; Jmcc **********/
let mix = SinOsc( /* lead tone */
	(DegreeToKey(
		[0 2 3 5 7 9 10].asLocalBuf,
		MouseX(0, 15, 0, 0.2), /* mouse indexes into scale */
		12) /* 12 notes per octave */
		+ 72
		+ LfNoise1([3 3]).Times(0.04)).MidiCps,
	0) * 0.1
+ Rlpf(LfPulse([48 55].MidiCps, 0, 0.15), /* drone 5ths */
	SinOsc(0.1, 0).MulAdd(10, 72).MidiCps, 0.1).Times(0.1);
CombN(mix, 0.31, 0.31, 2) + mix
