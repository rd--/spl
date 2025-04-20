# magicSquareSummary

- _magicSquareSummary(aMatrix)_

Summarise the properties of a magic square.
A matrix-vector product sums the rows,
a vector-matrix product sums the columns,
also shows the diagonal and antidiagonal sums and the matrix rank:

```
>>> let m = 3.magicSquare;
>>> (m, m.magicSquareSummary)
(
	[8 1 6; 3 5 7; 4 9 2],
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

See also: magicSquare

Guides: Magic Squares
