# variance

- _variance(aCollection)_

Variance gives the unbiased estimate of variance, the dispersion of data.

Variance of a `List` of numbers:

```
>>> [1.21 3.4 2 4.66 1.5 5.61 7.22].variance
5.16122
```

Variance of elements in each column:

```
>>> [5.2 7; 5.3 8; 5.4 9].transposed.collect(variance:/1)
[0.01 1]
```

The square root of the `variance` is the `standardDeviation`:

```
>>> 1:4.variance
(5 / 3)

>>> 1:4.standardDeviation
(5 / 3).sqrt
```

Find the variance of the heights for the children in a class:

```
>>> [
>>> 	134 143 131 140 145 136 131 136 143
>>> 	136 133 145 147 150 150 146 137 143
>>> 	132 142 145 136 144 135 141
>>> ].variance
34.04
```

* * *

See also: mean, standardDeviation

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Variance.html)
[2](https://reference.wolfram.com/language/ref/Variance.html)

Categories: Statistics
