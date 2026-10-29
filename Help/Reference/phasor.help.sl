# phasor

- _phasor(trig, rate=1, start=0, end=1, resetPos=0)_

A resettable linear ramp between two levels.
`phasor` is a linear ramp between start and end values.
When triggered the `phasor` will jump to its reset position.
Upon reaching the end of its ramp `phasor` will wrap back to its start.
Note: Since end is defined as the wrap point, its value is never actually output.
`phasor` is commonly used as an index control with `bufRd` and `bufWr`.

- trig: when triggered, reset value to resetPos (default: 0, phasor outputs start initially)
- rate: the amount of change per sample i.e at a rate of 1 the value of each sample will be 1 greater than the preceding sample
- start: start point of ramp
- end: end point of ramp
- resetPos: the value to jump to upon receiving a trigger.

phasor controls sine frequency,
end frequency matches a second sine wave,
`linLin` converts range:

~~~spl syn=A
let rate = mouseX(0.2, 2, 1, 0.2);
let trig = impulse(rate, 0);
let sr = sampleRate();
let x = phasor(trig, rate / sr, 0, 1, 0);
sinOsc(
	[
		x.linLin(0, 1, 600, 1000),
		1000
	],
	0
) * 0.1
~~~

Two phasors control two sine frequencies.
`mouseX` controls trigger frequency and `mouseY` controls resetPos of the second:

~~~spl syn=B
let rate = mouseX(1, 200, 1, 0.2);
let trig = impulse(rate, 0);
let sr = sampleRate();
let x = phasor(
	trig,
	rate / sr,
	0,
	1,
	[
		0,
		mouseY(0, 1, 0, 0.2)
	]
);
sinOsc(x * 500 + 500, 0) * 0.2
~~~

Use phasor to index into a sound file.
Start and end here are defined as 0 and the number of frames in the buffer.
This means that the phasor will output values from 0 to numFrames - 1 before looping,
which is perfect for driving bufRd.
(See note above)

```spl SfAcquire
let b = SfAcquire('CrotaleD6', 1, [1]);
sfRead(
	b,
	phasor(
		1,
		sfRateScale(b),
		0,
		sfFrameCount(b),
		0
	),
	1,
	2
)
```

Two phasors control two sound file positions.
_mouseX_ controls trigger frequency and _mouseY_ controls resetPos of the second:

```spl SfAcquire
let b = SfAcquire('CrotaleD6', 1, [1]);
let rate = mouseX(0.1, 100, 1, 0.2);
let trig = impulse(rate, 0);
let bFrames = sfFrameCount(b);
let resetPos = [
	0,
	mouseY(0, bFrames, 0, 0.2)
];
let x = phasor(
	trig,
	sfRateScale(b),
	0,
	bFrames,
	resetPos
);
sfRead(b, x, 1, 2)
```

* * *

See also: Line

Guides: Unit Generators

References:
_Csound_
[1](https://csound.com/docs/manual/phasor.html)
[2](https://csound.com/docs/manual/trigphasor.html),
_Max_
[1](https://docs.cycling74.com/reference/gen_dsp_phasor/),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Phasor.html)

Categories: Ugen
