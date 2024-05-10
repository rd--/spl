# exchangeMatrix

- _exchangeMatrix(anInteger)_

Answers the _n x n_ exchange matrix,
where the elements of the `antidiagonal` are all `one`,
and all other elements are `zero`.

```
>>> 2.exchangeMatrix
[0 1; 1 0]

>>> 3.exchangeMatrix
[0 0 1; 0 1 0; 1 0 0]

>>> 4.exchangeMatrix
[0 0 0 1; 0 0 1 0; 0 1 0 0; 1 0 0 0]

>>> 4.exchangeMatrix.antidiagonal
[1 1 1 1]
```

Premultiplying a matrix _m_ by an exchange matrix _e_ is row reversal:

```
>>> let m = [4 3].iota;
>>> let e = 4.exchangeMatrix;
>>> e.dot(m)
[
	10 11 12;
	 7  8  9;
	 4  5  6;
	 1  2  3
]
```

Postmultiplying a matrix _m_ by an exchange matrix _e_ is column reverse:

```
>>> let m = [4 3].iota;
>>> let e = 3.exchangeMatrix;
>>> m.dot(e)
[
	 3  2  1;
	 6  5  4;
	 9  8  7;
	12 11 10
]
```

Exchange matrices are involutory:

```
>>> let e = 4.exchangeMatrix;
>>> let i = 4.identityMatrix;
>>> e.dot(e) = i
true
```

Exchange matrices are symmetric:

```
>>> let e = 4.exchangeMatrix;
>>> e = e.transposed
true
```

The `trace` of an exchange matrix is `one` if _n_ is odd and `zero` if _n_ is even:

```
>>> 3:9.collect { :n | [n.isOdd.boole, n.exchangeMatrix.trace] }
[1 1; 0 0; 1 1; 0 0; 1 1; 0 0; 1 1]
```

The `determinant` of an exchange matrix is a function of _n_ with period four:

```
>>> 2:5.collect { :n |
>>> 	[
>>> 		-1 ^ (n * (n - 1) / 2),
>>> 		n.exchangeMatrix.determinant
>>> 	]
>>> }
[-1 -1; -1 -1; 1 1; 1 1]
```

* * *

See also: antidiagonalMatrix, diagonalMatrix, identityMatrix, kroneckerDelta, unitVector, permutationMatrix, table

References:
_W_
[1](https://en.wikipedia.org/wiki/Exchange_matrix)
