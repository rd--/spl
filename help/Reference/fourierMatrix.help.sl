# fourierMatrix

- _fourierMatrix(n)_

Answer the _n×n_ square Fourier matrix.

```
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

Plot the imaginary part of the 33×33 Fourier matrix:

~~~
33.fourierMatrix.imaginary.matrixPlot
~~~

* * *

See also: hadamardMatrix, walshMatrix

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FourierMatrix.html)
[2](https://reference.wolfram.com/language/ref/FourierMatrix.html)
