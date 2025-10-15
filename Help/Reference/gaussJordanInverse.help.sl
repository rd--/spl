# gaussJordanInverse

- _gaussJordanInverse(m)_

Answer the inverse of the square matrix _m_ using Gauss-Jordan elimination.

Inverse of a 2×2 real valued matrix:

```
>>> let m = [1.4 2; 3 -6.7];
>>> let i = m.gaussJordanInverse;
>>> (i, i ~ m.inverse)
([0.43563 0.13004; 0.19506 -0.09103], true)
```

Inverses of 3×3 integer matrices:

```
>>> [1 2 3; 4 2 2; 5 1 7]
>>> .gaussJordanInverse
[
	-2/7 11/42  1/21;
	 3/7  4/21 -5/21;
	 1/7 -3/14  1/7
]

>>> [2 3 2; 4 9 2; 7 2 4]
>>> .gaussJordanInverse
[
	-8/13  2/13   3/13;
	 1/26  3/26  -1/13;
	55/52 -17/52 -3/26
]

>>> [0 -3 -2; 1 -4 -2; -3 4 1]
>>> .gaussJordanInverse
[4 -5 -2; 5 -6 -2; -8 9 3]

>>> [2 -1 0; -1 2 -1; 0 -1 2]
>>> .gaussJordanInverse
[
	3/4 1/2 1/4;
	1/2 1   1/2;
	1/4 1/2 3/4
]
```

Find the gaussJordanInverse of a 3×3 real valued matrix:

```
>>> [
>>> 	1.2 2.5 -3.2;
>>> 	0.7 -9.4 5.8;
>>> 	-0.2 0.3 6.4
>>> ].gaussJordanInverse
[
	0.74546  0.20425  0.18763;
	0.06792 -0.08478  0.11080;
	0.02011  0.010357 0.15692
]
```

* * *

See also: inverse, reducedRowEchelonForm

Guides: Matrix Functions
