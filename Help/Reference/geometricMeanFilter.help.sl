# geometricMeanFilter

- _geometricMeanFilter(x, r)_

Filters _x_ by replacing every value by the geometric mean value in its range-_r_ neighbourhood.

Geometric mean filtering of a list:

```
>>> [1 2 4 8 16].geometricMeanFilter(1)
[2.sqrt, 2, 4, 8, 8 * 2.sqrt]
```

Apply a moving geometric mean filter to a vector:

```
>>> [1 2 3 2 1].geometricMeanFilter(1)
[
	2.sqrt,
	6 ^ 1/3,
	(2 ^ 2/3) * (3 ^ 1/3),
	6 ^ 1/3,
	2.sqrt
]
```

* * *

See also: convolve, geometricMean, meanFilter

Guides: Filter Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/GeometricMeanFilter.html),
_W_
[1](https://en.wikipedia.org/wiki/Geometric_mean_filter)
