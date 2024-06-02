# variance

- _variance(aCollection)_

Variance gives the unbiased estimate of variance, the dispersion of data.

Variance of a `List` of numbers:

```
>>> [1.21 3.4 2 4.66 1.5 5.61 7.22].variance
5.1612

>>> [2 4 4 4 5 5 7 9].variance
4.5714
```

Variance of elements in each column:

```
>>> [5.2 7; 5.3 8; 5.4 9].variance
[0.01 1]
```

The square root of the `variance` is the `standardDeviation`:

```
>>> 1:4.variance
(5 / 3)

>>> 1:4.standardDeviation
(5 / 3).sqrt
```

Find the variance of the heights for the children in a class.
The second central moment is a scaled `variance`:

```
>>> let h = [
>>> 	134 143 131 140 145 136 131 136 143
>>> 	136 133 145 147 150 150 146 137 143
>>> 	132 142 145 136 144 135 141
>>> ];
>>> let n = h.size;
>>> (h.variance, h.centralMoment(2) * (n / (n - 1)))
(34.04, 34.04)
```

Columnwise variance of a matrix:

```
>>> let m = [4 -7 3; 1 4 -2; 10 7 9];
>>> m.variance
[21 54.3333 30.3333]
```

* * *

See also: mean, standardDeviation

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Variance.html),
[2](https://mathworld.wolfram.com/SampleVariance.html)
[3](https://reference.wolfram.com/language/ref/Variance.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/var.html),
_W_
[1](https://en.wikipedia.org/wiki/Variance)

Categories: Statistics
