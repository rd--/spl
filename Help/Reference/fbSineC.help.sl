# fbSineC

- _fbSineC(freq, im, fb, a, c, xi, yi)_

Feedback sine with chaotic phase indexing.

- freq: iteration frequency in Hertz
- im: index multiplier amount
- fb: feedback amount
- a : phase multiplier amount
- c: phase increment amount
- xi: initial value of x
- yi: initial value of y

A cubic-interpolating sound generator based on the difference equations:

1. _xn+1 = sin(im*yn + fb*xn)_
2. _yn+1 = (ayn + c) % 2pi_

This uses a linear congruential function to drive the phase indexing of a sine wave.
For im = 1, fb = 0, and a = 1 a normal sinewave results.

Default initial parameters:

```
fbSineC(
	sampleRate() / 4,
	1,
	0.1,
	1.1,
	0.5,
	0.1,
	0.1
) * 0.1
```

Increase feedback:

```
fbSineC(
	sampleRate(),
	1,
	line(0.01, 4, 10),
	1,
	0.1,
	0.1,
	0.1
) * 0.1
```

Increase phase multiplier:

```
fbSineC(
	sampleRate(),
	1,
	0,
	xLine(1, 2, 10),
	0.1,
	0.1,
	0.1
) * 0.1
```

Modulate frequency and index multiplier:

```
fbSineC(
	lfNoise2(1) * 1000 + 1000,
	lfNoise2(1) * 16 + 17,
	1, 1.005, 0.7,
	0.1, 0.1
) * 0.1
```

Randomly modulate parameters:

```
fbSineC(
	lfNoise2([1, 2]) * 1000 + 10000,
	lfNoise2([1, 2]) * 32 + 33,
	lfNoise2([1, 2]) * 0.5,
	lfNoise2([1, 2]) * 0.05 + 1.05,
	lfNoise2([1, 2]) * 0.3 + 0.3,
	0.1,
	0.1
) * 0.05
```

* * *

See also: FbSineN, fbSineL

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/FBSineC.html)

Categories: Ugen, Chaos
