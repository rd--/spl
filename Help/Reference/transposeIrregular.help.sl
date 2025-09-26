# transposeIrregular

- _transposeIrregular([l₁, l₂, …])_

The transposition of a list of lists, cycling each row as required:

```
>>> [1; 2 3; 4 5 6].transposeIrregular
[
	1 2 4;
	1 3 5;
	1 2 6
]

>>> [1 4 6 7; 2 5 9; 3; 8]
>>> .transposeIrregular
[
	1 2 3 8;
	4 5 3 8;
	6 9 3 8;
	7 2 3 8
]
```

If the matrix is regular this is equal to `transpose`:

```
>>> [3 3].iota.transposeIrregular
[
	1 4 7;
	2 5 8;
	3 6 9
]
```

* * *

See also: transpose, transposeTableau
