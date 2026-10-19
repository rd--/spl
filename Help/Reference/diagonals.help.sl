# diagonals

- _diagonals(m)_

Answer a list of all of the diagonals of the matrix _m_.

At a 3×3 matrix:

```
>>> [3 3].iota
[
	1 2 3;
	4 5 6;
	7 8 9
]

>>> [3 3].iota.diagonals
[
	7;
	4 8;
	1 5 9;
	2 6;
	3
]
```

At a 5×4 matrix:

```
>>> [5 4].iota
[
	 1  2  3  4;
	 5  6  7  8;
	 9 10 11 12;
	13 14 15 16;
	17 18 19 20
]

>>> [5 4].iota.diagonals
[
	17;
	13 18;
	9 14 19;
	5 10 15 20;
	1 6 11 16;
	2 7 12;
	3 8;
	4
]
```

At a 4×5 matrix:

```
>>> [4 5].iota
[
	 1  2  3  4  5;
	 6  7  8  9 10;
	11 12 13 14 15;
	16 17 18 19 20
]

>>> [4 5].iota.diagonals
[
	16;
	11 17;
	6 12 18;
	1 7 13 19;
	2 8 14 20;
	3 9 15;
	4 10;
	5
]
```

* * *

See also: antidiagonals, cyclicDiagonals, diagonal

Guides: Matrix Functions
