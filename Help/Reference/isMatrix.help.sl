# isMatrix

- _isMatrix(aList)_

A `List` is a _matrix_ if each of the elements is a _vector_ of equal size.
Specifically if `arrayDepth` is `>=` two.

At `List`:

```
>>> let l = [1 2 3 4 5 6];
>>> (l.isMatrix, l.dimensions(2))
(false, [6])

>>> let l = [1 2 3; 4 5 6];
>>> (l.isMatrix, l.dimensions(2))
(true, [2 3])

>>> let l = [1 2; 3 4 5];
>>> (l.isMatrix, l.dimensions(2))
(false, [2])
```

* * *

See also: arrayDepth, dimensions, isColumnVector, isMatrixOf, isRowVector, isVector, isVectorOf

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Matrix.html)
[2](https://reference.wolfram.com/language/ref/MatrixQ.html)

Categories: Testing, Matrix, Collection
