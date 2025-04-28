# meanShiftFilter

- _meanShiftFilter(x, r, d)_

Filters _x_ by replacing every value by the mean of the values in a range-_r_ neighborhood and whose value is within a distance _d_.
The distance function is `euclideanDistance`.

Mean-shift filtering of a vector:

```
>>> [1 0 1 4 4 5 2 1].meanShiftFilter(2, 1)
[2/3 2/3 2/3 13/3 13/3 13/3 3/2 3/2]
```

Mean-shift filtering of data:

```
>>> [0 1 10 11].meanShiftFilter(1, 1)
[1/2 1/2 21/2 21/2]
```

* * *

See also: euclideanDistance, meanFilter, meanShift, trimmedMean

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MeanShiftFilter.html)
