# isAdjacentFraction

- _isAdjacentFraction(p, q)_

Answer `true` if the fractions _p_ and _q_ are adjacent.

1/3 and 1/4 are adjacent:

```
>>> 1/3.isAdjacentFraction(1/4)
true

>>> (1/3 - 1/4).numerator
1
```

1/2 and 1/5 are not adjacent:

```
>>> 1/2.isAdjacentFraction(1/5)
false

>>> (1/2 - 1/5).numerator
3
```

* * *

See also: fareySequence, Fraction

References:
_Mathematica_
[1](https://mathworld.wolfram.com/AdjacentFraction.html)
