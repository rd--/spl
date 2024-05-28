# gramSchmidt

- _gramSchmidt(aMatrix)_

Answer an orthonormal basis found by orthogonalizing the vectors of _aMatrix_ using the Gram–Schmidt procedure.

Two integer two-vectors:

```
>>> [3 1; 2 2].gramSchmidt
[
	[3 1] / 10.sqrt,
	[-1 3] / 10.sqrt
]
```

Two real two-vectors:

```
>>> [1.25 3; 7.9 -1.4].gramSchmidt
[
	0.38462  0.92308;
	0.92308 -0.38462
]
```

Two three-vectors:

```
>>> [1 0 1; 1 1 1].gramSchmidt
[
	[1 0 1] / 2.sqrt,
	[0 1 0]
]
```

Three two-vectors:

```
>>> [2 3; 0 2; 3 1].gramSchmidt
[
	[2 3 ] / 13.sqrt,
	[-3 2] / 13.sqrt,
	[-1 -1] / 2.sqrt
]
```

Two three-vectors:

```
>>> [2 4 -2; -3 3 0].gramSchmidt
[
	[1 2 -1] / 6.sqrt,
	[-7 4 1] / 66.sqrt
]
```

Three three-vectors:

```
>>> [1 1 0; 0 1 1; 1 0 1].gramSchmidt
[
	[1 1 0] / 2.sqrt,
	[-1 1 2] / 6.sqrt,
	[1 -1 1] / 3.sqrt
]
```

Four three-vectors, the number of rows should be greater or equal to the number of colums:

```
>>> let m = [1 0 1; 2 6 3; 1 1 1; 2 3 5];
>>> m.gramSchmidt.take(3)
[
	[ 1   0  1] / 2.sqrt,
	[-1  12  1] / 146.sqrt,
	[ 6   1 -6] / 73.sqrt
]
```

Three four-vectors:

```
>>> [1 -1 0 0; 0 1 -1 0; 0 0 1 -1].gramSchmidt
[
	[1 -1  0  0] / 2.sqrt,
	[1  1 -2  0] / 6.sqrt,
	[1  1  1 -3] / 12.sqrt
]
```

Five three-vectors

```
>>> let m = [1 3 7; -1 2 -3; -1 2 -9; 1 -4 7; 1 2 1];
>>> m.transposed.gramSchmidt
[
	[1 -1 -1 1 1] / 5.sqrt,
	[18 7 7 -17 13] / (4 * 55.sqrt),
	[16 16 -17 2 -19] / 1166.sqrt
]
```

* * *

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Orthogonalize.html),
_W_
[1](https://en.wikipedia.org/wiki/Gram%E2%80%93Schmidt_process)
