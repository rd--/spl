# Filters and Method Syntax

In the program below randomly spaced impulses (_Dust_) are scaled (_Mul_),
trigger an envelope (_Decay_),
which shapes a noise generator (_PinkNoise_),
which is then filtered (_Bpf_) and
echoed (_AllpassN_).
The _lfo_ block generates quadratic noise (_LfNoise2_),
which in then scaled (_Range_).

```
let lfo = { :freq :lo :hi |
	LfNoise2(freq).Range(lo, hi)
};
Dust([1, 3])
	.Mul(1 / 4)
	.Decay((1 / 3).lfo(1 / 5, 5 / 7))
	.Mul(PinkNoise())
	.Bpf((1 / 3).lfo(700, 2300), (1 / 3).lfo(1 / 9, 3))
	.AllpassN(1 / 5, 1 / 5, lfo(1 / 3, 1 / 3, 3))
```

The same program written in applicative form with infix operators:

```
let lfo = { :freq :lo :hi |
	Range(LfNoise2(freq), lo, hi)
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
