# isMatrix

- _isMatrix(m)_
- _isMatrix(m, f:/1)_

Answer `true` if _m_ is a matrix, else `false`.
A `List` _m_ is a matrix if each of the elements is a vector of equal size.
Specifically if `arrayDepth` is equal to two.
In the binary case require in addition that the each element of the matrix answer `true` to the predicate _f_.

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

Require that the matrix be of integers:

```
>>> [3 3].iota.isMatrix(isInteger:/1)
true

>>> [1 2; 3 4.5].isMatrix(isInteger:/1)
false
```

At a `List` of `Range` values:

```
>>> [1:5, 3:7, 5:9].isMatrix
true
```

At `NumericArray`:

```
>>> NumericArray([3].iota)
>>> .isMatrix
false

>>> NumericArray([2 3].iota)
>>> .isMatrix
true

>>> NumericArray([3 2 3].iota)
>>> .isMatrix
false
```

Note that in this interpretation,
a _volume_ (or _box_ or array of dimensions three) is _not_ a matrix:

```
>>> [
>>> 	1 2; 3 4:;
>>> 	5 6; 7 8
>>> ].isMatrix
false
```

* * *

See also: arrayDepth, dimensions, isColumnVector, isMatrixOf, isRowVector, isVector, isVectorOf

Guides: Array Functions, Matrix Functions, Predicate Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Matrix.html)
[2](https://reference.wolfram.com/language/ref/MatrixQ.html)

Categories: Testing, Matrix, Collection
