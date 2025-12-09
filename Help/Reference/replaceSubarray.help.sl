# replaceSubarray

- _replaceSubarray(a, i, b)_

Replace the sub-array at indices indicated by _i_ in the array _a_ with the contents of the array _b_.

Replace the first row at all columns with the specified row vector:

```
>>> let m = [3 3].iota;
>>> m.replaceSubarray(
>>> 	[1; 1 2 3],
>>> 	[[-1 -2 -3]]
>>> );
>>> m
[
	-1 -2 -3;
	 4  5  6;
	 7  8  9
]
```

Replace the first column at all rows with the specified column vector:

```
>>> let m = [3 3].iota;
>>> m.replaceSubarray(
>>> 	[1 2 3; 1],
>>> 	[-1; -2; -3]
>>> );
>>> m
[
	-1 2 3;
	-2 5 6;
	-3 8 9
]
```

Replace the center of a 5×5 matrix with the specified 3×3 matrix:

```
>>> let m = [5 5].iota;
>>> m.replaceSubarray(
>>> 	[2 3 4; 2 3 4],
>>> 	[3 3].iota
>>> );
>>> m
[
	 1  2  3  4  5;
	 6  1  2  3 10;
	11  4  5  6 15;
	16  7  8  9 20;
	21 22 23 24 25
]
```

* * *

See also: Array, subarray, submatrix

Guides: Array Functions
