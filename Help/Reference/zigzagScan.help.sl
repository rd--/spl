# zigzagScan

- _zigzagScan(m)_

Scan the matrix _m_ using the zigzag method.

A 3×3 square matrix:

```
>>> [3 3].iota
[
	1 2 3;
	4 5 6;
	7 8 9
]

>>> [3 3].iota.zigzagScan
[
	1
	2 4
	7 5 3
	6 8
	9
]
```

A 3×5 matrix:

```
>>> [3 5].iota
[
	 1  2  3  4  5;
	 6  7  8  9 10;
	11 12 13 14 15
]

>>> [3 5].iota.zigzagScan
[
	 1
	 2  6
	11  7  3
	 4  8 12
	13  9  5
	10 14
	15
]
```

A 6×5 matrix:

```
>>> [6 5].iota
[
	 1  2  3  4  5;
	 6  7  8  9 10;
	11 12 13 14 15;
	16 17 18 19 20;
	21 22 23 24 25;
	26 27 28 29 30
]

>>> [6 5].iota.zigzagScan
[
	 1
	 2  6
	11  7  3
	 4  8 12 16
	21 17 13  9  5
	10 14 18 22 26
	27 23 19 15
	20 24 28
	29 25
	30
]
```

* * *

See also: zigzagIndices, zigzagMatrix

Further Reading: Tescher 1973
