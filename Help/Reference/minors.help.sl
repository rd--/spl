# minors

- _minors(m, k, f:/1)_

Answer the minors of the matrix _m_,
if _k_ is elided is is on less than the least dimension,
if _f_ is elided it is `determinant`.

Minors of an exact 3×3 matrix:

```
>>> [1 4 7; 3 0 5; -1 9 11].minors
[
	-12 -16  20;
	 13  18 -19;
	 27  38 -45
]
```

Minors of a real 3×3 matrix:

```
>>> [
>>> 	2.2 1.2 3.1;
>>> 	1.1 3.1 2.1;
>>> 	3.2 2.6 1.7
>>> ].minors
[
	 5.50  1.21 -7.09;
	 1.88 -6.18 -6.02;
	-7.06 -4.85 -0.19
]
```

Minors of an exact 4×4 matrix:

```
>>> [
>>> 	2 3 2 3;
>>> 	1 12 1 2;
>>> 	13 3 3 1;
>>> 	1 2 12 11
>>> ].minors
[
	-210   -372    10    72;
	 231    199   -11   131;
	-353   -295   217    91;
	-1783 -1627   185   281
]
```

The matrices used to compute the _k=2_ minors of a 3×4 matrix:

```
>>> 1:12.reshape([3 4]).minors(
>>> 	2, identity:/1
>>> )
[
	[
		1 2; 5 6:;
		1 3; 5 7:;
		2 3; 6 7:;
		1 4; 5 8:;
		2 4; 6 8:;
		3 4; 7 8
	],
	[
		1 2;  9 10:;
		1 3;  9 11:;
		2 3; 10 11:;
		1 4;  9 12:;
		2 4; 10 12:;
		3 4; 11 12
	],
	[
		5 6;  9 10:;
		5 7;  9 11:;
		6 7; 10 11:;
		5 8;  9 12:;
		6 8; 10 12:;
		7 8; 11 12
	]
]
```

The identity matrix is not changed by `minors`:

```
>>> 4.identityMatrix.minors
4.identityMatrix
```

Minors of Hilbert matrix:

```
>>> 4.hilbertMatrix.minors
[
	 1/2160  1/1440  1/3600  1/43200;
	 1/1440  3/2800  1/2240  1/25200;
	 1/3600  1/2240  1/5040  1/50400;
	1/43200 1/25200 1/50400 1/378000
]
```

By definition, `minors` with _k=0_ is _[[1]]_:

```
>>> [1 2 3; 4 5 6; 7 8 9].minors(0)
[[1]]
```

Matrix plot of _k=3_ minors of a random boolean matrix:

~~~spl svg=A
Sfc32(683714)
.randomInteger([0 1], [6 6])
.minors(3)
.matrixPlot
~~~

![](Help/Image/minors-A.svg)

* * *

See also: adjugate, compoundMatrix, determinant, minor, submatrix, trace

Guides: Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Minor.html)
[2](https://reference.wolfram.com/language/ref/Minors.html),
_W_
[1](https://en.wikipedia.org/wiki/Minor_(linear_algebra))
[2](https://en.wikipedia.org/wiki/Compound_matrix)

Categories: Math, Matrix
