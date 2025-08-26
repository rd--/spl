# antitranspose

- _antitranspose(m)_

Answer the antitransposition of the matrix _m_.

A 3×3 matrix:

```
>>> [3 3].iota
[
	1 2 3;
	4 5 6;
	7 8 9
]
```

Transpose, reflected across the diagonal:

```
>>> [3 3].iota.transpose
[
	1 4 7;
	2 5 8;
	3 6 9
]
```

Antitranspose, reflected across the antidiagonal:

```
>>> [3 3].iota.antitranspose
[
	9 6 3;
	8 5 2;
	7 4 1
]
```

The antitranspose of an antidiagonal matrix is the identity:

```
>>> let m = [1 2 3].antidiagonalMatrix;
>>> m.antitranspose = m
true
```

The antitranspose of a Hankel matrix:

```
>>> 3.hankelMatrix.antitranspose
[
	0 0 3;
	0 3 2;
	3 2 1
]
```

* * *

See also: transpose

Guides: Matrix Functions
