# SinOsc

- _SinOsc(freq=440, phase=0)_

Interpolating sine wavetable oscillator.
This is the same as Osc except that the table is a sine table of 8192 entries.

- freq: frequency in Hertz
- phase: phase offset or modulator in radians

Constant frequency:

```
SinOsc(200, 0) * 0.25
```

Modulate freq:

```
SinOsc(
	XLine(2000, 200, 1),
	0
) * 0.25
```

Modulate freq:

```
SinOsc(
	SinOsc(
		XLine(1, 1000, 9),
		0
	) * 200 + 800,
	0
) * 0.25
```

Modulate phase:

```
SinOsc(
	800,
	SinOsc(
		XLine(1, 1000, 9),
		0
	) * 2.pi
) * 0.25
```

* * *

See also: FSinOsc, Klang, Osc, PmOsc, Pulse, Saw, SinOscFb

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/SinOsc.html)

Categories: Ugen, Oscillator
