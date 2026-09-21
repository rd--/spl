# tau

- _tau(n, m)_

Answer _n_ times `tau`,
the ratio of a circles circumference to its radius,
and approximately equal to _6.283185_.

Decimal expansion of τ,
OEIS [A019692](https://oeis.org/A019692):

```
>>> 1.tau
6.283185307179586
```

`tau` threads over collections:

```
>>> [0.25 0.5 0.75].tau
[1.5708 3.141592 4.71239]
```

Continued fraction for τ,
OEIS [A058291](https://oeis.org/A058291):

```
>>> 1.tau.continuedFraction(13)
[6 3 1 1 7 2 146 3 6 1 1 2 7]
```

The binary case answers a `Decimal` value with _m_ decimal places:

```
>>> 1.tau(34)
6.2831853071795864769252867665590057D
```

Tau is also stored as a named constant with higher precision,
and this stored value gives the upper limit for _m_:

```
>>> let n = 'Tau';
>>> let k = n.namedConstant;
>>> (k, k.scale)
(6.283185, 98)
```

The Base-60 (Babylonian or sexagesimal) expansion of τ,
OEIS [A091649](https://oeis.org/A091649):

```
>>> 1.tau(98).realDigits(60, 56).first
[
	 6 16 59 28  1 34 51 46 14 49
	55 12 35 26  8 58 14 20  7 22
	35 45 12 24 29 13 29 43 40 31
	 6 14 47 58 18 27 36 44 24 43
	30 45 53 35 19 28 57 15 56 46
	42 23 53  6 45 21
]
```

`tau` is not defined as a constant, unlike `Infinity` and `NaN`.

Where supported `tau` is displayed as τ.

* * *

See also: e, pi

Guides: Mathematical Constants

References:
_W_
[1](https://en.wikipedia.org/wiki/Tau_(mathematics))

Unicode: U+03C4 τ Greek Small Letter Tau

Categories: Math, Constant
