# diagonal

- _diagonal(aMatrix, anInteger)_
- _diagonal(alpha)_ => _diagonal(alpha, 0)_

Answer the list of elements on the leading diagonal,
or on the _anInteger-th_ diagonal,
of _aMatrix_.
Diagonal works even if _aMatrix_ is not a square matrix.

```
>>> 9.iota.reshape([3, 3]).diagonal
[1, 5, 9]

>>> [1.1 12.2 3.23; 2.3 42.2 35.3; 1.2 3.1 2.3].diagonal
[1.1 42.2 2.3]

>>> [2 3 1; 2 2 1; 3 1 2].diagonal
[2 2 2]
```

Obtain the superdiagonal:

```
>>> 9.iota.reshape([3, 3]).diagonal(1)
[2, 6]

>>> [1j1 2 3j-2; 0 4.pi 0j5; e 0 6].diagonal(1)
[2 0j5]
```

Obtain the subdiagonal:

```
>>> 9.iota.reshape([3, 3]).diagonal(-1)
[4, 8]
```

The diagonal of a non-square matrix:

```
>>> 12.iota.reshape([3, 4]).diagonal
[1, 6, 11]

>>> [3 2 2; 2 3 -2; 4 2 1; 3 7 9].diagonal
[3 3 1]
```

_diagonal(m, k)_ for an _n × n_ matrix gives non-empty results for _1 - n <= k <= n - 1_:

```
>>> let m = 1:4.collect { :i | 1:4.collect { :j | j - i } };
>>> -3:3.collect { :k | m.diagonal(k) }
[-3; -2 -2; -1 -1 -1; 0 0 0 0; 1 1 1; 2 2; 3]
```

* * *

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Diagonal.html)
