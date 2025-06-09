# cumulativeMin

- _cumulativeMin([x₁ x₂ …])

Cumulative minima, `scan` or `min`.

At `List`:

```
>>> [2 Infinity 5 -1 0].cumulativeMin
[2 2 2 -1 -1]

>>> [8 9 1 10 6 1 3 6 10 10]
>>> .cumulativeMin
[8 8 1 1 1 1 1 1 1 1]
```

At a matrix answer cumulative column minima:

```
>>> [1 3; 0 5; 2 2].cumulativeMin
[1 3; 0 3; 0 2]

>>> [3 5 2; 1 6 3; 7 8 1]
>>> .cumulativeMin
[
	3     5     2;
	1     5     2;
	1     5     1
]
```

* * *

See also: accumulate, cumulativeMax, min, prefixSum, scan

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/double.cummin.html)
