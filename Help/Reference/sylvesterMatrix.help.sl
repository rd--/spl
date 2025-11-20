# sylvesterMatrix

- _sylvesterMatrix(p, q)_

Answer the Sylvester matrix associated to the two univariate polynomials with coefficients _p_ and _q_.
The entries of the Sylvester matrix of two polynomials are coefficients of the polynomials.
The determinant of the Sylvester matrix of two polynomials is their resultant,
which is zero when the two polynomials have a common root.

```
>>> [1 2 3 4 5].sylvesterMatrix([6 7 8 9])
[
	5 4 3 2 1 0 0;
	0 5 4 3 2 1 0;
	0 0 5 4 3 2 1;
	9 8 7 6 0 0 0;
	0 9 8 7 6 0 0;
	0 0 9 8 7 6 0;
	0 0 0 9 8 7 6
]
```

The `determinant` of the `sylvesterMatrix` of two polynomials is the `resultant` of the polynomials:

```
>>> let p = [7 -2 1];
>>> let q = [5 -1 0 1];
>>> let m = p.sylvesterMatrix(q);
>>> (m.determinant, m)
(
	265,
	[
		1 -2  7  0  0;
		0  1 -2  7  0;
		0  0  1 -2  7;
		1  0 -1  5  0;
		0  1  0 -1  5
	]
)
```

Decide whether two polynomials have common roots,
the `resultant` vanishes exactly when the polynomials have roots in common:

```
>>> let p = [3 -7 -5 1];
>>> let q = [-11 9 -8 1];
>>> p.sylvesterMatrix(q).determinant
-10321

>>> let p = [14 -7 -5 1];
>>> let q = [58 9 -8 1];
>>> p.sylvesterMatrix(q).determinant
0

>>> let p = [-1 0 0 1];
>>> let q = [-1 2 2 1];
>>> p.sylvesterMatrix(q).determinant
16

>>> let p = [-1 0 0 1];
>>> let q = [1 2 2 1];
>>> p.sylvesterMatrix(q).determinant
0
```

* * *

See also: rotateRight, resultant

Guides: Matrix Functions, Polynomial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SylvesterMatrix.html)
[2](https://reference.wolfram.com/language/ref/Resultant.html),
_W_
[1](https://en.wikipedia.org/wiki/Sylvester_matrix)

Categories: Math, Matrix
