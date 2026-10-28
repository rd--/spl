/********** Analog bubbles ; Jmcc **********/
let f = lfSaw(0.4, 0).*+(24, lfSaw([8, 7.23], 0).*+(3, 80)).midiCps; /* glissando function */
combN(sinOsc(f, 0) * 0.04, 0.2, 0.2, 4) /* echoing sine wave */

/********** Lfo modulation of pulse waves and resonant filters ; Jmcc **********/
combL(
	rlpf(
		lfPulse(sinOsc(0.05, 0).*+(80, 160),0, 0.4) * 0.05,
		sinOsc([0.6, 0.7], 0).*+(3600, 4000),
		0.2
	),
	0.3, [0.2, 0.25], 2
)

/********** Moto rev ; Jmcc **********/
rlpf(lfPulse(sinOsc(0.2, 0).*+(10, 21), 0, 0.1), 100, 0.1).clip(-0.4, 0.4)

/********** Scratchy ; Jmcc **********/
rhpf(brownNoise([0.5] # 2, -0.49).max(0) * 20, 5000, 1)

/********** Sprinkler ; Jmcc **********/
bpz2(whiteNoise() * lfPulse(lfPulse(0.09, 0, 0.16).*+(10, 7), 0, 0.25) * 0.1)

/********** Sprinkler ; mouse ; Jmcc **********/
bpz2(whiteNoise() * lfPulse(mouseX(0.2, 50, 0, 0.2), 0, 0.25) * 0.1)

/********** Harmonic swimming ; Jmcc **********/
let f = 50; /* fundamental frequency */
let p = 20; /* number of partials per channel */
let z = 0; /* start of oscil daisy chain */
let offset = line(0, -0.02, 60); /* causes sound to separate and fade */
[1 .. p].do { :i |
	z := sinOsc(
		f * i,
		0
	).*+( /* freq of partial */
		max(
			0, /* clip negative amplitudes to zero */
			lfNoise1(
				6 + [rand(-4, 4), rand(-4, 4)]).*+( /* amplitude rate */
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
let trig = xLine([10, 10], 0.1, 60); /* trigger probability decreases over time */
[1 .. p].do { :i |
	z := sinOsc(
		f * i,
		0
	).*+( /* freq of partial */
		decay2(
			dust(trig) /* trigger rate */
			* 0.02, /* trigger amplitude */
			0.005, /* grain attack time */
			rand(0, 0.5) /* grain decay time */
		),
			z
	)
};
z

/********** Reso pulse ; Jmcc **********/
let z = { :tr |
	let f = tChoose(tr, [25 30 34 37 41 42 46 49 53 54 58 61 63 66]).midiCps;
	lfPulse(f, 0, 0.2) + lfPulse(2 * f + tRand(-0.5, 0.5, tr), 0, 0.2)
}.overlapTexture(4, 2, 4).sum;
let lfoFreq = 6;
let lfo = lfNoise0(lfoFreq).*+(1000, 1200);
let left = rlpf(
	z * 0.02,
	lfo, /* cutoff freq */
	mouseX(0.2, 0.02, 1, 0.2)
); /* filter bandwidth */
let delayTime = 2 / lfoFreq;
let right = delayN(left, delayTime, delayTime); /* delay right channel by two beats */
[left, right]

/********** Pulsing bottles ; Jmcc **********/
let n = 6; /* number of 'bottles' */
{
        eqPan2(
		resonz(
			whiteNoise() * lfPulse(4 + rand(0, 10), 0, rand(0, 0.7)) * 0.8 / n,
			400 + linRand(0, 7000, 0),
			0.01
		),
		sinOsc(0.1 + rand(0, 0.4), rand(0, 2.pi))
        )
} !> n

/********** What was I thinking? ; Jmcc **********/
let z = rlpf(
	pulse(
		max(
			sinOsc(4, 0) + 80,
			decay(lfPulse(0.1, 0, 0.05) * impulse(8, 500), 2)
		),
		lfNoise1(0.157).*+(0.4, 0.5)) * 0.04,
	lfNoise1(0.2).*+(2000, 2400),
	0.2
);
let y = z * 0.6;
z +  [
	combL(y, 0.06, lfNoise1(rand(0, 0.3)).*+(0.025, 0.035), 1)
	+
	combL(y, 0.06, lfNoise1(rand(0, 0.3)).*+(0.025, 0.035), 1),
	combL(y, 0.06, lfNoise1(rand(0, 0.3)).*+(0.025, 0.035), 1)
	+
	combL(y, 0.06, lfNoise1(rand(0, 0.3)).*+(0.025, 0.035), 1)
]

/********** Police state ; Jmcc **********/
let n = 4; /* number of sirens */
combL(
	{
		eqPan2(
			sinOsc(
				sinOsc(rand(0, 0.1) + 0.02, rand(0, 2.pi)).*+(rand(0, 600), 1000 + rand(-300, 300)),
				0
			) * lfNoise2(100 + rand(-20, 20)) * 0.1,
			rand(-1, 1)
		)
	} !> n
	+ lfNoise2(lfNoise2([0.4, 0.4]).*+(90, 620)).*(lfNoise2([0.3, 0.3]).*+(0.15, 0.18)),
	0.3, 0.3, 3
)

/********** analogue daze (commented) ; Jmcc **********/
/* define a function so that I can make a couple of copies of this instrument */
let anaSynFunc = { :octave :clockRate :pwmrate :fltrate |
	/* create a list of frequencies */
	let freqList = (
		[55, 63, 60, 63, 57, 65, 62, 65] /* specify in MIDI notes */
		+ (12 * octave) /* offset by octaves argument */
	).midiCps; /* convert to cycles per second */
	/* use a sequencer to step through the list of frequencies */
	let freq = sequencer(
		freqList,
		impulse(clockRate, 0) /* sequencer steps at each trigger from this oscillator */
	);
	/* analog VCO->VCF voice */
	rlpf( /* resonant lowpass filter */
		lfPulse( /* pulse wave oscillator input to filter */
			lag( /* take the frequency and use a lag filter to make it glide */
				freq, /* from one pitch to another */
				0.05 /* lag time */
			), 0,
			sinOsc( /* pulse width modulator LfO */
				pwmrate, /* LfO rate */
				rand(0, 2.pi)
			).*+( /* random initial phase */
				0.4, 0.5
			) /* scale and offset give pulse widths from 0.1 to 0.9 */
		) * 0.1, /* pulse oscillator amplitude */
		sinOsc( /* filter cutoff freq LfO */
			fltrate, /* LfO rate */
			rand(0, 2.pi)
		).*+( /* random initial phase */
			1400, 2000
		), /* scale and offset give cutoff freq from 600 to 3400 Hz */
		1 / 15 /* 1/Q */
	)
}; /* end of function definition f */
/* analogue snare drum */
let snare = decay( /* an exponential decay envelope */
	impulse(2, 0), /* impulses trigger envelope at 2 beats per second */
	0.15
).*( /* 0.15 seconds to decay by 60 dB */
	lfNoise0( /* step noise used as snare sound */
		lfNoise1(0.3).*+(6000, 8000)) * /* sweep the noise frequency between 2000 and 14000 Hz */
	[0.07, 0.07] /* amplitude (in stereo, causes whole snare subpatch to be stereo, see MultiChannel.help) */
);
/* create two copies of sequencer patch in separate channels */
let g = [ /* call function f to create each instrument */
	anaSynFunc(1, 8, 0.31, 0.2), /* +1 octave,  8 clocks per second, PWM rate, rlpf rate */
	anaSynFunc(0, 2, 0.13, 0.11) /* +0 octaves, 2 clocks per second, PWM rate, rlpf rate */
] + snare; /* add to snares */
/* comb delay of input plus dry stereo pair reverse */
let z = 0.4 * ( /* scale delayed part down */
	combN( /* feedback delay */
		g, /* input dry signal */
		0.375, 0.375, /* 3 / 8 second delay */
		5 /* 5 second 60dB decay time */
	)
	+ g.reverse); /* add dry stereo pair with the channels reverse */
let e = envLinen(2, 56, 2, 1, -4); /* one minute trapezoid envelope */
z * envGen(1, 1, 0, 1, 2, e) /* wrap a one minute envelope around entire sound */

/********** Analogue daze (un-commented) ; Jmcc **********/
let pattern = [55 63 60 63 57 65 62 65];
let f = { :octave :clockRate :pwmrate :fltrate |
	rlpf(
		lfPulse(
			lag(
				sequencer(
					((pattern + (12 * octave)).midiCps), /* sequencer pattern */
					impulse(clockRate, 0) /* sequencer trigger */
				),
				0.05 /* lag time coefficient */
			),
			0,
			sinOsc(pwmrate, rand(0, 2.pi)).*+(0.4, 0.5) /* pulse width modulator */
		) * 0.1, /* pulse amplitude */
		sinOsc(fltrate, rand(0, 2.pi)).*+(1400, 2000), /* cutoff freq LfO */
		1 / 15
	)
};
let x = decay(impulse(2, 0), 0.15) * lfNoise0(lfNoise1(0.3).*+(6000, 8000)) * [0.07, 0.07];
let g = [f(1, 8, 0.31, 0.2), f(0, 2, 0.13, 0.11)] + x;
let z = 0.4 * (combN(g, 0.375, 0.375, 5) + g.reverse);
let e = envLinen(2, 56, 2, 1, -4); /* one minute trapezoid envelope */
z * envGen(1, 1, 0, 1, 2, e) /* wrap a one minute envelope around entire sound */

/********** synthetic piano ; Jmcc **********/
let n = 6; /* number of keys playing */
{ /* mix an list of notes */
	let pitch = (36 + rand(0, 54)); /* calculate delay based on a random note */
	let strike = impulse(0.1 + rand(0, 0.4), 0) * 0.1; /* random period for each key */
	let hammerEnv = decay2(strike, 0.008, 0.04); /* excitation envelope */
	eqPan2(
		/* list of 3 strings per note */
		[1 .. 3].collect { :i |
			/* detune strings, calculate delay time */
			let detune = [-0.05, 0, 0.04].at(i);
			let delayTime = 1 / (pitch + detune).midiCps;
			/* each string gets own exciter */
			let hammer = lfNoise2(3000) * hammerEnv; /* 3000 Hz was chosen by ear */
			combL(
				hammer, /* used as a string resonator */
				delayTime, /* max delay time */
				delayTime, /* actual delay time */
				6 /* decay time of string */
			)
		},
		(pitch - 36) / 27 - 1 /* pan position: lo notes left, hi notes right */
	).sum
} !> n

/********** Strummable silk ; Jmcc **********/
let mousex = mouseX(0, 1, 0, 0.2);
let out = [1 .. 8].collect { :ix |
	let n = 15;
	/* place trigger points from 0.25 to 0.75 */
	let trigger = hpz1(mousex > (0.25 + (ix - 1 * 0.07))).abs;
	let pluck = pinkNoise() * decay(impulse(14, 0).*(lag(trig(trigger, 1), 0.2) * 0.01), 0.04);
	let freq = ([-2 0 3 5 7 10 12 15].at(ix) + 60).midiCps;
	let metal = ringzBank(
		pluck,
		[1 .. n] * freq, /* frequencies */
		nil, /* amplitudes default to 1.0 */
		{ rand(0.3, 1.0) } ! n /* ring times */
	);
	eqPan2(metal, ix * 0.2 - 0.5)
}.sum.lpf(12000).leakDc(0.995);
6.timesRepeat {
	out := allpassN(out, 0.1, [rand(0, 0.05), rand(0, 0.05)], 4)
};
out

/********** Reverberated sine percussion ; Jmcc **********/
let d = 10; /* number of percolators */
let c = 7; /* number of comb delays */
let a = 4; /* number of allpass delays */
let s = sum({ resonz(dust(2 / d) * 50, 200 + rand(0, 3000), 0.003) } ! d); /* sine percolation sound */
let z = delayN(s, 0.048, 0.048); /* reverb predelay time */
let y = sum(combL(z, 0.1, lfNoise1({ rand(0, 0.1) } ! c).*+(0.04, 0.05), 15)); /* 7 length modulated comb delays in parallel */
a.timesRepeat { /* chain of 4 allpass delays on each of two channels (8 total) */
	y := allpassN(y, 0.050, [rand(0, 0.050), rand(0, 0.050)], 1)
};
s + (0.2 * y) /* add original sound to reverb and play it */

/********** Reverberated noise bursts ; Jmcc **********/
let s = decay(dust(0.6) * 0.2, 0.15) * pinkNoise(); /* pink noise percussion sound */
let z = delayN(s, 0.048, 0.048); /* reverb predelay time */
let y = sum(combL(z, 0.1, lfNoise1({ rand(0, 0.1) } ! 6).*+(0.04, 0.05), 15)); /* 6 modulated comb delays in parallel */
4.timesRepeat { /* chain of 4 allpass delays on each of two channels (8 total) */
	y := allpassN(y, 0.050, [rand(0, 0.05), rand(0, 0.05)], 1)
};
s + y /* add original sound to reverb and play it */

/********** Mouse control ; Jmcc **********/
sinOsc(mouseX(200, 2000, 1, 0.2), 0) * 0.1

/********** Analog bubbles ; with mouse control ; Jmcc **********/
let freq = lfSaw(
	mouseY(0.1, 10, 1, 0.2), 0
).*+( /* lfo 1 rate */
	24, /* lfo 1 depth in semitones */
	/* lfo 2 in lfo 1's add input */
	lfSaw(
		mouseX(2, 40, 1, 0.2), 0
	).*+( /* lfo 2 rate */
		-3, 80 /* lfo 2 depth & offset in semitones */
	)
).midiCps; /* convert to frequency */
combN(sinOsc(freq, 0) * 0.04, 0.2, 0.2, 2) /* echoing sine wave */

/********** Input thru ; Jmcc **********/
audioIn([1, 2])

/********** distort input ; Jmcc **********/
let gain = mouseX(1, 100, 1, 0.2); /* mouse x controls gain into distortion */
audioIn([1, 2]).*(gain).distort * 0.4

/********** Ring modulate input ; Jmcc **********/
let input = audioIn([1, 2]);
let modulator = sinOsc(
	mouseX(10, 4000, 1, 0.2), /* mouse x controls ring mod freq */
	[0, 0.5.pi] /* offset phase ofone osc by 90 degrees */
);
input * modulator

/********** Ring modulate input using ring1 ; Jmcc **********/
let input = audioIn([1, 2]) * 0.5;
let modulator = sinOsc(
	mouseX(10, 4000, 1, 0.2), /* mouse x controls ring mod freq */
	[0, 0.5.pi] /* offset phase ofone osc by 90 degrees */
);
input.ring1(modulator)

/********** Filter the input ; Jmcc **********/
let rQ = mouseY(0.01, 1, 1, 0.2); /* bandwidth ratio = 1/Q */
rlpf(
	audioIn([1, 2]) * 0.4 * rQ.signedSqrt, /* attenuate to offset resonance */
	mouseX(100, 12000, 1, 0.2), /* mouse x controls cutoff freq */
	rQ
)

/********** Input noise gate ; Jmcc **********/
let input = audioIn([1, 2]);
compander(
	input, input,
	mouseX(0.01, 0.5, 0, 0.2), /* threshold */
	10, /* below threshold slope */
	1, /* above threshold slope */
	0.01, 0.1
)

/********** Pitch shift input ; Jmcc **********/
pitchShift(
	audioIn([1, 2]) * 0.5, /* stereo audio input */
	0.04, /* grain size */
	mouseX(0, 2, 0, 0.2), /* mouse x controls pitch shift ratio */
	0, /* pitch dispersion */
	0.004/* time dispersion */
)

/********** Use pitchShift to granulate input ; upper left corner is normal playback ; Jmcc **********/
let grainSize = 0.1;
pitchShift(
	audioIn([1, 2]) * 0.5,
	grainSize,
	1, /* nominal pitch rate = 1 */
	mouseX(0, 1, 0, 0.2), /* pitch dispersion */
	mouseY(0, grainSize, 0, 0.2) /* time dispersion */
)

/********** Echo input ; Jmcc **********/
let in = audioIn([1, 2]) * 0.1;
combL(
	in,
	0.5, /* max delay time */
	mouseX(0, 0.5, 0, 0.2), /* mouse x controls delay time */
	4 /* echo 60 dB decay time in seconds */
) + in /* mix with input */

/********** Ring modulate & echo input ; Jmcc **********/
let in = audioIn([1, 2]) * 0.4 * sinOsc(mouseX(10, 2000, 1, 0.2), [0, 0.5.pi]);
combL(
	in,
	0.5,
	mouseY(0, 0.5, 0, 0.2), /* mouse y controls delay time */
	4 /* echo 60 dB decay time in seconds */
) + in /* mix with input */

/********** Ring modulated and resonant filtered input ; Jmcc **********/
let input = audioIn([1, 2]) * 0.2;
let modulator = sinOsc(
	mouseX(10, 4000, 1, 0.2), /* mouse x controls ring mod freq */
	[0, 0.5.pi] /* offset phase ofone osc by 90 degrees */
);
rlpf(
	input * modulator, /* do ring modulation */
	mouseY(100, 12000, 1, 0.2), /* mouse y controls cutoff freq */
	0.1 /* bandwidth ratio = 1/Q */
)

/********** distort, ring modulate & echo input, a real noise fest ; Jmcc **********/
let in = (audioIn([1, 2]) * 20).distort.ring1(
	sinOsc(mouseX(10, 2000, 1, 0.2), [0, 0.5.pi])
) * 0.02;
combL(
	in,
	0.5,
	mouseY(0, 0.5, 0, 0.2), /* mouse y controls delay time */
	4
) + in

/********** sweep verb ; Jmcc **********/
let s = audioIn([1, 2]) * 0.01;
let z = delayN(s.sum, 0.048, 0.048); /* reverb predelay time */
let y = combL(z, 0.1, lfNoise1({ rand(0, 0.1) } ! 6).*+(0.04, 0.05), 15).sum; /* 6 modulated comb delays in parallel */
4.timesRepeat { /* chain of 4 allpass delays on each of two channels (8 total) */
	y := allpassN(y, 0.050, [rand(0, 0.050), rand(0, 0.050)], 1)
};
leakDc(y, 0.995) /* eliminate DC */

/********** Monastic resonance ; mouse controls size and reverb time ; Jmcc **********/
let decayTime = mouseX(0, 16, 0, 0.2);
let delayScale = mouseY(0.01, 1, 0, 0.2);
let s = audioIn([1, 2]) * 0.005;
let z = delayN(sum(s), 0.048, 0.048); /* reverb predelay time */
let y = sum(combL(z, 0.1, { rand(-0.04, 0.04) + 0.05 } ! 8 * delayScale, decayTime)); /* 8 comb delays in parallel */
5.timesRepeat { /* chain of 5 allpass delays on each of two channels (10 total) */
	y := allpassN(y, 0.050, [rand(0, 0.050), rand(0, 0.050)], 1)
};
leakDc(y, 0.995) /* eliminate DC */

/********** Berlin 1977 ; mouse x controls clock rate ; Jmcc **********/
let clockRate = mouseX(5, 20, 1, 0.2);
let clockTime = 1 / clockRate;
let clock = impulse(clockRate, 0); /* sequencer trigger */
let patternList = [55 60 63 62 60 67 63 58];
let note = sequencer(patternList, clock); /* midi note pattern sequencer */
let octNote = sequencer( /* every 16 beats transpose somewhat randomly */
	[-12 -7 -5 0 2 5].shuffle, /* function called at each trigger */
	pulseDivider(clock, 16, 0) /* divide clock by 16 */
) + note; /* add transpose to note */
let freq = octNote.midiCps; /* convert midi note to cycles per second */
let env = decay2(clock, 0.05 * clockTime, 2 * clockTime);
let amp = env.*+(0.1, 0.02); /* amplitude envelope */
let filt = env.*+(sinOsc(0.17, 0) * 800, 1400); /* filter envelope scaled by Lfo */
combN(
	rlpf(
		pulse( /* for better quality replace 'LfPulse' with 'Pulse' */
			freq,
			sinOsc(0.08, [0, 0.5.pi]).*+(0.45, 0.5) /* pulse width LfO(s) */
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
let density = mouseX(0.01, 1, 0, 0.2); /* mouse determines density of excitation */
let dmul = density.reciprocal * 0.5 * amp; /* calculate multiply and add for excitation probability */
let dadd = dmul.- + amp;
let signal = sum( /* mix a list of 4 instruments */
	{
		/* if amplitude is below zero it is clipped, density determines the probability of being above zero */
		let excitation = pinkNoise() * max(0, lfNoise1(8).*+(dmul, dadd));
		let freq = lag( /* lag the pitch so it glissandos between pitches */
			lfNoise0( /* use low freq step noise as a pitch control */
				[1, 0.5, 0.25].atRandom /* choose a frequency of pitch change */
			).*+(7, /* +/- 7 semitones */
				66 + rand(-30, 30) /* random center note */
			).round(1), /* round to nearest semitone */
			0.2 /* gliss time */
		).midiCps; /* convert to hertz */
		eqPan2( /* pan each intrument */
			combL(excitation, 0.02, 1 / freq, 3), /* comb delay simulates string */
			rand(-1, 1)/* random pan position */
		)
	} ! 4
);
5.timesRepeat { signal := allpassN(signal, 0.05, [rand(0, 0.05), rand(0, 0.05)], 1) }; /* add some reverb via allpass delays */
leakDc(signal, 0.995) /* delays build up a lot of DC, so leak it out here. */

/********** Modal space ; mouse x controls discrete pitch in dorian mode ; Jmcc **********/
let mix = sinOsc( /* lead tone */
	(
		[0 2 3 5 7 9 10].localBuf.degreeToKey(
			mouseX(0, 15, 0, 0.2), /* mouse indexes into scale */
			12 /* 12 notes per octave */
		) + 72 + lfNoise1([3 3]).*(0.04)
	).midiCps,
	0
) * 0.1 + rlpf(
	lfPulse([48 55].midiCps, 0, 0.15), /* drone 5ths */
	sinOsc(0.1, 0).*+(10, 72).midiCps, 0.1
).*(0.1);
combN(mix, 0.31, 0.31, 2) + mix
