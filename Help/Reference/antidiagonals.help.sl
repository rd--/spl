# antidiagonals

- _antidiagonals(m)_

Answer a list of all of the antidiagonals of the matrix _m_.

At a 3×3 matrix:

```
>>> [3 3].iota
[
	1 2 3;
	4 5 6;
	7 8 9
]

>>> [3 3].iota.antidiagonals
[
	1;
	2 4;
	3 5 7;
	6 8;
	9
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

>>> [5 4].iota.antidiagonals
[
	 1;
	 2  5;
	 3  6  9;
	 4  7 10 13;
	 8 11 14 17;
	12 15 18;
	16 19;
	20
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

>>> [4 5].iota.antidiagonals
[
	 1;
	 2  6;
	 3  7 11;
	 4  8 12 16;
	 5  9 13 17;
	10 14 18;
	15 19;
	20
]
```

Sum over antidiagonals:

```
>>> let p = [1 2 1];
>>> let q = [1 3 3 1];
>>> let m = *.table(p, q);
>>> (m, m.antidiagonals.collect(sum/1))
(
	[
		1 3 3 1;
		2 6 6 2;
		1 3 3 1
	],
	[1 5 10 10 5 1]
)
```

* * *

See also: antidiagonal, diagonals

Guides: Matrix Functions
