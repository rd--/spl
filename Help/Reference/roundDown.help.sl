# roundDown

- _roundDown(n, α=1)_

Answer the number _n_ rounded down to a multiple of _α_.

```
>>> (1 / 1:10).collect { :n |
>>> 	[n, n.roundDown(0.025)]
>>> }
[
	1       1;
	0.5     0.5;
	0.3333  0.325;
	0.25    0.25;
	0.2     0.2;
	0.16666 0.15;
	0.14285 0.125;
	0.125   0.125;
	0.1111  0.1;
	0.1     0.1
]
```

If _α_ is elided it is set to `one`,
and the answer is the same as for `floor`:

```
>>> (1.9.roundDown, 1.9.floor)
(1, 1)

>>> (-1.9.roundDown, -1.9.floor)
(-2, -2)
```

* * *

See also: ceiling, floor, round, roundUp, truncate

Guides: Integer Functions, Rounding Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Rounding.html),
_W_
[2](https://en.wikipedia.org/wiki/Rounding)
