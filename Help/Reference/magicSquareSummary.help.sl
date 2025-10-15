# magicSquareSummary

- _magicSquareSummary(m)_

Summarise the properties of a magic square.
A matrix-vector product sums the rows,
a vector-matrix product sums the columns,
also shows the diagonal and antidiagonal sums and the matrix rank.

The only 3×3 magic square,
OEIS [A033812](https://oeis.org/A033812):

```
>>> let m = 3.magicSquare;
>>> (m, m.magicSquareSummary)
(
	[
		8 1 6;
		3 5 7;
		4 9 2
	],
	(
		sum: 15,
		rowSums: [15 15 15],
		columnSums: [15 15 15],
		diagonalSum: 15,
		anitdiagonalSum: 15,
		rank: 3
	)
)
```

A 4×4 magic square:

```
>>> [
>>> 	2 16 13 3;
>>> 	11 5 8 10;
>>> 	7 9 12 6;
>>> 	14 4 1 15
>>> ].magicSquareSummary
(
	sum: 34,
	rowSums: [34 34 34 34],
	columnSums: [34 34 34 34],
	diagonalSum: 34,
	anitdiagonalSum: 34,
	rank: 3
)
```

A 5×5 magic square,
OEIS [A127907](https://oeis.org/A127907):

```
>>> [
>>> 	17 24  1  8 15;
>>> 	23  5  7 14 16;
>>> 	04  6 13 20 22;
>>> 	10 12 19 21  3;
>>> 	11 18 25  2  9
>>> ].magicSquareSummary.values
[65, 65 # 5, 65 # 5, 65, 65, 5]
```

A 7×7 magic square,
OEIS [A126651](https://oeis.org/A126651):

```
>>> [
>>> 	71  1 51 32 50  2 80;
>>> 	21 41 61 56 26 13 69;
>>> 	31 81 11 20 62 65 17;
>>> 	34 40 60 43 28 64 18;
>>> 	48 42 22 54 39 75  7;
>>> 	33 53 15 68 16 44 58;
>>> 	49 29 67 14 66 24 38
>>> ].magicSquareSummary.values
[175, 287 # 7, 287 # 7, 287, 322, 7]
```

A 9×9 magic square,
OEIS [A126650](https://oeis.org/A126650):

```
>>> [
>>> 	71  1 51 32 50  2 80  3 79;
>>> 	21 41 61 56 26 13 69 25 57;
>>> 	31 81 11 20 62 65 17 63 19;
>>> 	34 40 60 43 28 64 18 55 27;
>>> 	48 42 22 54 39 75  7 10 72;
>>> 	33 53 15 68 16 44 58 77  5;
>>> 	49 29 67 14 66 24 38 59 23;
>>> 	76  4 70 73  8 37 36 30 35;
>>> 	06  78 12  9 74 45 46 47 52
>>> ].magicSquareSummary.values
[369, 369 # 9, 369 # 9, 369, 369, 9]
```

A non-magic square:

```
>>> [3 3].iota.magicSquareSummary
(
	sum: 15,
	rowSums: [6 15 24],
	columnSums: [12 15 18],
	diagonalSum: 15,
	anitdiagonalSum: 15,
	rank: 2
)
```

* * *

See also: antidiagonal, diagonal, isMagicSquare, magicHexagon, magicSquare, matrixRank

Guides: Magic Square Functions, Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MagicSquare.html),
_OEIS_
[1](https://oeis.org/A033812)
[2](https://oeis.org/A126649)
[3](https://oeis.org/A126650)
[4](https://oeis.org/A126651)
[5](https://oeis.org/A127907)
_W_
[1](https://en.wikipedia.org/wiki/Magic_square)
