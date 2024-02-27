# transposed

- _transposed(aMatrix)_

Answer a new matrix that is like _aMatrix_ but with the rows and columns transposed.

```
>>> [1 2 3; 4 5 6].transposed
[1 4; 2 5; 3 6]

>>> Matrix22(1, 2, 3, 4).transposed
Matrix22(1, 3, 2, 4)
```

Transpose a 3×3 numerical matrix:

```
>>> 9.iota.reshape([3 3]).transposed
[1 4 7; 2 5 8; 3 6 9]

>>> [3 4 1; 2 3 1; 5 4 2].transposed
[3 2 5; 4 3 4; 1 1 2]
```

Transpose a row matrix into a column matrix:

```
>>> [[1.5 2.2 3.1]].transposed
[1.5; 2.2; 3.1]
```

Transposition of a vector is an error:

```
>>> { [1.5 2.2 3.1].transposed }.ifError { true }
true
```

Transpose leaves the identity matrix unchanged:

```
>>> let m = [1 0 0; 0 1 0; 0 0 1];
>>> m.transposed = m
true
```

A symmetric matrix obeys _s=sT_,
an antisymmetric matrix _a=-aT.
This matrix is symmetric:

```
>>> let s = [1 2 3; 2 4 5; 3 5 6];
>>> s.transposed = s
true
```

This matrix is antisymmetric:

```
>>> let a = [0 1 2; -1 0 3; -2 -3 0];
>>> a.transposed.negated = a
true
```

Where supported _transposed_ is displayed as _ᵀ_.

* * *

See also: transpose

Unicode: U+1D40 ᵀ Modifier Letter Capital T

References:
_Apl_
[1](https://aplwiki.com/wiki/Transpose),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/barco),
_Mathematica_
[1](https://mathworld.wolfram.com/Tranpose.html)
[2](https://reference.wolfram.com/language/ref/Transpose.html)

Categories: Ordering
