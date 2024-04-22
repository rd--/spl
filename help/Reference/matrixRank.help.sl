# matrixRank

- _matrixRank(aMatrix)_

Answer the rank of _aMatrix_.

Find the number of linearly independent rows of a numerical matrix:

```
>>> [1 2 3; 4 5 6; 7 8 9].matrixRank
2

>>> [1 0 1; 0 1 1; 0 1 1].matrixRank
2
```

Compute the rank of a rectangular matrix:

```
>>> [0 5 2 4 4; 2 5 0 4 0; 5 1 5 4 5].matrixRank
3

>>> [1 1 0 2; -1 -1 0 -2].matrixRank
1
```

Find the rank of a real-valued matrix:

```
>>> [1.25 3.2 3.2; 7.9 -1.4 5.1; 1.1 2.5 -1.5].matrixRank
3
```

Rank of an exact, rectangular matrix:

```
>>> [2 2 3 4; 3 2 1 3].matrixRank
2
```

An identity matrix always has full rank:

```
>>> 7.identityMatrix.matrixRank
7
```

The column and row rank of a matrix are equal:

```
>>> let m = [1 2 3; 4 5 6; 7 8 9];
>>> (m.matrixRank, m.transposed.matrixRank)
(2, 2)
```

* * *

See also: determinant, inverse, rowReduce

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MatrixRank.html)
[2](https://reference.wolfram.com/language/ref/MatrixRank.html),
_W_
[1](https://en.wikipedia.org/wiki/Rank_(linear_algebra))
