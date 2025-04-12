# subarray

- _subarray(a, i)_

Answer a sub-array of the array _a_ given the sequence of indices _i_.
A sub-array of an array is an array obtained by retaining any collection of entries at each dimension.
The answer has the same `rank` as the initial array.

A 2×2×2 sub-array of a 3×4×3 array,
selecting the first and third _pages_,
the second and fourth _rows_,
and the first and second _columns_:

```
>>> [3 4 3].iota.subarray([1 3; 2 4; 1 2])
[
	 4  5;
	10 11
	:;
	28 29;
	34 35
]
```

A 2×2 sub-array of a 3×3 array:

```
>>> [3 3].iota.subarray([1:2, 2:3])
[
	2 3;
	5 6
]
```

A 2×4 sub-array of a 3×4 array,
the row and column indices need not be in order and may have repetitions:

```
>>> let a = [1 2 3 4; 5 6 7 8; 9 0 1 2];
>>> a.subarray([3 1; 2 3 4 3])
[
	0 1 2 1;
	2 3 4 3
]
```

A 2×3 sub-array of a 3×4 array by deleting row three and column two:

```
>>> [3 4].iota.subarray([1 2; 1 3 4])
[
	1 3 4;
	5 7 8
]
```

The interior 2×3 sub-array of a 4×5 array:

```
>>> [4 5].iota.subarray([2:3, 2:4])
[
	 7  8  9;
	12 13 14
]
```

The third column (a 5×1 array) of a 5×5 array:

```
>>> [5 5].iota.subarray([1:5, 3:3])
[
	 3;
	 8;
	13;
	18;
	23
]
```

The middle two columns (a 4×2 array) of a 4×4 array:

```
>>> [4 4].iota.subarray([1:4, 2:3])
[
	 2  3;
	 6  7;
	10 11;
	14 15
]
```

A 1×1 sub-array of a 3×3 array:

```
>>> [3 3].iota.subarray([2; 2])
[
	[
		5
	]
]
```

It is an `error` for there to be no indices:

```
>>> {
>>> 	[1 2; 3 4].subarray([])
>>> }.ifError { true }
true
```

It is an `error` for the indices to not be a list:

```
>>> {
>>> 	[1 2; 3 4].subarray(0)
>>> }.ifError { true }
true
```

_Note:_
For the answer to be a proper subarray _i_ should specify indices of each level at most once.
For the answer to be a block subarray _i_ should contain only proper substrings of the indices of each level.

* * *

See also: at, atAll, Array, part, submatrix
