# Phasor

- _Phasor(trig, rate=1, start=0, end=1, resetPos=0)_

A resettable linear ramp between two levels.
`Phasor` is a linear ramp between start and end values.
When triggered the `Phasor` will jump to its reset position.
Upon reaching the end of its ramp `Phasor` will wrap back to its start.
Note: Since end is defined as the wrap point, its value is never actually output.
`Phasor` is commonly used as an index control with `BufRd` and `BufWr`.

- trig: when triggered, reset value to resetPos (default: 0, Phasor outputs start initially)
- rate: the amount of change per sample i.e at a rate of 1 the value of each sample will be 1 greater than the preceding sample
- start: start point of ramp
- end: end point of ramp
- resetPos: the value to jump to upon receiving a trigger.

Phasor controls sine frequency,
end frequency matches a second sine wave,
`LinLin` converts range:

```
let rate = MouseX(0.2, 2, 1, 0.2);
let trig = Impulse(rate, 0);
let sr = SampleRate();
let x = Phasor(trig, rate / sr, 0, 1, 0);
SinOsc(
	[
		x.LinLin(0, 1, 600, 1000),
		1000
	],
	0
) * 0.1
```

Two phasors control two sine frequencies.
`MouseX` controls trigger frequency and `MouseY` controls resetPos of the second:

```
let rate = MouseX(1, 200, 1, 0.2);
let trig = Impulse(rate, 0);
let sr = SampleRate();
let x = Phasor(
	trig,
	rate / sr,
	0,
	1,
	[
		0,
		MouseY(0, 1, 0, 0.2)
	]
);
SinOsc(x * 500 + 500, 0) * 0.2
```

Use phasor to index into a sound file.
Start and end here are defined as 0 and the number of frames in the buffer.
This means that the Phasor will output values from 0 to numFrames - 1 before looping,
which is perfect for driving BufRd.
(See note above)

```spl SfAcquire
let b = SfAcquire('CrotaleD6', 1, [1]);
SfRead(
	b,
	Phasor(
		1,
		SfRateScale(b),
		0,
		SfFrameCount(b),
		0
	),
	1,
	2
)
```

Two phasors control two sound file positions.
_MouseX_ controls trigger frequency and _MouseY_ controls resetPos of the second:

```spl SfAcquire
let b = SfAcquire('CrotaleD6', 1, [1]);
let rate = MouseX(0.1, 100, 1, 0.2);
let trig = Impulse(rate, 0);
let bFrames = SfFrameCount(b);
let resetPos = [
	0,
	MouseY(0, bFrames, 0, 0.2)
];
let x = Phasor(
	trig,
	SfRateScale(b),
	0,
	bFrames,
	resetPos
);
SfRead(b, x, 1, 2)
```

* * *

See also: Line

References:
_Csound_
[1](https://csound.com/docs/manual/phasor.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Phasor.html)

Categories: Ugen
