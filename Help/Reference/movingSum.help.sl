# movingSum

- _movingSum([x₁ x₂ …], n)_

Answer the `movingMap` of `sum`.

Moving sum of a vector:

```
>>> [1 2 5 6 1 4 3].movingSum(3)
[8 13 12 11 8]

>>> [4 8 6 -1 -2 -3 -1 3 4 5]
>>> .movingSum(3)
[18 13 3 -6 -6 -1 6 12]
```

Moving sum of a matrix:

```
>>> [4 8 6; -1 -2 -3; -1 3 4]
>>> .movingSum(2)
[3 6 3; -2 1 1]

>>> [4 8 6; -1 -2 -3; -1 3 4]
>>> .transpose
>>> .movingSum(2)
[12 -3 2; 14 -5 7]
```

* * *

See also: movingAverage, movingMap, movingMedian, sum

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/movsum.html),
