# integerSequenceMatrix

- _integerSequenceMatrix([n₁ n₂ …], k)_

Answer a sparse _0,1_ matrix.
If _k='Row'_.
the integer sequence _n_ tells the row-index of the _1_ entry for each column.
If _k='Column'_,
the column-index of the _1_ entry for each row.

```
>>> [1 2 3 4 3 2 1]
>>> .integerSequenceMatrix('Row')
[
	1 0 0 0 0 0 1;
	0 1 0 0 0 1 0;
	0 0 1 0 1 0 0;
	0 0 0 1 0 0 0
]

>>> [1 2 3 4 3 2 1]
>>> .integerSequenceMatrix('Column')
[
	1 0 0 0;
	0 1 0 0;
	0 0 1 0;
	0 0 0 1;
	0 0 1 0;
	0 1 0 0;
	1 0 0 0
]
```

The assignment can be reversed,
so that _1_ indicates the last row or column,
and _2_ the second last and so on:

```
>>> [1 2 3 4 3 2 1]
>>> .integerSequenceMatrix(
>>> 	'RowReverse'
>>> )
[
	0 0 0 1 0 0 0;
	0 0 1 0 1 0 0;
	0 1 0 0 0 1 0;
	1 0 0 0 0 0 1
]

>>> [1 2 3 4 3 2 1]
>>> .integerSequenceMatrix(
>>> 	'ColumnReverse'
>>> )
[
	0 0 0 1;
	0 0 1 0;
	0 1 0 0;
	1 0 0 0;
	0 1 0 0;
	0 0 1 0;
	0 0 0 1
]
```

Matrix of one cycle of the squares modulo seventeen:

```
>>> 1:17.square.mod(17, 1)
>>> .integerSequenceMatrix(
>>> 	'RowReverse'
>>> )
[
	0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
	0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0;
	0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
	0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0;
	0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
	0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0;
	0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0;
	1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0
]
```

This residue sequence has only nine distinct values:

```
>>> 1:17.square.mod(17, 1)
>>> .deleteDuplicates
[1 4 9 16 8 2 15 13 17]
```

The sequence can be _compressed_,
whereby values are moved down to fill in gaps,
equivalent to deleting rows that are all zeroes:

```
>>> 1:17.square.mod(17, 1)
>>> .integerSequenceCompress
>>> .integerSequenceMatrix(
>>> 	'RowReverse'
>>> )
[
	0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
	0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0;
	0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0;
	0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0;
	0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0;
	0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0;
	0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0;
	1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0
]
```

The sequence can also be _normalized_,
whereby each distinct term is assigned a consecutive integer value from one in turn:

```
>>> 1:17.square.mod(17, 1)
>>> .integerSequenceNormalize
>>> .integerSequenceMatrix(
>>> 	'RowReverse'
>>> )
[
	0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
	0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0;
	0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0;
	0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0;
	0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0;
	0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0;
	0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0;
	1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0
]
```

In the case where the integer sequence is a permutation,
the _k=Column_ form is equivalent to `permutationMatrix`:

```
>>> [1 3 5 4 2 6]
>>> .integerSequenceMatrix('Column')
[1 3 5 4 2 6]
.permutationMatrix
```

* * *

See also: integerSequencePlot, matrixPlot

Guides: Matrix Functions
