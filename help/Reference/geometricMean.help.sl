# geometricMean

- _geometricMean(aCollection)_

The `product` of _aCollection_ raised to the `reciprocal` of its `size`.

```
>>> [5 2 4 12].geometricMean
2 * (30 ^ (1 / 4))

>>> [10 1 3 15].geometricMean
2 ^ (1 / 4) * 15.sqrt

>>> 1:4.geometricMean
(2 ^ (3 / 4)) * (3 ^ (1 / 4))

>>> 1:4.geometricMean
2.21336
```

Find the geometric mean for the heights of children in a class.

```
>>> [
>>> 	134 143 131 140 145 136 131 136 143
>>> 	136 133 145 147 150 150 146 137 143
>>> 	132 142 145 136 144 135 141
>>> ].geometricMean
139.923
```

* * *

See also: arithmeticMean, harmonicMean, mean, median

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GeometricMean.html)
[2](https://reference.wolfram.com/language/ref/GeometricMean.html)
