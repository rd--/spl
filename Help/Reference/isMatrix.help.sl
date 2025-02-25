# isMatrix

- _isMatrix(aSequence | aMatrix)_

A `Sequence` is a _matrix_ if each of the elements is a _vector_ of equal size.

At `List`:

```
>>> [1 2 3 4 5 6].isMatrix
false

>>> [1 2 3; 4 5 6].isMatrix
true

>>> [1 2; 3 4 5].isMatrix
false
```

At `Tuple` always answer `false`:

```
>>> (1, 2, 3, 4, 5, 6).isMatrix
false

>>> ((1, 2, 3), (4, 5, 6)).isMatrix
false

>>> ((1, 2), (3, 4, 5)).isMatrix
false
```

* * *

See also: isColumnVector, isMatrixOf, isRowVector, isSequence, isVector, isVectorOf

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Matrix.html)
[2](https://reference.wolfram.com/language/ref/MatrixQ.html)

Categories: Testing, Matrix, Collection
