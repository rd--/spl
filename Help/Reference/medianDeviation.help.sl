# medianDeviation

- _medianDeviation(c)_

Answer the median absolute deviation from the median of the elements in the collection _c_.

At `List`:

```
>>> [6.5 3.8 6.6 5.7 6.0 6.4 5.3]
>>> .medianDeviation
0.5

>>> [1 12 3 7].medianDeviation
3

>>> [1.pi 1.e 2].medianDeviation
1.pi - 1.e

>>> [1 5 3 7/11].medianDeviation
13/11
```

At matrix:

```
>>> [1 2; 4 8; 5 3; 2 15]
>>> .medianDeviation
[3/2 3]
```

Obtain a robust estimate of dispersion when extreme values are present:

```
>>> [3 10 1E6 20 5 6]
>>> .medianDeviation
4
```

Measures based on the mean are heavily influenced by extreme values:

```
>>> [3 10 1E6 20 5 6]
>>> .standardDeviation
408245

>>> [3 10 1E6 20 5 6]
>>> .meanDeviation
277775
```

Calculate directly:

```
>>> let x = [6.5 3.8 6.6 5.7 6.0 6.4 5.3];
>>> let m = x.median;
>>> (x - m).abs.median
0.5
```

* * *

See also: meanDeviation, median, standardDeviation

Guides: Statistics Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MedianDeviation.html),
_W_
[1](https://en.wikipedia.org/wiki/Median_absolute_deviation)

Categories: Statistics
