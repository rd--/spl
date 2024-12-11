# adjugate

- _adjugate(aMatrix)_

Answer the adjugate of _aMatrix_, which must be square.

Compute the adjugate of a 2×2 matrix:

```
>>> [5 4; 4 11].adjugate
[11 -4; -4 5]
```

Compute the adjugate for a 3×3 matrix:

```
>>> let m = [15 3 4; 3 15 11; -2 1 7];
>>> let a = m.adjugate;
>>> let d = m.determinant * m.size.identityMatrix;
>>> (a, a.dot(m) ~ d)
(
	[
		94 -17 -27;
		-43 113 -153;
		33 -21 216
	],
	true
)
```

Adjugate for a floating point matrix:

```
>>> [43.2 25.1; 27.1 41.2].adjugate
[41.2 -25.1; -27.1 43.2]
```

Adjugate for an integer matrix:

```
>>> [4 3; 3 4].adjugate
[4 -3; -3 4]
```

The identity matrix is its own adjugate:

```
>>> 4.identityMatrix.adjugate
[
	1 0 0 0;
	0 1 0 0;
	0 0 1 0;
	0 0 0 1
]
```

Use `adjugate` to solve a linear equation:

```
>>> let m = [1 1 1; 1 2 3; 1 4 9];
>>> let b = [1 2 3];
>>> m.adjugate.dot(b / m.determinant)
[-1/2 2 -1/2]
```

The adjugate of a magic square:

```
>>> let m = [8 1 6; 3 5 7; 4 9 2];
>>> m.adjugate
[
	-53  52 -23;
	 22  -8 -38;
	  7 -68  37
]
```

* * *

See also: determinant, dot, inverse

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Adjugate.html),
_Mathworks_
[1](https://mathworks.com/help/symbolic/adjoint.html),
_W_
[1](https://en.wikipedia.org/wiki/Adjugate_matrix)

Categories: Matrix, Math
