# supersilverRatio

- _supersilverRatio(aNumber)_

Answer _aNumber_ times the supersilver ratio, written ς.

The supersilver ratio is a geometrical proportion close to 75/34:

```
>>> (1.supersilverRatio, 75 / 34)
(2.2056, 2.2059)
```

Its true value is the real solution of the equation _x ^ 3 = 2 * (x ^ 2) + 1_:

```
>>> let x = 1.supersilverRatio;
>>> 2 * (x ^ 2) + 1
(x ^ 3)
```

The continued fraction:

```
>>> 1.supersilverRatio
>>> .continuedFraction(11)
[2 4 1 6 2 1 1 1 1 1 1]
```

* * *

See also: silverRatio, supergoldenRatio

Guides: Mathematical Constants

Unicode: U+003C2 ς Greek Small Letter Final Sigma

References:
_OEIS_
[1](https://oeis.org/A356035),
_W_
[1](https://en.wikipedia.org/wiki/Supersilver_ratio)

Categories: Math, Constant
