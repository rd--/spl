# columnBinaryMatrix

- _columnBinaryMatrix([c₁ c₂ …])_

Answer the square binary matrix specified by the column indices _c_.
The answer is a `SparseArray` object.

Generate a binary matrix of a Costas array:

```
>>> [2 1 3 4].columnBinaryMatrix
SparseArray(
	[
		[2 1] -> 1,
		[1 2] -> 1,
		[3 3] -> 1,
		[4 4] -> 1
	]
)
```

* * *

See also: isCostasArray, SparseArray, welchCostasArrayList
