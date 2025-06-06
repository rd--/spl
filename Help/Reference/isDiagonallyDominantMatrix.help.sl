# isDiagonallyDominantMatrix

- _isDiagonallyDominantMatrix(m)_
- _isDiagonallyDominantMatrix(m, f₂=≥)_

Answer `true` if the matrix _m_ is _weakly_ diagonally dominant.
In the binary form,
the comparator is supplied,
providing `>` decides if the matrix is _strictly_ diagonally dominant.

At a 2×2 matrix:

```
>>> [2 1; 1 -2]
>>> .isDiagonallyDominantMatrix
true
```

At a 3×3 matrix:

```
>>> [5 3 1; 4 -5 0; 1 1 -3]
>>> .isDiagonallyDominantMatrix
true
```

Compare weak and strict forms at three 3×3 matrices:

```
>>> let f:/2 = isDiagonallyDominantMatrix:/2;
>>> [
>>> 	3 -2 1; 1 3 2; -1 2 4:;
>>> 	-2 2 1; 1 3 2; 1 -2 4:;
>>> 	-4 2 1; 1 6 2; 1 -2 5
>>> ].collect { :m |
>>> 	(
>>> 		f(m, >=),
>>> 		f(m, >)
>>> 	)
>>> }
[(true, false), (false, false), (true, true)]
```

* * *

See also: diagonalMatrix, isDiagonalMatrix

Guides: Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DiagonallyDominantMatrix.html),
_W_
[1](https://en.wikipedia.org/wiki/Diagonally_dominant_matrix)
