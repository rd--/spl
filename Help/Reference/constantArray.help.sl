# constantArray

- _constantArray([n₁ n₂ …], x)_

Answer an array having shape _n₁,n₂,…_ where each entry is _x_.

A vector of five threes:

```
>>> [5].constantArray(3)
[3 3 3 3 3]
```

For the vector case see also `#` and `!`:

```
>>> 3 # 5
[3 3 3 3 3]

>>> 3 ! 5
[3 3 3 3 3]

>>> { 3 } ! 5
[3 3 3 3 3]
```

A 3×4 array of fives:

```
>>> [3 4].constantArray(5)
[5 5 5 5; 5 5 5 5; 5 5 5 5]
```

For the matrix case see also `reshape`:

```
>>> [5].reshape([3 4])
[5 5 5 5; 5 5 5 5; 5 5 5 5]

>>> (5 # 12).reshape([3 4])
[5 5 5 5; 5 5 5 5; 5 5 5 5]
```

A matrix of exact zeros:

```
>>> [3 3].constantArray(0)
[0 0 0; 0 0 0; 0 0 0]
```

A deeply nested constant array (a tree):

```
>>> [2 1 2 1 2].constantArray(0)
[[[[[0, 0]], [[0, 0]]]], [[[[0, 0]], [[0, 0]]]]]
```

* * *

See also: #, !, identityMatrix, iota, Range, reshape, table, unitVector

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ConstantMatrix.html)
[2](https://reference.wolfram.com/language/ref/ConstantArray.html)
