# frobeniusNorm

- _frobeniusNorm(aMatrix)_

Frobenius norm of a 3×3 matrix:

```
>>> [1 2 3; 0 5 4; 2 1 3].frobeniusNorm
69.sqrt
```

Relation to `trace` and `conjugateTranspose` and `dot`:

```
>>> let m = [1 2 3; 0 5 4; 2 1 3];
>>> m.dot(m.conjugateTranspose).trace.sqrt
69.sqrt
```

Frobenius norm of a 4×4 matrix:

```
>>> [0 0 1 2; 3 0 5 4; 1 1 1 2; 1 3 2 2].frobeniusNorm
80.sqrt
```

Frobenius norm of a 5×5 matrix:

```
>>> [
>>> 	1 1 1 1 1;
>>> 	2 3 4 5 6;
>>> 	0 1 0 1 0;
>>> 	3 4 3 4 3;
>>> 	5 5 5 5 5
>>> ].frobeniusNorm
281.sqrt
```

* * *

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FrobeniusNorm.html)
