# matrixPower

- _matrixPower(aMatrix, anInteger)_

Answer the _anInteger_-th matrix power of _aMatrix_.

Raise a matrix to the 10th power:

```
>>> [1 1; 1 2].matrixPower(10)
[
	4181 6765;
	6765 10946
]
```

Notice that this is different from raising each entry to the 10th power:

```
>>> [1 1 ; 1 2] ^ 10
[
	1 1;
	1 1024
]
```

Raise a floating point matrix to a positive integer power:

```
>>> [1.2 2.5 -3.2; 0.7 -9.4 5.8; -0.2 0.3 6.4].matrixPower(5)
[
	-1208.60584  19598.21837 -12658.40656;
	 5784.51315 -83315.10058  35420.64898;
	 -559.10978   1960.12495  11511.91604
]
```

* * *

See also: dot

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MatrixPower.html)

Categories: Math, Matrix
