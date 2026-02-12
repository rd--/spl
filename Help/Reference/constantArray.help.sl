# constantArray

- _constantArray([n₁ n₂ …], x)_

Answer an array having shape _n₁,n₂,…_ where each entry is _x_.

A vector of five threes:

```
>>> [5].constantArray(3)
[3 3 3 3 3]
```

For the vector case see also `List`, `#` and `!`:

```
>>> List(5, 3)
[3 3 3 3 3]

>>> 5 # [3]
[3 3 3 3 3]

>>> { 3 } ! 5
[3 3 3 3 3]
```

A 3×4 array of fives:

```
>>> [3 4].constantArray(5)
[
	5 5 5 5;
	5 5 5 5;
	5 5 5 5
]
```

For the matrix case see also `reshape`:

```
>>> [5].reshape([3 4])
[
	5 5 5 5;
	5 5 5 5;
	5 5 5 5
]
```

A matrix of exact zeroes:

```
>>> [3 3].constantArray(0)
[0 0 0; 0 0 0; 0 0 0]
```

A deeply nested constant array (a tree):

```
>>> [2 1 2 1 2].constantArray(0)
[[[[[0, 0]], [[0, 0]]]], [[[[0, 0]], [[0, 0]]]]]
```

A list of lists:

```
>>> [3].constantArray([1 2 3])
[1 2 3; 1 2 3; 1 2 3]
```

A matrix of lists:

```
>>> [3 3].constantArray([1 2])
[
	1 2; 1 2; 1 2:;
	1 2; 1 2; 1 2:;
	1 2; 1 2; 1 2
]
```

* * *

See also: #, !, identityMatrix, iota, Range, reshape, table, unitVector

Guides: Array Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ConstantMatrix.html)
[2](https://reference.wolfram.com/language/ref/ConstantArray.html)
