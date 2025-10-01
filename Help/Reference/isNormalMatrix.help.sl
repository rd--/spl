# isNormalMatrix

- _isNormalMatrix(m)_

Answer `true` if _m_ is a normal matrix, else `false`.

A normal matrix:

```
>>> [1 2; -2 1].isNormalMatrix
true

>>> let a = [1 2; -2 1];
>>> let b = a.conjugateTranspose;
>>> a.dot(b)
b.dot(a)
```

A non-normal matrix:

```
>>> [1 2.3; 3.5 -4].isNormalMatrix
false
```

The symmetric part of any real matrix is normal:

```
>>> let m = [1 2.3; 3.5 -4];
>>> ((m + m.transpose) / 2)
>>> .isNormalMatrix
true
```

Test if a complex matrix is normal:

```
>>> [1 2J-3; 4J5 6].isNormalMatrix
false
```

The Hermitian part of any complex matrix is normal:

```
>>> let m = [1 2J-3; 4J5 6];
>>> ((m + m.conjugateTranspose) / 2)
>>> .isNormalMatrix
true
```

Test if an exact matrix is normal:

```
>>> [-1 1 0; 0 -1 1; 1 0 -1]
>>> .isNormalMatrix
true
```

The identity matrix is normal:

```
>>> 3.identityMatrix
>>> .isNormalMatrix
true
```

The Hilbert matrix is normal:

```
>>> [5 5].hilbertMatrix
>>> .isNormalMatrix
true
```

* * *

See also: conjugateTranspose, dot

Guides: Matrix Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NormalMatrixQ.html)
