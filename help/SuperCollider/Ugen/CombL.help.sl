(* CombL ; array expansion (interior duplication) *)
let n = 8;
EqPan2(
	CombL(
		{ Dust(1) * 0.3 } ! n,
		0.01,
		{ Rand(0.0040, 0.0043) } ! n,
		4
	),
	{ Rand(-1, 1) } ! n
).Mix

(* CombL ; exterior duplication *)
let n = 8;
{
	EqPan(
		CombL(
			Dust(1) * 0.3,
			0.01,
			Rand(0.0040, 0.0043),
			4
		),
		Rand(-1, 1)
	)
} !+ n

(* CombC ; https://sccode.org/1-5fc ; requires=AudioIn ; warning=feedback *)
let reverb = { :input |
	let c = CombL(input, 0.1, SinOsc(0.01, 0) * 0.03 + 0.07, 5) * 0.7;
	XFade2(Lpf(c, 4800), input, -0.5, 0.3)
};
reverb(AudioIn([1, 2]) * 0.1)

(* CombL ; simplistic karplus-strong synthesis (adc) *)
let freq = 440;
let repeatFreq = 0.3;
let exciter = Decay(Impulse(repeatFreq, 0), 0.01) * PinkNoise();
let string = CombL(exciter, 0.1, 1 / freq, 3);
[string, LeakDc(string, 0.995)]

(* CombL ; karplus-strong ; mouse control (adc) *)
let freq = MouseX(220, 1760, 1, 0.2);
let repeatFreq = 0.3;
let exciter = Decay(Impulse(repeatFreq, 0), 0.02) * PinkNoise();
let string = CombL(exciter, 0.1, 1 / freq, 3);
[string, LeakDc(string, 0.995)]

(* CombL ; karplus-strong ; very small frequency range ; note changes in sound quality of the decay (adc) *)
let freq = MouseX(220, 1760, 1, 0.2);
let delayTime = MouseX(1 / 100, 1 / (100 + 2), 0, 0.1);
let repeatFreq = 0.3;
let exciter = Decay(Impulse(repeatFreq, 0), 0.02) * PinkNoise();
let string = CombL(exciter, 0.1, delayTime, 3);
[string, LeakDc(string, 0.995)]

(* CombL ; simplistic karplus-strong synthesis (adc) ; requires=keywords *)
let freq = 440;
let repeatFreq = 0.3;
let exciter = Decay(
	in: Impulse(
		freq: repeatFreq,
		phase: 0
	),
	decayTime: 0.01
) * PinkNoise();
let string = CombL(
	in: exciter,
	maxDelayTime: 0.1,
	delayTime: 1 / freq,
	decayTime: 3
);
[
	string,
	LeakDc(
		in: string,
		coef: 0.995
	)
]
