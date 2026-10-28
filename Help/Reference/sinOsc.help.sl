# sinOsc

- _sinOsc(freq=440, phase=0)_

Interpolating sine wavetable oscillator.
This is the same as osc except that the table is a sine table of 8192 entries.

- freq: frequency in Hertz
- phase: phase offset or modulator in radians

Constant frequency,
a list specifies two oscillators,
one of the frequencies is specified as a `LargeInteger`:

```
sinOsc([200 201L], 0) * 0.25
```

Modulate freq:

```
sinOsc(
	xLine(2000, 200, 1),
	0
) * 0.25
```

Modulate freq:

```
sinOsc(
	sinOsc(
		xLine(1, 1000, 9),
		0
	) * 200 + 800,
	0
) * 0.25
```

Modulate phase:

```
sinOsc(
	800,
	sinOsc(
		xLine(1, 1000, 9),
		0
	) * 2.pi
) * 0.25
```

* * *

See also: fSinOsc, klang, osc, pmOsc, pulse, saw, sinOscFb

Guides: Unit Generators

References:
_Max_
[1](https://docs.cycling74.com/reference/gen_dsp_cycle/),
_SuperCollider_
[1](https://doc.sccode.org/Classes/SinOsc.html)

Categories: Ugen, Oscillator
