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

Geometric mean of the first fourty integers:

```
>>> 1:40.geometricMean
15.7685
```

Compute the geometric and arithmetic means of the columns of a matrix:

```
>>> [
>>> 	0.2049 2.3275 1.8476 1.9527;
>>> 	0.0989 1.2783 0.0298 0.8633;
>>> 	2.0637 0.6035 0.0438 0.0880;
>>> 	0.0906 0.0434 0.7228 0.2329;
>>> 	0.4583 0.0357 0.2228 0.0414
>>> ].transposed.collect { :each |
>>> 	[
>>> 		each.geometricMean,
>>> 		each.arithmeticMean
>>> 	]
>>> }
[
	0.2805 0.5833;
	0.3082 0.8577;
	0.2079 0.5734;
	0.26983 0.6356
]
```

* * *

See also: arithmeticMean, harmonicMean, mean, median

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GeometricMean.html)
[2](https://reference.wolfram.com/language/ref/GeometricMean.html),
_Mathworks_
[1](https://mathworks.com/help/stats/geomean.html),
_Xenharmonic_
[1](https://en.xen.wiki/w/Geometric_mean),
_W_
[1](https://en.wikipedia.org/wiki/Geometric_mean)
