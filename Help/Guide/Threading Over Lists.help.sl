# Threading Over Lists

Add a scalar to a vector:

```
>>> 1 + [2 3 4]
[3 4 5]

>>> [1 2 3] + 4
[5 6 7]
```

Add a vector to each column of a matrix:

```
>>> [1 2] + [3 4 5; 6 7 8]
[4 5 6; 8 9 10]

>>> [1 2 3; 4 5 6] + [7 8]
[8 9 10; 12 13 14]
```

To add a vector to each row of a matrix,
enclose the vector:

```
>>> [[1 2 3]] + [4 5 6; 7 8 9]
[5 7 9; 8 10 12]

>>> [1 2 3; 4 5 6] + [[7 8 9]]
[8 10 12; 11 13 15]
```

Add a 2×2 matrix to each page and row of a 2×2×3 array:

```
>>> [2 2 3].iota
[
	 1  2  3;
	 4  5  6
	:;
	 7  8  9;
	10 11 12
]

>>> [2 2].iota
[
	 1  2;
	 3  4
]

>>> [2 2 3].iota + [2 2].iota
[
	 2  3  4;
	 6  7  8
	:;
	10 11 12;
	14 15 16
]
```

Add a 2×3 matrix to each of the two matrices of a 2×2×3 array:

```
>>> [2 2 3].iota + [[2 3].iota]
[
	 2  4  6;
	 8 10 12
	:;
	 8 10 12;
	14 16 18
]
```
