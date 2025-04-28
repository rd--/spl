# meanFilter

- _meanFilter(x, r)_

Filters _x_ by replacing every value by the mean value in its range-_r_ neighborhood.

Mean filtering of a list:

```
>>> [1 2 3 2 1].meanFilter(1)
[3/2 2 7/3 2 3/2]
```

Relation to `convolve`:

```
>>> let r = 1;
>>> let m = (2 * r) + 1;
>>> let k = (1 / m) # m;
>>> let x = [1 0 -1 1 2 3 1 -1 0 1];
>>> let a = x.meanFilter(r);
>>> let b = k.convolve(x);
>>> (a, b)
(
	[1/2 0 0 2/3 2 2 1 0 0 1/2],
	[1/3 1/3 0 0 2/3 2 1 0 0 1/3 1/3]
)
```

* * *

See also: convolve, geometricMeanFilter, mean, medianFilter

Guides: Filter Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MeanFilter.html)
