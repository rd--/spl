# optimisedSum

- _optimisedSum(c)_

Sums the list of inputs _c_.
Unlike `sum`, implements optimization using the _Sum4_ primitive `Ugen`.

Sum a list of sawtooth oscillators:

```
[
	LfSaw(200.1, 0),
	LfSaw(500.2, 0),
	LfSaw(1200.3, 0),
	LfSaw(700.4, 0)
].optimisedSum * 0.04
```

The above is the same as this due to multichannel expansion:

```
LfSaw(
	[200.1 500.2 1200.3 700.4],
	0
).optimisedSum * 0.04
```

Sine oscillators:

```
[
	FSinOsc(600.2, 0),
	FSinOsc(622.0, 0),
	FSinOsc(641.3, 0),
	FSinOsc(677.7, 0)
].optimisedSum * 0.1
```

Sum nine oscillators, utilising two _Sum4_ Ugens and two `plus` Ugens:

```
SinOsc(
	{ Rand(111, 555) } ! 9,
	0
).optimisedSum / 27
```

Where supported, `optimisedSum` is displayed as ∑.

* * *

See also: Mix, sum, plus, +

Unicode: U+2211 ∑ N-Ary Summation

Categories: Ugen
