# integerSequenceMatrix

- _integerSequenceMatrix([n₁ n₂ …], kind)_

Answer a _0,1_ matrix where the integer sequence _n_ tells the _1_ row for each column,
if _kind='Column'_,
or the _1_ column for each row,
if _kind='Row'_.

```
>>> [1 2 3 4 3 2 1]
>>> .integerSequenceMatrix('Column')
[
	1 0 0 0 0 0 1;
	0 1 0 0 0 1 0;
	0 0 1 0 1 0 0;
	0 0 0 1 0 0 0
]

>>> [1 2 3 4 3 2 1]
>>> .integerSequenceMatrix(
>>> 	'ColumnReversed'
>>> )
[
	0 0 0 1 0 0 0;
	0 0 1 0 1 0 0;
	0 1 0 0 0 1 0;
	1 0 0 0 0 0 1
]

>>> [1 2 3 4 3 2 1]
>>> .integerSequenceMatrix('Row')
[
	1 0 0 0;
	0 1 0 0;
	0 0 1 0;
	0 0 0 1;
	0 0 1 0;
	0 1 0 0;
	1 0 0 0
]

>>> [1 2 3 4 3 2 1]
>>> .integerSequenceMatrix(
>>> 	'RowReversed'
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
>>> 	'ColumnReverse'
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
>>> 	'ColumnReverse'
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
>>> 	'ColumnReverse'
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

![](sw/spl/Help/Image/integerSequenceMatrix-C.svg)

* * *

See also: integerSequencePlot, matrixPlot

Guides: Matrix Functions
