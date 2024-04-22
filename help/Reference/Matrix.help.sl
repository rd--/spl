# Matrix

`Matrix` is a `Type` holding a rectangular array arranged in rows and columns.

```
>>> let m = [1 2 3; 4 5 6; 7 8 9].asMatrix;
>>> (m.numberOfRows, m.numberOfColumns, m.shape, m.elementType, m.isSquareMatrix)
(3, 3, [3 3], 'SmallFloat', true)
```

Determinant:

```
>>> [1 2 3; 4 5 6; 7 8 9].asMatrix.determinant
0
```

Inverse of a 2×2 matrix:

```
>>> [1.4 2; 3 -6.7].asMatrix.inverse
[0.43563 0.13004; 0.19506 -0.09103]

>>> [-1 1; 1.5 -1].asMatrix.inverse
[2 2; 3 2]
```
inverse

* * *

See also: asMatrix, List, Matrix Operations, Sequence

References:
_Apl_
[1](https://aplwiki.com/wiki/Matrix),
_Mathematica_
[1](https://mathworld.wolfram.com/Matrix.html),
_W_
[1](https://en.wikipedia.org/wiki/Matrix_(mathematics))
