# mapThread

- _mapThread(f:/n, m)_

Apply _f_ to the columns of _m_.

A unary function at a matrix of one row:

```
>>> sqrt:/1.mapThread([[1 4 9 16 25]])
[1 2 3 4 5]

>>> [1 4 9 16 25].sqrt
[1 2 3 4 5]
```

A binary function at a matrix of two rows:

```
>>> +.mapThread([1 2 3; 4 5 6])
[1 + 4, 2 + 5, 3 + 6]

>>> [1 2 3; 4 5 6].sum
[5 7 9]
```

A ternary function at a matrix of three rows:

```
>>> { :i :j :k |
>>> 	i * j + k
>>> }.mapThread(
>>> 	[1 2; 3 4; 5 6]
>>> )
[1 * 3 + 5, 2 * 4 + 6]
```

* * *

See also: apply, collect, map, mapApply, transpose

Guides: List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MapThread.html)
