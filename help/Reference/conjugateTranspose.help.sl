# conjugateTranspose

- _conjugateTranspose(aMatrix)_

Answer the conjugate transpose of _aMatrix_.
Equivalent to _m.transposed.conjugated_.
For real matrices, the conjugate transpose is just the transpose.

Conjugate transpose of a complex-valued matrix:

```
>>> let m = [1 0J2 3; 3J4 5 0J1];
>>> m.conjugateTranspose
[1 3J-4; 0J-2 5; 3 0J-1]
```

`conjugateTranspose` leaves the identity matrix unchanged:

```
>>> 3.identityMatrix.conjugateTranspose
3.identityMatrix
```

A Hermitian matrix is unchaged by `conjugateTranspose`:

```
>>> let h = [1 0J-2 3; 0J2 4 5J-6; 3 5J6 7];
>>> h.conjugateTranspose
h
```

An anti-Hermitian matrix is `negated` by `conjugateTranspose`:

```
>>> let h = [0 -1 0J2; 1 0 -3J4; 0J2 3J4 0];
>>> h.conjugateTranspose
h.negated
```

* * *

See also: conjugated, transposed

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ConjugateTranspose.html)
[2](https://reference.wolfram.com/language/ref/ConjugateTranspose.html),
_W_
[1](https://en.wikipedia.org/wiki/Conjugate_transpose)
