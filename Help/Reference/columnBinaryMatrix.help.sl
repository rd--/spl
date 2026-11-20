# columnBinaryMatrix

- _columnBinaryMatrix([c₁ c₂ …])_

Answer the square binary matrix specified by the column indices _c_.
The answer is a `SparseArray` object.

Generate a binary matrix of a Costas array:

```
>>> [2L 1L 3L 4L].columnBinaryMatrix
SparseArray[
	[2L 1L] -> 1L,
	[1L 2L] -> 1L,
	[3L 3L] -> 1L,
	[4L 4L] -> 1L
]

>>> [2 1 3 4].columnBinaryMatrix
>>> .normalArray
[
	0 1 0 0;
	1 0 0 0;
	0 0 1 0;
	0 0 0 1
]
```

To recover the indices use `deepIndicesOf` and `column`:

```
>>> [
>>> 	0 1 0 0;
>>> 	1 0 0 0;
>>> 	0 0 1 0;
>>> 	0 0 0 1
>>> ].deepIndicesOf(1).column(2)
[2 1 3 4]
```

* * *

See also: SparseArray, isCostasArray, welchCostasArrayList

Guides: Matrix Functions
