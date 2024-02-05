# Method Syntax

Rewrite rules:

- _x.f_ ⟹ _f(x)_
- _x.f(y, ...)_ ⟹ _f(x, y, ...)_

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

_Rationale_:
Method syntax can make writing from left to right simpler.
Extending _f(x)_ to _g(f(x), y)_ requires inserting characters to both the left and the right of the existing text.
Extending _f(x)_ to _f(x).g(y)_ requires inserting characters only at the right of the existing text.
Method syntax is particularly useful if the insertion cursor is already at the end of the existing text.

_Note:_
[Dictionary Syntax] allows _()_ to be the empty dictionary,
_().f_ means _f(())_.

* * *

Categories: Syntax
