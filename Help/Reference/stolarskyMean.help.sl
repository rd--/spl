# stolarskyMean

- _stolarskyMean(p, x, y)_

The Stolarsky mean is a function of two non-negative numbers _x_ and _y_ with parameter _p_.
It is a generalization of the logarithmic mean.

_p=-1_ is the geometric mean:

```
>>> stolarskyMean(-1, 3, 5)
3.87298

>>> [3 5].geometricMean
3.87298
```

_p=2_ is the arithmetic mean:

```
>>> stolarskyMean(2, 3, 5)
4

>>> [3 5].arithmeticMean
4
```

_p⟶0_ is the logarithmic mean:

```
>>> stolarskyMean(0.00001, 3, 5)
3.91523

>>> logarithmicMean(3, 5)
3.91523
```

* * *

See also: arithmeticMean, geometricMean, logarithmicMean

Guides: Statistics Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Stolarsky_mean)
