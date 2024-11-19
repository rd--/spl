# frobeniusCompanionMatrix

- _frobeniusCompanionMatrix(aSequence)_

Answer the Frobenius companion matrix of the monic polynomial with coefficients _aSequence_.

```
>>> [6 1 6 5 2 8 1 1 5 7 1].frobeniusCompanionMatrix
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
_W_
[1](https://en.wikipedia.org/wiki/Companion_matrix)

Categories: Math, Matrix
