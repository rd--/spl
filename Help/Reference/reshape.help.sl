# reshape

- _reshape(aCollection, shape)_

Answer a `List` with the indicated _shape_ and with elements drawn from _aCollection_.
Elements are drawn in `ravel` order,
truncating if the result has smaller bound than the right argument,
and repeating cyclically if it has larger bound.

Create a 3×3 matrix from a nine-vector:

```
>>> 9.iota.reshape([3 3])
[
	1 2 3;
	4 5 6;
	7 8 9
]
```

Create a 3×3 matrix from a three-vector,
recycling elements as required:

```
>>> 3.iota.reshape([3 3])
[
	1 2 3;
	1 2 3;
	1 2 3
]
```

Create a 2×2 matrix from a nine-vector,
discaring excess elements:

```
>>> 9.iota.reshape([2 2])
[
	1 2;
	3 4
]
```

Create a 3×4 matrix from a twelve-vector:

```
>>> 12.iota.reshape([3 4])
[
	1  2  3  4;
	5  6  7  8;
	9 10 11 12
]
```

Create a twelve-vector from a four-vector,
recycle elements are required:

```
>>> 4.iota.reshape([12])
[1 2 3 4 1 2 3 4 1 2 3 4]
```

`reshape` can decrease the rank or bound of a list.
Create a nine-vector from a 3×3 matrix:

```
>>> [
>>> 	1 2 3;
>>> 	4 5 6;
>>> 	7 8 9
>>> ].reshape([9])
[1 2 3 4 5 6 7 8 9]
```

Create a three-vector from a 3×3 matrix,
discarding excess elements:

```
>>> [
>>> 	1 2 3;
>>> 	4 5 6;
>>> 	7 8 9
>>> ].reshape([3])
[1 2 3]
```

Create a 3×3 matrix from a 2×2 matrix,
recycling elements as required:

```
>>> [
>>> 	1 2;
>>> 	3 4
>>> ].reshape([2 4])
[
	1 2 3 4;
	1 2 3 4
]
```

`reshape` can be used to produce an identity matrix by reshaping a vector which is one longer than the desired side length:

```
>>> [1 0 0 0 0].reshape([4 4])
[
	1 0 0 0;
	0 1 0 0;
	0 0 1 0;
	0 0 0 1
]
```

Create a 2×3 matrix from a `Range` value:

```
>>> 1:6.reshape([2 3])
[
	1 2 3;
	4 5 6
]
```

Create a 2×3 matrix from the `contents` of a `String` value:

```
>>> 'abcdef'.contents.reshape([2 3])
[
	'a' 'b' 'c';
	'd' 'e' 'f'
]
```

Reshape a four-vector into a 2×2 matrix:

```
>>> [1 2 3 4].reshape([2 2])
[
	1 2;
	3 4
]
```

Reshape a 24-vector into a 2×3×4 array:

```
>>> 1:24.reshape([2 3 4])
[
	 1  2  3  4;
	 5  6  7  8;
	 9 10 11 12
	:;
	13 14 15 16;
	17 18 19 20;
	21 22 23 24
]
```

`reshape` can transform a matrix into another matrix with different dimensions.
Reshape a 4×3 matrix into a 3×4 matrix.

```
>>> let m = [4 3].iota;
>>> (m, m.reshape([3 4]))
(
	[
		1 2 3;
		4 5 6;
		7 8 9;
		10 11 12
	],
	[
		1 2 3 4;
		5 6 7 8;
		9 10 11 12
	]
)
```

`reshape` can transform a matrix into a higher rank array:
Reshape a 4×3 matrix into a 2×2×3 array.

```
>>> [
>>> 	1 2 3;
>>> 	4 5 6;
>>> 	7 8 9;
>>> 	10 11 12
>>> ].reshape([2 2 3])
[
	1 2 3;
	4 5 6
	:;
	7 8 9;
	10 11 12
]
```

Reversing matrix dimensions does not give the same element order as `transposed`:

```
>>> let s = [3 4];
>>> let m = s.iota;
>>> (m.reshape(s.reversed), m.transposed)
(
	[
		 1  2  3;
		 4  5  6;
		 7  8  9;
		10 11 12
	],
	[
		1  5  9;
		2  6 10;
		3  7 11;
		4  8 12
	]
)
```

Elements from the original list that do not fit in the given dimensions are dropped:

```
>>> 1:99.reshape([2 3 4])
[
	 1  2  3  4;
	 5  6  7  8;
	 9 10 11 12
	:;
	13 14 15 16;
	17 18 19 20;
	21 22 23 24
]
```

Make a vector of 10 places:

```
>>> ['x'].reshape([10])
('x' # 10)
```

Make a 3×4 array:

```
>>> ['x'].reshape([3 4])
('x' # 4 ! 3)
```

`shape` after `reshape` is requested `shape`:

```
>>> [3 2 1].iota.reshape([2 3 1]).shape
[2 3 1]
```

The ordering is _row_ not _column_:

```
>>> 1:10.reshape([5 2])
[
	1  2;
	3  4;
	5  6;
	7  8;
	9 10
]

>>> 1:10.reshape([2 5]).transposed
[
	1  6;
	2  7;
	3  8;
	4  9;
	5 10
]
```

Where supported `reshape` is displayed as ⍴.

* * *

See also: iota, rank, reshapeLike, shape

References:
_Apl_
[1](https://aplwiki.com/wiki/Reshape),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ArrayReshape.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/reshape.html)

Unicode: U+2374 ⍴ Apl Functional Symbol Rho
