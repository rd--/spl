# expRandRange

- _expRandRange(low, high)_

Exponentially distributed random numbers in indicated range.
This is the continuous variant of `expRand`.

As amplitude:

```
sinOsc(440, 0) * expRandRange(
	0.01,
	lfNoise2(1 / 3).linLin(-1, 1, 0.01, 0.1)
)
```

As frequency:

```
sinOsc(
	expRandRange(
		333,
		lfNoise2(1 / 3).linLin(-1, 1, 333, 555)
	),
	0
) / 13
```

expRandRange must not touch zero:

```
expRandRange(
	sinOsc(0.1, 0).linLin(-1, 1, 0.1, 1),
	0.1
) - 1 * 0.1
```

* * *

See also: expRand

Guides: Unit Generators

Categories: Ugen, Math
