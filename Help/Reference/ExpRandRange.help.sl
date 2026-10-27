# ExpRandRange

- _ExpRandRange(low, high)_

Exponentially distributed random numbers in indicated range.
This is the continuous variant of `expRand`.

As amplitude:

```
SinOsc(440, 0) * ExpRandRange(
	0.01,
	LfNoise2(1 / 3).linLin(-1, 1, 0.01, 0.1)
)
```

As frequency:

```
SinOsc(
	ExpRandRange(
		333,
		LfNoise2(1 / 3).linLin(-1, 1, 333, 555)
	),
	0
) / 13
```

ExpRandRange must not touch zero:

```
ExpRandRange(
	SinOsc(0.1, 0).linLin(-1, 1, 0.1, 1),
	0.1
) - 1 * 0.1
```

* * *

See also: expRand

Guides: Unit Generators

Categories: Ugen, Math
