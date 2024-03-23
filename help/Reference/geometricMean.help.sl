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

The geometric mean of 1 and 3/2:

```
>>> [1 3/2].geometricMean
3/2.sqrt
```

The geometric mean of 5/4 and 6/5:

```
>>> [5/4 6/5].geometricMean
3/2.sqrt
```

The geometric mean of 9/8 and 10/9:

```
>>> [9/8 10/9].geometricMean
5/4.sqrt
```

Find compromise proportions:

```
>>> 16/9 - [4/3 2.35].geometricMean
0.007655

>>> 14/9 - [4/3 16/9].geometricMean
0.015955
```

* * *

See also: arithmeticMean, harmonicMean, mean, median

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GeometricMean.html)
[2](https://reference.wolfram.com/language/ref/GeometricMean.html),
_Xenharmonic_
[1](https://en.xen.wiki/w/Geometric_mean),
_W_
[1](https://en.wikipedia.org/wiki/Geometric_mean)
