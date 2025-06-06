# fourierMatrix

- _fourierMatrix(n)_
- _fourierMatrix(n, [a b])_

Answer the _n×n_ square Fourier matrix.

```
>>> 2.fourierMatrix
[1 1; 1 -1] * (1 / 2.sqrt)

>>> 2.fourierMatrix / (1 / 2.sqrt)
[1 1; 1 -1]

>>> 4.fourierMatrix / (1 / 4.sqrt)
[
	1  1    1  1;
	1  1.i -1 -1.i;
	1 -1    1 -1;
	1 -1.i -1  1.i
]
```

Fourier matrices are unitary, that is the inverse is equal to the conjugate transpose:

```
>>> 4.fourierMatrix.isUnitaryMatrix
true
```

A Fourier matrix can be represented as a scaled Vandermonde matrix:

```
>>> let n = 4;
>>> let a = 1;
>>> let b = -1;
>>> let m = 1 / (n ^ ((1 - a) / 2));
>>> let v = [0 .. n - 1] * (2.pi.i * b) / n;
>>> v.exp.vandermondeMatrix * m
[
	1   1      1   1;
	1   0J-1  -1   0J1;
	1  -1      1  -1;
	1   0J+1  -1   0J-1
]
```

The default definition of the Fourier matrix:

```
>>> 4.fourierMatrix([0 1])
4.fourierMatrix
```

The definition of the Fourier matrix used in signal processing:

```
>>> 4.fourierMatrix([1 -1])
[
	1 1 1 1;
	1 0J-1 -1 0J1;
	1 -1 1 -1;
	1 0J1 -1 0J-1
]
```

The definition of the Fourier matrix used in data analysis:

```
>>> 4.fourierMatrix([-1 1])
[
	0.25  0.25        0.25  0.25;
	0.25  0.00J0.25  -0.25  0.00J-0.25;
	0.25 -0.25        0.25 -0.25;
	0.25  0.00J-0.25 -0.25  0.00J0.25
]
```

Multiplying the Fourier matrix by a vector calculates the Fourier transform:

```
>>> 6.fourierMatrix.dot([1 .. 6])
[1 .. 6].fourier
```

Plot the imaginary part of the 24×24 Fourier matrix:

~~~spl svg=A
24.fourierMatrix.imaginary.matrixPlot
~~~

![](sw/spl/Help/Image/fourierMatrix-A.svg)

* * *

See also: hadamardMatrix, fourier, vandermondeMatrix, walshMatrix

Guides: Fourier Analysis Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FourierMatrix.html)
[2](https://reference.wolfram.com/language/ref/FourierMatrix.html),
_Mathworks_
[1](https://mathworks.com/help/signal/ref/dftmtx.html)
_W_
[1](https://en.wikipedia.org/wiki/DFT_matrix)

Categories: Math, Matrix
