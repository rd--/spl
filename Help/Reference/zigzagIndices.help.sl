# zigzagIndices

- _zigzagIndices([m n])_

Answer the zigzag indices into an _m×n_ matrix.

Indices for a _3×3_ square matrix:

```
>>> [3 3].zigzagIndices
[
	1 1;
	1 2; 2 1;
	3 1; 2 2; 1 3;
	2 3; 3 2;
	3 3
]

>>> [3 3].zigzagIndices
>>> .collect(sum:/1)
[2 3 3 4 4 4 5 5 6]
```

* * *

See also: zigzagMatrix, zigzagScan
