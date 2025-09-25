# matrixPower

- _matrixPower(m, n)_

Answer the _n_-th matrix power of the matrix _m_.

The second power of a 2×2 matrix:

```
>>> [1 2; 3 4].matrixPower(2)
[7 10; 15 22]

>>> let m = [1 2; 3 4];
>>> m.dot(m)
[7 10; 15 22]
```

Raise a matrix to the 10th power:

```
>>> [1 1; 1 2].matrixPower(10)
[
	4181 6765;
	6765 10946
]

>>> let m = [1 1; 1 2];
>>> { :x | x.dot(m) }.iterate(m, 10 - 1)
[
	4181 6765;
	6765 10946
]
```

Notice that this is different from raising each entry to the 10th power:

```
>>> [1 1 ; 1 2] ^ 10
[
	1    1;
	1 1024
]
```

Raise a floating point matrix to a positive integer power:

```
>>> [1.2 2.5 -3.2; 0.7 -9.4 5.8; -0.2 0.3 6.4]
>>> .matrixPower(5)
[
	-1208.60584  19598.21837 -12658.40656;
	 5784.51315 -83315.10058  35420.64898;
	 -559.10978   1960.12495  11511.91604
]
```

* * *

See also: dot

Guides: Matrix Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MatrixPower.html)

Categories: Math, Matrix
