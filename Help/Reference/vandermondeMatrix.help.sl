# vandermondeMatrix

- _vandermondeMatrix(x, k=n)_

Answer the _n×k_ Vandermonde matrix corresponding to the nodes _x_.
If _k_ is omitted it is set to _n_.

```
>>> [1/2 1 2 4].vandermondeMatrix
[
	1 1/2 1/4 1/8;
	1 1 1 1;
	1 2 4 8;
	1 4 16 64
]

>>> [-1 2 3].vandermondeMatrix(5 + 1)
[
	1 -1 1 -1 1 -1;
	1 2 4 8 16 32;
	1 3 9 27 81 243
]

>>> [1, 1.5 .. 3].vandermondeMatrix
[
	1 1 1 1 1;
	1 1.5 2.25 3.375 5.0625;
	1 2 4 8 16;
	1 2.5 6.25 15.625 39.0625;
	1 3 9 27 81
]

>>> [1 .. 5].vandermondeMatrix
[
	1   1   1   1   1;
	1   2   4   8  16;
	1   3   9  27  81;
	1   4  16  64 256;
	1   5  25 125 625
]
```

A rectangular Vandermonde matrix:

```
>>> [0 1/4 1/3 1/2 2/3 3/4 1]
>>> .vandermondeMatrix(11)
[
	1 0 0 0 0 0 0 0 0 0 0
	;
	1/1 1/4
	1/16 1/64
	1/256 1/1024
	1/4096 1/16384
	1/65536 1/262144
	1/1048576
	;
	1/1 1/3
	1/9 1/27
	1/81 1/243
	1/729 1/2187
	1/6561 1/19683
	1/59049
	;
	1/1 1/2
	1/4 1/8
	1/16 1/32
	1/64 1/128
	1/256 1/512
	1/1024
	;
	1/1 2/3
	4/9 8/27
	16/81 32/243
	64/729 128/2187
	256/6561 512/19683
	1024/59049
	;
	1/1 3/4
	9/16 27/64
	81/256 243/1024
	729/4096 2187/16384
	6561/65536 19683/262144
	59049/1048576
	;
	1 1 1 1 1 1 1 1 1 1 1
]
```

* * *

See also: binomial, cauchyMatrix, interpolation, factorialPower, linearRecurrence, powerRange

Guides: Fourier Analysis Functions, Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/VandermondeMatrix.html)
[2](https://reference.wolfram.com/language/ref/VandermondeMatrix.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/vander.html),
_Python_
[1](https://numpy.org/doc/stable/reference/generated/numpy.polynomial.polynomial.polyvander.html)
