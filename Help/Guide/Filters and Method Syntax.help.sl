# Filters and Method Syntax

In the program below randomly spaced impulses (`dust`) are scaled (`*`),
trigger an envelope (`decay`),
which shapes a noise generator (`pinkNoise`),
which is then filtered (`bpf`) and
echoed (`allpassN`).
The _lfo_ block generates quadratic noise (`lfNoise2`),
which in then scaled (`linLin`).

```
let lfo = { :freq :lo :hi |
	lfNoise2(freq).linLin(-1, 1, lo, hi)
};
dust([1, 3])
.*(1 / 4)
.decay((1 / 3).lfo(1 / 5, 5 / 7))
.*(pinkNoise())
.bpf(
	(1 / 3).lfo(700, 2300),
	(1 / 3).lfo(1 / 9, 3)
).allpassN(1 / 5, 1 / 5, lfo(1 / 3, 1 / 3, 3))
```

The same program written in applicative form with infix operators:

```
let lfo = { :freq :lo :hi |
	linLin(lfNoise2(freq), -1, 1, lo, hi)
};
allpassN(
	bpf(
		pinkNoise() * decay(
			dust([1, 3]) * 1 / 4,
			lfo(1 / 3, 1 / 5, 5 / 7)
		),
		lfo(1 / 3, 700, 2300),
		lfo(1 / 3, 1 / 9, 3)
	),
	1 / 5,
	1 / 5,
	lfo(1 / 3, 1 / 3, 3)
)
```
