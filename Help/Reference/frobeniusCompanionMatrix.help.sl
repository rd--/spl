# frobeniusCompanionMatrix

- _frobeniusCompanionMatrix(c)_

Answer the Frobenius companion matrix of the monic polynomial with coefficients _c_.

```
>>> [3 2 1 1].frobeniusCompanionMatrix
[0 0 -3; 1 0 -2; 0 1 -1]

>>> [2 3 4 5].frobeniusCompanionMatrix
[0 0 -0.4; 1 0 -0.6; 0 1 -0.8]

>>> [6 -7 0 1].frobeniusCompanionMatrix
[0 0 -6; 1 0 7; 0 1 0]

>>> [11 7 5 3 1].frobeniusCompanionMatrix
[
	0 0 0 -11;
	1 0 0 -7;
	0 1 0 -5;
	0 0 1 -3
]

>>> [5 4 3 2 1 1].frobeniusCompanionMatrix
[
	0 0 0 0 -5;
	1 0 0 0 -4;
	0 1 0 0 -3;
	0 0 1 0 -2;
	0 0 0 1 -1
]

>>> [6 1 6 5 2 8 1 1 5 7 1]
>>> .frobeniusCompanionMatrix
[
	0  0  0  0  0  0  0  0  0 -6;
	1  0  0  0  0  0  0  0  0 -1;
	0  1  0  0  0  0  0  0  0 -6;
	0  0  1  0  0  0  0  0  0 -5;
	0  0  0  1  0  0  0  0  0 -2;
	0  0  0  0  1  0  0  0  0 -8;
	0  0  0  0  0  1  0  0  0 -1;
	0  0  0  0  0  0  1  0  0 -1;
	0  0  0  0  0  0  0  1  0 -5;
	0  0  0  0  0  0  0  0  1 -7
]
```

* * *

See also: sylvesterMatrix, toeplitzMatrix

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CompanionMatrix.html)
[2](https://reference.wolfram.com/language/ref/CharacteristicPolynomial.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/compan.html),
_W_
[1](https://en.wikipedia.org/wiki/Companion_matrix)

Categories: Math, Matrix
