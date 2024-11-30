# slice

- _slice(anArray, cuts)_

Select regions of arrays.

A 4×5 matrix:

```
>>> [4 5].iota
[
	 1  2  3  4  5;
	 6  7  8  9 10;
	11 12 13 14 15;
	16 17 18 19 20
]
```

Columns 1-3 of all rows (i.e. rows 1-4):


```
>>> [4 5].iota.slice([1 2 3 4; 1 2 3])
[
	 1  2  3;
	 6  7  8;
	11 12 13;
	16 17 18
]
```

Columns 1-3 of row 3:

```
>>> [4, 5].iota.slice([3; 1 2 3])
[11 12 13]
```

Columns 1-3 of rows 3-4:

```
>>> [4 5].iota.slice([3 4; 1 2 3])
[
	11 12 13;
	16 17 18
]
```

Column 4 of rows 2-4:

```
>>> [4 5].iota.slice([2 3 4; 4])
[9 14 19]
```

Column 4 of row 3:

```
>>> [4 5].iota.slice([3; 4])
14
```

A 3×3×3 array:

```
>>> [3 3 3].iota
[
	 1  2  3;
	 4  5  6;
	 7  8  9
	:;
	10 11 12;
	13 14 15;
	16 17 18
	:;
	19 20 21;
	22 23 24;
	25 26 27
]
```

Columns 1 & 3 of rows 2-3 of pages 1-2:

```
>>> [3 3 3].iota.slice([1 2; 2 3; 1 3])
[
	 4  6;
	 7  9
	:;
	13 15;
	16 18
]
```

Columns 1 & 3 of all rows of all pages:

```
>>> [3 3 3].iota.slice([1 2 3; 1 2 3; 1 3])
[
	1 3;
	4 6;
	7 9
	:;
	10 12;
	13 15;
	16 18
	:;
	19 21;
	22 24;
	25 27
]
```

Page 2:

```
>>> [3 3 3].iota.slice([2])
[
	10 11 12;
	13 14 15;
	16 17 18
]
```

Row 2 of all pages:

```
>>> [3 3 3].iota.slice([1 2 3; 2])
[
	 4  5  6;
	13 14 15;
	22 23 24
]
```

Column 2 of all pages:

```
>>> [3 3 3].iota.slice([1 2 3; 1 2 3; 2])
[
	 2  5  8;
	11 14 17;
	20 23 26
]
```

Column 2 of row 3 of all pages:

```
>>> [3 3 3].iota.slice([1 2 3; 3; 2])
[8 17 26]
```

Columns 2&3 of row 2 of all pages:

```
>>> [3 3 3].iota.slice([1 2 3; 2; 2 3])
[
	 5  6;
	14 15;
	23 24
]
```

Rows 1&2 of page 2:

```
>>> [3 3 3].iota.slice([2; 1 2])
[
	10 11 12;
	13 14 15
]
```

* * *

See also: at, Sequence
