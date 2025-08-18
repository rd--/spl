# discreteDelta

- _discreteDelta(c)_

Answer the discrete delta of the collection _c_,
equal to `one` if the numbers all are `zero`,
and `zero` otherwise.

Evaluate numerically:

```
>>> [0 1].discreteDelta
0

>>> [0].discreteDelta
1

>>> [2.5 3.5].discreteDelta
0
```

Complex number inputs:

```
>>> [2J-1].discreteDelta
0
```

* * *

See also: boole, identityMatrix, isZero, kroneckerDelta

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DiscreteDelta.html)
