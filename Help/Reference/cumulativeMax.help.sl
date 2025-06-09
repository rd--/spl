# cumulativeMax

- _cumulativeMax([x₁ x₂ …])

Cumulative minima, `scan` or `max`.

At `List`:

```
>>> [2 -Infinity 5 -1 0].cumulativeMax
[2 2 5 5 5]

>>> [9 10 2 10 7 1 3 6 10 10]
>>> .cumulativeMax
[9 10 10 10 10 10 10 10 10 10]
```

At a matrix answer cumulative column minima:

```
>>> [1 3; 0 5; 2 2].cumulativeMax
[1 3; 1 5; 2 5]

>>> [3 5 2; 1 6 3; 7 8 1]
>>> .cumulativeMax
[
	3   5   2;
	3   6   3;
	7   8   3
]
```

* * *

See also: accumulate, cumulativeMin, min, prefixSum, scan

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/double.cummax.html)
