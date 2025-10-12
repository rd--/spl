# transpose

- _transpose(m)_
- _transpose(a, p)_

In the unary case,
answer a new matrix that is like the matrix _m_ but with the rows and columns transposed.

In the binary case,
answer a new array that is like the array _a_ but with the dimensions shape rearranged according to the permutation _p_.

At `List`, transpose a 2×3 matrix into a 3×2 matrix:

```
>>> [
>>> 	1 2 3;
>>> 	4 5 6
>>> ].transpose
[
	1 4;
	2 5;
	3 6
]

>>> [1 2 3; 4 5 6].transpose([2 1])
[1 4; 2 5; 3 6]
```

At `List`, transpose a 3×2 matrix into a 2×3 matrix:

```
>>> [0 0; 0.5 1; 1 0].transpose
[0 0.5 1; 0 1 0]

>>> [0 0; 0.5 1; 1 0].transpose([2 1])
[0 0.5 1; 0 1 0]
```

At a `List` of `Range` values:

```
>>> [1:5, 3:7, 5:9].transpose
[
	1 3 5;
	2 4 6;
	3 5 7;
	4 6 8;
	5 7 9
]
```

At `NumericArray`:

```
>>> [1 2; 3 4].asNumericArray.transpose
[1 3; 2 4].asNumericArray

>>> [3 4].iota.asNumericArray.transpose
[
	1  5  9;
	2  6 10;
	3  7 11;
	4  8 12
].asNumericArray
```

Transpose a 3×3 numerical matrix:

```
>>> 9.iota.reshape([3 3]).transpose
[1 4 7; 2 5 8; 3 6 9]

>>> [3 4 1; 2 3 1; 5 4 2].transpose
[3 2 5; 4 3 4; 1 1 2]
```

Transpose a row matrix into a column matrix:

```
>>> [[1.5 2.2 3.1]].transpose
[1.5; 2.2; 3.1]
```

Transposition of a vector is an error:

```
>>> {
>>> 	[1.5 2.2 3.1].transpose
>>> }.hasError
true
```

Transposition requires that the matrix be regular:

```
>>> {
>>> 	[1 2; 3 4 5].transpose
>>> }.hasError
true

>>> {
>>> 	[1 2; 3 4 5].transpose([2 1])
>>> }.hasError
true
```

Transpose leaves the identity matrix unchanged:

```
>>> let m = [1 0 0; 0 1 0; 0 0 1];
>>> m.transpose = m
true
```

A symmetric matrix obeys _s=sT_,
an antisymmetric matrix _a=-aT_.
This matrix is symmetric:

```
>>> let s = [1 2 3; 2 4 5; 3 5 6];
>>> s.transpose = s
true
```

This matrix is antisymmetric:

```
>>> let a = [0 1 2; -1 0 3; -2 -3 0];
>>> a.transpose.negate = a
true
```

Transpose a 2×3×4 array into 3×2×4 and 2×4×3 arrays:

```
>>> let a = [2 3 4].iota;
>>> (
>>> 	a,
>>> 	a.transpose,
>>> 	a.collect(transpose:/1)
>>> )
(
	[
		1  2  3  4;
		5  6  7  8;
		9 10 11 12
		:;
		13 14 15 16;
		17 18 19 20;
		21 22 23 24
	],
	[
		 1  2  3  4;
		13 14 15 16
		:;
		5  6  7  8;
		17 18 19 20
		:;
		9 10 11 12;
		21 22 23 24
	],
	[
		1 5  9;
		2 6 10;
		3 7 11;
		4 8 12
		:;
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
>>> (a, a.transpose)
(
	[
		'111' '112';
		'121' '122';
		'131' '132'
		:;
		'211' '212';
		'221' '222';
		'231' '232'
	],
	[
		'111' '112';
		'211' '212'
		:;
		'121' '122';
		'221' '222'
		:;
		'131' '132';
		'231' '232'
	]
)
```

Transpose an array of depth three using different permutations:

```
>>> let a = [2 3 2].fill(stringJoin:/1);
>>> (
>>> 	a,
>>> 	a.transpose([1 3 2]),
>>> 	a.transpose([3 2 1]),
>>> 	a.transpose([2 1 3])
>>> )
(
	[
		'111' '112';
		'121' '122';
		'131' '132'
		:;
		'211' '212';
		'221' '222';
		'231' '232'
	],
	[
		'111' '121' '131';
		'112' '122' '132'
		:;
		'211' '221' '231';
		'212' '222' '232'
	],
	[
		'111' '211';
		'121' '221';
		'131' '231'
		:;
		'112' '212';
		'122' '222';
		'132' '232'
	],
	[
		'111' '112';
		'211' '212'
		:;
		'121' '122';
		'221' '222'
		:;
		'131' '132';
		'231' '232'
	]
)
```

Transpose a 2×3×4 array into a 3×2×4 array:

```
>>> let a = [
>>> 	0.8147 0.9134 0.2785 0.9649;
>>> 	0.9058 0.6324 0.5469 0.1576;
>>> 	0.1270 0.0975 0.9575 0.9706
>>> 	:;
>>> 	0.9572 0.1419 0.7922 0.0357;
>>> 	0.4854 0.4218 0.9595 0.8491;
>>> 	0.8003 0.9157 0.6557 0.9340
>>> ];
>>> a.transpose([2 1 3])
[
	0.8147 0.9134 0.2785 0.9649;
	0.9572 0.1419 0.7922 0.0357
	:;
	0.9058 0.6324 0.5469 0.1576;
	0.4854 0.4218 0.9595 0.8491
	:;
	0.127 0.0975 0.9575 0.9706;
	0.8003 0.9157 0.6557 0.934
]
```

Transposition of a 3×2×2 array into a 2×3×2 array,
the transposition works on the outermost dimensions:

```
>>> [1 1; 1 4:; 4 4; 4 1:; 2 2; 2 2]
>>> .transpose
[1 1; 4 4; 2 2:; 1 4; 4 1; 2 2]
```

To transpose irregular matrices see `transposeIrregular`:

```
>>> [1 2 3; 4 5 6 7].transposeIrregular
[1 4; 2 5; 3 6; 1 7]

>>> [1 2 3 4; 5 6 7].transposeIrregular
[1 5; 2 6; 3 7; 4 5]
```

Where supported `transpose` is displayed as ᵀ.

* * *

See also: transposeInPlace, transposeIrregular, transposeTableau

Guides: Matrix Functions

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

Unicode: U+1D40 ᵀ Modifier Letter Capital T

Categories: Rearranging, Math, Matrix
