# Filters and Method Syntax

In the program below randomly spaced impulses (`Dust`) are scaled (`Mul`),
trigger an envelope (`Decay`),
which shapes a noise generator (`PinkNoise`),
which is then filtered (`Bpf`) and
echoed (`AllpassN`).
The _lfo_ block generates quadratic noise (`LfNoise2`),
which in then scaled (`LinLin`).

```
let lfo = { :freq :lo :hi |
	LfNoise2(freq).LinLin(-1, 1, lo, hi)
};
Dust([1, 3])
.Times(1 / 4)
.Decay((1 / 3).lfo(1 / 5, 5 / 7))
.Times(PinkNoise())
.Bpf((1 / 3).lfo(700, 2300), (1 / 3).lfo(1 / 9, 3))
.AllpassN(1 / 5, 1 / 5, lfo(1 / 3, 1 / 3, 3))
```

The same program written in applicative form with infix operators:

```
let lfo = { :freq :lo :hi |
	LinLin(LfNoise2(freq), -1, 1, lo, hi)
};
AllpassN(
	Bpf(
		PinkNoise() * Decay(
			Dust([1, 3]) * 1 / 4,
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
