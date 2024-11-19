# toeplitzMatrix

- _toeplitzMatrix(c, r)_

Answer the _n×n_ Toeplitz matrix with elements of the form _1 / (i + j - 1)_.

3×3 Toeplitz matrix:

```
>>> [1 2 3 4].toeplitzMatrix([1 2 3 4])
[
	1 2 3 4;
	2 1 2 3;
	3 2 1 2;
	4 3 2 1
]
```

4×4 Toeplitz matrix:

```
>>> [1 2 4 8].toeplitzMatrix([1 0.5 0.25 0.125])
[
	1    0.5  0.25 0.125;
	2    1    0.5  0.25;
	4    2    1    0.5;
	8    4    2    1
]
```

* * *

See also: circulantMatrix, hilbertMatrix

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ToeplitzMatrix.html)
_W_
[1](https://reference.wolfram.com/language/ref/ToeplitzMatrix.html)

Categories: Math, Matrix
