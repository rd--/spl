# resultant

The `resultant` of two polynomials:

```
>>> [7 -2 1].resultant([5 -1 0 1])
265
```

Decide whether two polynomials have common roots,
the `resultant` vanishes exactly when the polynomials have roots in common:

```
>>> [3 -7 -5 1].resultant([-11 9 -8 1])
-10321

>>> [14 -7 -5 1].resultant([58 9 -8 1])
0

>>> [-1 0 0 1].resultant([-1 2 2 1])
16

>>> [-1 0 0 1].resultant([1 2 2 1])
0
```

* * *

See also: sylvesterMatrix

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Resultant.html)
[2](https://reference.wolfram.com/language/ref/Resultant.html),
_W_
[1](https://en.wikipedia.org/wiki/Resultant)
