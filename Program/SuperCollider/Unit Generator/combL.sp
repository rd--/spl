/* combL ; list expansion (interior duplication) */
let n = 8;
eqPan2(
	combL(
		{ dust(1) * 0.3 } ! n,
		0.01,
		{ rand(0.0040, 0.0043) } ! n,
		4
	),
	{ rand(-1, 1) } ! n
).mix

/* combL ; exterior duplication */
let n = 8;
{
	eqPan(
		combL(
			dust(1) * 0.3,
			0.01,
			rand(0.0040, 0.0043),
			4
		),
		rand(-1, 1)
	)
} !+ n

/* combC ; https://sccode.org/1-5fc ; requires=AudioIn ; warning=feedback */
let reverb = { :input |
	let c = combL(input, 0.1, sinOsc(0.01, 0) * 0.03 + 0.07, 5) * 0.7;
	xFade2(lpf(c, 4800), input, -0.5, 0.3)
};
reverb(audioIn([1, 2]) * 0.1)

/* combL ; simplistic karplus-strong synthesis (adc) */
let freq = 440;
let repeatFreq = 0.3;
let exciter = decay(impulse(repeatFreq, 0), 0.01) * pinkNoise();
let string = combL(exciter, 0.1, 1 / freq, 3);
[string, leakDc(string, 0.995)]

/* combL ; karplus-strong ; mouse control (adc) */
let freq = mouseX(220, 1760, 1, 0.2);
let repeatFreq = 0.3;
let exciter = decay(impulse(repeatFreq, 0), 0.02) * pinkNoise();
let string = combL(exciter, 0.1, 1 / freq, 3);
[string, leakDc(string, 0.995)]

/* combL ; karplus-strong ; very small frequency range ; note changes in sound quality of the decay (adc) */
let freq = mouseX(220, 1760, 1, 0.2);
let delayTime = mouseX(1 / 100, 1 / (100 + 2), 0, 0.1);
let repeatFreq = 0.3;
let exciter = decay(impulse(repeatFreq, 0), 0.02) * pinkNoise();
let string = combL(exciter, 0.1, delayTime, 3);
[string, leakDc(string, 0.995)]

/* combL ; simplistic karplus-strong synthesis (adc) ; requires=keywords */
let freq = 440;
let repeatFreq = 0.3;
let exciter = decay(
	in: impulse(
		freq: repeatFreq,
		phase: 0
	),
	decayTime: 0.01
) * pinkNoise();
let string = combL(
	in: exciter,
	maxDelayTime: 0.1,
	delayTime: 1 / freq,
	decayTime: 3
);
[
	string,
	leakDc(
		in: string,
		coef: 0.995
	)
]
