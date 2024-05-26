# inverse

- _inverse(aMatrix)_

Answer the inverse of the square matrix _aMatrix_.

Inverse of a 2×2 real valued matrix:

```
>>> [1.4 2; 3 -6.7].inverse
[0.43563 0.13004; 0.19506 -0.09103]
```

Inverses of 3×3 integer matrices:

```
>>> [1 2 3; 4 2 2; 5 1 7].inverse
[-2/7 11/42 1/21; 3/7 4/21 -5/21; 1/7 -3/14 1/7]

>>> [2 3 2; 4 9 2; 7 2 4].inverse
[-8/13 2/13 3/13; 1/26 3/26 -1/13; 55/52 -17/52 -3/26]

>>> [0 -3 -2; 1 -4 -2; -3 4 1].inverse
[4 -5 -2; 5 -6 -2; -8 9 3]

>>> [2 -1 0; -1 2 -1; 0 -1 2].inverse
[3/4 1/2 1/4; 1/2 1 1/2; 1/4 1/2 3/4]
```

Find the inverse of a 3×3 real valued matrix:

```
>>> [1.2 2.5 -3.2; 0.7 -9.4 5.8; -0.2 0.3 6.4].inverse
[
	0.74546  0.20425  0.18763;
	0.06792 -0.08478  0.11080;
	0.02011  0.010357 0.15692
]
```

Solve the system of equations of the form _ax + by + cz = d_.
The solution is given by the dot product of the inverse of the coefficient matrix and the constant vector:

```
>>> let m = [6 9 0; -7 0 3; 0 5 9];
>>> let k = [11 -12 -9];
>>> m.inverse.dot(k)
[188/159 23/53 -592/477]
```

Solve the matrix equation _m.x = k_, where _k_ is a vector:

```
>>> let m = [1 2; 3 4];
>>> let k = [5 6];
>>> let r = m.inverse.dot(k);
>>> (r, m.dot(r) = k)
([-4 9/2], true)
```

Solve the matrix equation _m.x = y_, where _y_ is a matrix:

```
>>> let m = [-6 7 9; -2 1 3; 7 -10 4];
>>> let y = [-5 6 -4; -7 7 8; -2 1 12];
>>> let r = m.inverse.dot(y);
>>> (r, m.dot(r) ~ y)
([158/29 -305/58 -234/29; 4 -15/4 -7; -1/29 9/116 -11/29], true)
```

A square matrix has an inverse if and only if its determinant is nonzero:

```
>>> { [1 2 3; 4 5 6; 7 8 9].inverse }.ifError { true }
true
```

The classical adjoint (adjugate) of a square matrix is the `inverse` multiplied by the `determinant`:

```
>>> let m = [8 1 6; 3 5 7; 4 9 2];
>>> m.inverse * m.determinant
[
	-53  52 -23;
	 22  -8 -38;
	  7 -68  37
]
```

* * *

See also: matrixRank, rowReduce

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MatrixInverse.html)
[2](https://reference.wolfram.com/language/ref/Inverse.html),
_W_
[1](https://en.wikipedia.org/wiki/Invertible_matrix)
