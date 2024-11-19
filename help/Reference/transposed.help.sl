# transposed

- _transposed(aMatrix)_
- _transposed(aMatrix, aPermutation)_

Answer a new matrix that is like _aMatrix_ but with the rows and columns transposed.

```
>>> [
>>> 	1 2 3;
>>> 	4 5 6
>>> ].transposed
[
	1 4;
	2 5;
	3 6
]

>>> Matrix22(1, 2, 3, 4).transposed
Matrix22(1, 3, 2, 4)
```

Transpose a 3×3 numerical matrix:

```
>>> 9.iota.reshape([3 3]).transposed
[1 4 7; 2 5 8; 3 6 9]

>>> [3 4 1; 2 3 1; 5 4 2].transposed
[3 2 5; 4 3 4; 1 1 2]
```

Transpose a row matrix into a column matrix:

```
>>> [[1.5 2.2 3.1]].transposed
[1.5; 2.2; 3.1]
```

Transposition of a vector is an error:

```
>>> { [1.5 2.2 3.1].transposed }.ifError { true }
true
```

Transpose leaves the identity matrix unchanged:

```
>>> let m = [1 0 0; 0 1 0; 0 0 1];
>>> m.transposed = m
true
```

A symmetric matrix obeys _s=sT_,
an antisymmetric matrix _a=-aT_.
This matrix is symmetric:

```
>>> let s = [1 2 3; 2 4 5; 3 5 6];
>>> s.transposed = s
true
```

This matrix is antisymmetric:

```
>>> let a = [0 1 2; -1 0 3; -2 -3 0];
>>> a.transposed.negated = a
true
```

Transpose a 2×3×4 array into 3×2×4 and 2×4×3 arrays:

```
>>> let a = [2 3 4].iota;
>>> (a, a.transposed, a.collect(transposed:/1))
(
	[
		1  2  3  4;
		5  6  7  8;
		9 10 11 12:;
			13 14 15 16;
			17 18 19 20;
			21 22 23 24
	],
	[
		 1  2  3  4;
		13 14 15 16:;
			 5  6  7  8;
			17 18 19 20:;
				 9 10 11 12;
				21 22 23 24
	],
	[
		1 5  9;
		2 6 10;
		3 7 11;
		4 8 12:;
			13 17 21;
			14 18 22;
			15 19 23;
			16 20 24
	]
)
```

Transpose the first two levels of a rank three array, effectively transposing it as a matrix of vectors:

```
>>> let a = [2 3 2].fill(stringJoin:/1);
>>> (a, a.transposed)
(
	[
		'111' '112'; '121' '122'; '131' '132':;
		'211' '212'; '221' '222'; '231' '232'
	],
	[
		'111' '112'; '211' '212':;
		'121' '122'; '221' '222':;
		'131' '132'; '231' '232'
	]
)
```

Transpose an array of depth three using different permutations:

```
>>> let a = [2 3 2].fill(stringJoin:/1);
>>> (a, a.transposed([1 3 2]), a.transposed([3 2 1]), a.transposed([2 1 3]))
(
	[
		'111' '112'; '121' '122'; '131' '132':;
		'211' '212'; '221' '222'; '231' '232'
	],
	[
		'111' '121' '131'; '112' '122' '132':;
		'211' '221' '231'; '212' '222' '232'
	],
	[
		'111' '211'; '121' '221'; '131' '231':;
		'112' '212'; '122' '222'; '132' '232'
	],
	[
		'111' '112'; '211' '212':;
		'121' '122'; '221' '222':;
		'131' '132'; '231' '232'
	]
)
```

```
>>> let a =	[
>>> 	0.8147 0.9134 0.2785 0.9649;
>>> 	0.9058 0.6324 0.5469 0.1576;
>>> 	0.1270 0.0975 0.9575 0.9706:;
>>> 		0.9572 0.1419 0.7922 0.0357;
>>> 		0.4854 0.4218 0.9595 0.8491;
>>> 		0.8003 0.9157 0.6557 0.9340
>>> ];
>>> a.transposed([2 1 3])
[
	0.8147 0.9134 0.2785 0.9649; 0.9572 0.1419 0.7922 0.0357:;
	0.9058 0.6324 0.5469 0.1576; 0.4854 0.4218 0.9595 0.8491:;
	0.127 0.0975 0.9575 0.9706; 0.8003 0.9157 0.6557 0.934
]
```

Where supported `transposed` is displayed as ᵀ.

* * *

See also: transpose

Unicode: U+1D40 ᵀ Modifier Letter Capital T

References:
_Apl_
[1](https://aplwiki.com/wiki/Transpose),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/barco),
_Mathematica_
[1](https://mathworld.wolfram.com/Tranpose.html)
[2](https://reference.wolfram.com/language/ref/Transpose.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/permute.html)

Categories: Ordering, Math, Matrix
