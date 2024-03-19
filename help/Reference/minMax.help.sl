# minMax

- _minMax(aCollection)_
- _minMax(aMagnitude, firstMagnitude, secondMagnitude)_

The unary form scans for minimum and maximum in one pass returning the results as a two-element list.

The ternary form takes _aMagnitude_ or _firstMagnitude_, whichever is the lesser magnitude, and answers that or _secondMagnitude_, whichever is the greater magnitude.

Find the minimum and maximum of a `Range`:

```
>>> 1:4.minMax
[1 4]
```

Find the minimum and maximum of a `List`:

```
>>> [pi 1.3 e 10.sqrt].minMax
[1.3 10.sqrt]

>>> [3 1 2 5 4].minMax
[1 5]

>>> [3 3 3 3 3].minMax
[3 3]
```

* * *

See also: min, max

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MinMax.html)

Categories: Math
