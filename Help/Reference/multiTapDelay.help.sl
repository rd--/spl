# multiTapDelay

- _multiTapDelay(timesList, levelsList, in)_

Multi tap delay line. The last delay time is the cycle length, and will coincide with the input signal.

- timesList: an array of delay times in seconds.
- levelsList: an array of amplitudes.
- in: the input signal.

Two unequally spaced echoes:

```
let z = decay2(
	impulse(1 / 2, 0),
	0.01,
	0.1
) * pinkNoise();
[
	z,
	multiTapDelay(
		[0.5 1.25 1.5],
		[0.1 1 0],
		z
	)
]
```

Four equally spaced echoes, each louder than the last:

```
let z = decay2(
	dust(2),
	0.01,
	0.1
) * pinkNoise();
[
	z,
	multiTapDelay(
		[0.1 0.2 0.3 0.4 1],
		[0.1 0.2 0.8 1 0],
		z
	)
]
```

Four second cyclic pattern of four repeats:

```
let z = decay2(
	impulse(1 / 4, 0),
	0.01,
	0.1
) * pinkNoise();
[
	z,
	multiTapDelay(
		[0.5 1 1.9 2 4],
		[0.1 1 0.5 0.2 0],
		z
	)
]
```

* * *

See also: delayC, delayTap, delayWrite

Guides: Unit Generators

Categories: Delay
