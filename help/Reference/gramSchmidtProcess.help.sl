# gramSchmidtProcess

- _gramSchmidtProcess(aMatrix)_

Answer an orthonormal basis found by orthogonalizing the vectors of _aMatrix_ using the Gram–Schmidt procedure.

Two three-vectors (a 2×3 matrix):

```
>>> [2 4 -2; -3 3 0].gramSchmidtProcess
[
	[ 1  2 -1] / 6.sqrt,
	[-7  4  1] / 66.sqrt
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

* * *

See also: orthogonalize

References:
_W_
[1](https://en.wikipedia.org/wiki/Gram%E2%80%93Schmidt_process)
