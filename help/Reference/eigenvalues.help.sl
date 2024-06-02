# eigenvalues

- _eigenvalues(aMatrix)_

Answer a `List` of the eigenvalues of _aMatrix_, which must be square.

Eigenvalues of two 2×2 integer matrices:

```
>>> [1 2; 2 1].eigenvalues
[3 -1]

>>> [3 2; 7 -2].eigenvalues
[5 -4]
```

Eigenvalues of two 3×3 integer matrices:

```
>>> [9 -7 3; 12 -10 3; 16 -16 1].eigenvalues
[-3 2 1]

>>> [1 2 3; 4 5 6; 7 8 9].eigenvalues
[
	3/2 * (5 + 33.sqrt),
	3/2 * (5 - 33.sqrt),
	0
]

>>> [2 1 2; 2 3 3; 4 5 4].eigenvalues
[8.8092 0.9262 -0.7354]
```

Eigenvalues of a 3×3 real matrix:

```
>>> [1.1 2.2 3.25; 0.76 4.6 5; 0.1 0.1 6.1].eigenvalues
[6.60674 4.52536 0.66790]
```

Eigenvalues of a 4×4 integer matrix:

```
>>> [-6 4 0 9; -3 0 1 6; -1 -2 1 0; -4 4 0 7].eigenvalues
[5 -2 -2 1]
```

Eigen values of a 3×3 symmetric matrix:

```
>>> let s = [1 4 -2; 4 5 -3; -2 -3 2];
>>> (s = s.transposed, s.eigenvalues)
(true, [9.26080 -1.47973 0.21892])
```

* * *

See also: determinant, trace

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Eigenvalues.html)
