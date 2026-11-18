# stolarskyMean

- _stolarskyMean(p, x, y)_

The Stolarsky mean is a function of two non-negative numbers _x_ and _y_ with parameter _p_.
It is a generalization of the logarithmic mean.

_p=-1_ is the geometric mean:

```
>>> stolarskyMean(-1.0, 3.0, 5.0)
3.87298

>>> [3.0 5.0].geometricMean
3.87298
```

_p=2_ is the arithmetic mean:

```
>>> stolarskyMean(2.0, 3.0, 5.0)
4.0

>>> [3.0 5.0].arithmeticMean
4
```

_p⟶0_ is the logarithmic mean:

```
>>> stolarskyMean(0.00001, 3.0, 5.0)
3.91523

>>> logarithmicMean(3.0, 5.0)
3.91523
```

* * *

See also: arithmeticMean, geometricMean, logarithmicMean

Guides: Statistics Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Stolarsky_mean)
