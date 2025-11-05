# thomasAlgorithm

- _thomasAlgorithm(a, b, c, d)_

Implement the Thomas algorithm,
also called the tridiagonal matrix algorithm,
to solve a tridiagonal systems of equations.

```
>>> thomasAlgorithm(
>>> 	[0 2 3 4 5],
>>> 	[1 2 3 4 5],
>>> 	[2 3 4 5 0],
>>> 	[5 15 31 53 45]
>>> )
[1 2 3 4 5]
```

Equivalent solution using `gaussianElimination`:

```
>>> let m = [
>>> 	1 2 0 0 0;
>>> 	2 2 3 0 0;
>>> 	0 3 3 4 0;
>>> 	0 0 4 4 5;
>>> 	0 0 0 5 5
>>> ];
>>> let r = [5 15 31 53 45];
>>> gaussianElimination(m, r)
[1 2 3 4 5]
```

* * *

See also: gaussianElimination

Guides: Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TridiagonalMatrix.html),
_W_
[1](https://en.wikipedia.org/wiki/Tridiagonal_matrix_algorithm)
[2](https://en.wikipedia.org/wiki/Tridiagonal_matrix)
