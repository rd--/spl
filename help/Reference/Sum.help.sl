# Sum

- _Sum(inputList)_

Sums a list of inputs.
Unlike _sum_, implements optimization using the _Sum4_ primitive Ugen.

Sum a list of sawtooths:

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
LfSaw([200.1, 500.2, 1200.3, 700.4], 0).Sum * 0.04
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

Sum nine oscillators, utilising two _Sum4_ Ugens and two _Add_ Ugens:

```
SinOsc({ Rand(111, 555) } ! 9, 0).Sum / 27
```

* * *

See also: Mix, sum, Sum4
