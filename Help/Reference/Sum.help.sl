# Sum

- _Sum(inputList)_

Sums a list of inputs.
Unlike `sum`, implements optimization using the `Sum4` primitive `Ugen`.

Sum a list of sawtooth oscillators:

```
[
	LfSaw(200.1, 0),
	LfSaw(500.2, 0),
	LfSaw(1200.3, 0),
	LfSaw(700.4, 0)
].Sum * 0.04
```

The above is the same as this due to multichannel expansion:

```
LfSaw(
	[200.1, 500.2, 1200.3, 700.4],
	0
).Sum * 0.04
```

Sine oscillators:

```
[
	FSinOsc(600.2, 0),
	FSinOsc(622.0, 0),
	FSinOsc(641.3, 0),
	FSinOsc(677.7, 0)
].Sum * 0.1
```

Sum nine oscillators, utilising two `Sum4` Ugens and two `Plus` Ugens:

```
SinOsc(
	{ Rand(111, 555) } ! 9,
	0
).Sum / 27
```

Where supported, `Sum` is displayed as ∑.

* * *

See also: Mix, sum, Sum4

Unicode: U+2211 ∑ N-Ary Summation

Categories: Ugen
