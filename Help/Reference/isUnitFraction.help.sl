# isUnitFraction

- _isUnitFraction(n/d)_

A unit fraction has _n=1_.

```
>>> 1/3.isUnitFraction
true

>>> 2/5.isUnitFraction
false

>>> -1/3.isUnitFraction
false
```

The integers _d_ such that _1/d_ is a terminating decimal,
OEIS [A003592](https://oeis.org/A003592):

```
>>> let d = 1:100.select { :n |
>>> 	10.powerMod(n, n) = 0
>>> };
>>> (d, 1 / d)
(
	[
		 1  2  4  5   8
		10 16 20 25  32
		40 50 64 80 100
	],
	[
		1     0.5    0.25     0.2    0.125
		0.1   0.0625 0.05     0.04   0.03125
		0.025 0.02   0.015625 0.0125 0.01
	]
)
```

* * *

See also: Fraction, isSuperparticular

Guides: Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/UnitFraction.html),
_OEIS_
[1](https://oeis.org/A003592),
_W_
[1](https://en.wikipedia.org/wiki/Unit_fraction)


