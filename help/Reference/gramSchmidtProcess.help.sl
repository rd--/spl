# gramSchmidtProcess

- _gramSchmidtProcess(aMatrix)_

Answer an orthonormal basis found by orthogonalizing the vectors of _aMatrix_ using the Gram–Schmidt procedure.

Two integer two-vectors (a 2×2 matrix):

```
>>> [3 1; 2 2].gramSchmidtProcess
[
	[3 1] / 10.sqrt,
	[-1 3] / 10.sqrt
]
```

Two real two-vectors (a 2×2 matrix):

```
>>> [1.25 3; 7.9 -1.4].gramSchmidtProcess
[
	0.38462  0.92308;
	0.92308 -0.38462
]
```

Two three-vectors (a 2×3 matrix):

```
>>> [1 0 1; 1 1 1].gramSchmidtProcess
[
	[1 0 1] / 2.sqrt,
	[0 1 0]
]
```

Three two-vectors (a 3×2 matrix):

```
>>> [2 3; 0 2; 3 1].gramSchmidtProcess
[
	[2 3 ] / 13.sqrt,
	[-3 2] / 13.sqrt,
	[-1 -1] / 2.sqrt
]
```

Two three-vectors (a 2×3 matrix):

```
>>> [2 4 -2; -3 3 0].gramSchmidtProcess
[
	[1 2 -1] / 6.sqrt,
	[-7 4 1] / 66.sqrt
]
```

Three three-vectors (a 3×3 matrix):

```
>>> [1 1 0; 0 1 1; 1 0 1].gramSchmidtProcess
[
	[1 1 0] / 2.sqrt,
	[-1 1 2] / 6.sqrt,
	[1 -1 1] / 3.sqrt
]
```

Four three-vectors (a 4×3 matrix):

```
>>> let m = [1 0 1; 2 6 3; 1 1 1; 2 3 5];
>>> m.gramSchmidtProcess.take(3)

[
	[ 1   0  1] / 2.sqrt,
	[-1  12  1] / 146.sqrt,
	[ 6   1 -6] / 73.sqrt
]
```

  -3.162278  -6.008328  -5.692100
   0.632456  -3.146427   0.063564
   0.316228  -0.140960   1.896302
   0.632456   0.035902  -0.943649

Three four-vectors (a 3×4 matrix):

```
>>> [1 -1 0 0; 0 1 -1 0; 0 0 1 -1].gramSchmidtProcess
[
	[1 -1  0  0] / 2.sqrt,
	[1  1 -2  0] / 6.sqrt,
	[1  1  1 -3] / 12.sqrt
]
```

Three five-vectors (a 3×5 matrix):

```
>>> let m = [1 -1 -1 1 1; 3 2 2 -4 2; 7 -3 -9 7 1];
>>> m.gramSchmidtProcess
[
	[1 -1 -1 1 1] / 5.sqrt,
	[18 7 7 -17 13] / (4 * 55.sqrt),
	[16 16 -17 2 -19] / 1166.sqrt
]
```

Three three-vectors (a 3×3 matrix):


```
>>> [3 4 2; 2 5 2; 1 2 6].gramSchmidtProcess
[
	 0.55708  0.74278  0.37139;
	-0.78707  0.61489 -0.04919;
	-0.26491 -0.26491  0.92717
]
```

Calculate the orthonormal basis vectors for the range of a rank deficient matrix:

```
>>> [1 0 1; 0 1 0; 1 0 1].gramSchmidtProcess.take(2)
[
	0.7071 0 0.7071;
	0      1 0
]
```

* * *

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Orthogonalize.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/orth.html),
_W_
[1](https://en.wikipedia.org/wiki/Gram%E2%80%93Schmidt_process)
