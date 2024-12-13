# Osc

- _Osc(bufNum, freq=440, phase=0)_

Interpolating wavetable oscillator.
Linear interpolating wavetable lookup oscillator with frequency and phase modulation inputs.

- bufnum: buffer index
- freq: frequency in hertz
- phase: phase offset or modulator in radians, within the range (-8, 8) * pi

This oscillator requires a buffer to be filled with a wavetable format signal.
This preprocesses the signal into a form which can be used efficiently by the oscillator.
The buffer size must be a power of two.

With small sine table:

```
let c = 128.sineTable(
	1 / 1:3,
	[0]
).normalizeSignal;
let b = c.asWavetable.asLocalBuf;
Osc(
	c,
	MouseX(222, 555, 1, 0.2),
	0
) * 0.1
```

With less small sine table:

```
let c = 2048.sineTable(
	1 / 1:128,
	[0]
).normalizeSignal
let b = c.asWavetable.asLocalBuf;
{
	Osc(
		b,
		SinOsc(
			{ Rand(3.3, 4.4) } ! 6,
			0
		) * 0.01 + 1 * [
			82 123 196 147 41 55
		],
		0
	).Sum
} !^ 3 / 17
```

* * *

See also: asLocalBuf, asWavetable, BufPlay, BufRd, Osc1, SinOsc

Categories: Ugen
