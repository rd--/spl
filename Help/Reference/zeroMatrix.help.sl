# zeroMatrix

- _zeroMatrix([m n])_

Answers the `zero` matrix of the specified shape (_m×n_).

A 2×2 matrix:

```
>>> [2 2].zeroMatrix
[
	0 0;
	0 0
]
```

A 2×3 matrix:

```
>>> [2 3].zeroMatrix
[
	0 0 0;
	0 0 0
]
```

A 3×2 matrix:

```
>>> [3 2].zeroMatrix
[
	0 0;
	0 0;
	0 0
]
```

This can also be written using either `!` or `reshape`:

```
>>> { 0 } ! [2 3]
[0 0 0; 0 0 0]

>>> [0].reshape([2 3])
[0 0 0; 0 0 0]
```

* * *

See also: constantArray, identityMatrix, reshape

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ZeroMatrix.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/zeros.html),
_Python_
[1](https://numpy.org/doc/stable/reference/generated/numpy.zeros.html),
_W_
[1](https://en.wikipedia.org/wiki/Zero_matrix)

Categories: Math, Matrix
