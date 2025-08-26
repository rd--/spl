# conjugateTranspose

- _conjugateTranspose(m)_

Answer the conjugate transpose of the matrix _m_.
Equivalent to _m.transpose.conjugate_.
For real matrices, the conjugate transpose is just the transpose.

Conjugate transpose of a real-valued matrix:

```
>>> [2 1; 9 7; 2 8; 3 5]
>>> .conjugateTranspose
[
	2 9 2 3;
	1 7 8 5
]
```

Conjugate transpose of a complex-valued matrix:

```
>>> [0J-1 2J1; 4J2 0J-2]
>>> .conjugateTranspose
[0J1 4J-2; 2J-1 0J2]

>>> [1 0J2 3; 3J4 5 0J1]
>>> .conjugateTranspose
[1 3J-4; 0J-2 5; 3 0J-1]
```

`conjugateTranspose` leaves the identity matrix unchanged:

```
>>> 3.identityMatrix
>>> .conjugateTranspose
3.identityMatrix
```

A Hermitian matrix is unchaged by `conjugateTranspose`:

```
>>> let h = [1 0J-2 3; 0J2 4 5J-6; 3 5J6 7];
>>> h.conjugateTranspose
h
```

An anti-Hermitian matrix is `negate` by `conjugateTranspose`:

```
>>> let h = [0 -1 0J2; 1 0 -3J4; 0J2 3J4 0];
>>> h.conjugateTranspose
h.negate
```

* * *

See also: conjugate, transpose

Guides: Complex Numbers

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ConjugateTranspose.html)
[2](https://reference.wolfram.com/language/ref/ConjugateTranspose.html),
_W_
[1](https://en.wikipedia.org/wiki/Conjugate_transpose)

Categories: Math, Matrix
