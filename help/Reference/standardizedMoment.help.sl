# standardizedMoment

- _standardizedMoment(aCollection, anInteger)_

The first standardized moment is zero, because the first moment about the mean is always zero.

```
>>> let l = [1 4 2 1 6 12 16 4 6 4 1 2 21 19 5 4 7 3 23];
>>> l.standardizedMoment(1)
0
```

The second standardized moment is one, because the second moment about the mean is equal to the variance σ2:

```
>>> let l = [1 4 2 1 6 12 16 4 6 4 1 2 21 19 5 4 7 3 23];
>>> l.standardizedMoment(2)
1
```

The third standardized moment is a measure of skewness:

```
>>> let l = [1 4 2 1 6 12 16 4 6 4 1 2 21 19 5 4 7 3 23];
>>> (l.standardizedMoment(3), l.skewness)
(1.1323, 1.1323)
```

The fourth standardized moment refers to the kurtosis:

```
>>> let l = [1 4 2 1 6 12 16 4 6 4 1 2 21 19 5 4 7 3 23];
>>> (l.standardizedMoment(4), l.kurtosis)
(2.82848, 2.82848)
```

* * *

See also: centralMoment, moment

References:
_Mathematica_
[1](https://mathworld.wolfram.com/StandardizedMoment.html),
_W_
[1](https://en.wikipedia.org/wiki/Standardized_moment)
