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

First few terms of OEIS [A052534](https://oeis.org/A052534):

```
>>> let v = [0 1 0];
>>> let m = [
>>> 	1 1 1;
>>> 	1 1 0;
>>> 	1 0 0
>>> ];
>>> 0:11.collect { :n |
>>> 	v.dot(
>>> 		matrixPower(m, n + 1)
>>> 	).dot(v)
>>> }
[1 2 4 9 20 45 101 227 510 1146 2575 5786]
```

Construct the Stolarsky array,
OEIS [A035506](https://oeis.org/A035506):

```
>>> { :n :k |
>>> 	let t = (1 + 5.sqrt) / 2;
>>> 	let u = n * (t + 1) + 1 + (t / 2);
>>> 	let a = u.floor;
>>> 	let b = (a * t).round;
>>> 	let c = [1 1; 1 0].matrixPower(k);
>>> 	let m = [b a].dot(c);
>>> 	m[2]
>>> }.table(0:5, 0:8)
[
	 1  2  3  5  8  13  21  34  55;
	 4  6 10 16 26  42  68 110 178;
	 7 11 18 29 47  76 123 199 322;
	 9 15 24 39 63 102 165 267 432;
	12 19 31 50 81 131 212 343 555;
	14 23 37 60 97 157 254 411 665
]
```

* * *

See also: dot

Guides: Matrix Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MatrixPower.html),
_OEIS_
[1](https://oeis.org/A052534)

Categories: Math, Matrix
