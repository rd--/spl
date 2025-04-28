# medianFilter

- _medianFilter(x, r)_

Filters _x_ by replacing every value by the median of the values in a range-_r_ neighborhood.
The distance function is `euclideanDistance`.

Median filter of a list:

```
>>> [1 2 3 2 1].medianFilter(1)
[3/2 2 2 2 3/2]
```

Median filtering of a numeric vector:

```
>>> [0 3 8 2].medianFilter(1)
[3/2 3 3 5]
```

Relation to `movingMap` and `median`:

```
>>> [1 0 -1 1 2 3 1 -1 0 1]
>>> .medianFilter(1)
[1/2 0 0 1 2 2 1 0 0 1/2]

>>> median:/1.movingMap(
>>> 	[1 0 -1 1 2 3 1 -1 0 1],
>>> 	3
>>> )
[0 0 1 2 2 1 0 0]
```

Relation to `arrayFilter` and `median`:

>>> [2 3 80 6 2 3].medianFilter(1)
[5/2 3 6 6 3 5/2]

>>> median:/1.arrayFilter(
>>> 	[2 3 80 6 2 3],
>>> 	1
>>> )
[2 3 6 6 3 3]
```

* * *

See also: euclideanDistance, meanFilter, median, trimmedMean

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MedianFilter.html),
_W_
[1](https://en.wikipedia.org/wiki/Median_filter)
