# minors

- _minors(aMatrix)_

Answer the minors of _aMatrix_.

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
>>> [2.2 1.2 3.1; 1.1 3.1 2.1; 3.2 2.6 1.7].minors
[
	 5.50  1.21 -7.09;
	 1.88 -6.18 -6.02;
	-7.06 -4.85 -0.19
]
```

Minors of an exact 4×4 matrix:

```
>>> [2 3 2 3; 1 12 1 2; 13 3 3 1; 1 2 12 11].minors
[
	-210   -372    10    72;
	 231    199   -11   131;
	-353   -295   217    91;
	-1783 -1627   185   281
]
```

* * *

See also: adjugate, determinant, minor, subMatrix, trace

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Minor.html)
[2](https://reference.wolfram.com/language/ref/Minors.html),
_W_
[1](https://en.wikipedia.org/wiki/Minor_(linear_algebra))
