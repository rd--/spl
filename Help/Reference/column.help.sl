# column

- _column(m, n)_

Answer the _n_-th column of the matrix _m_ as a vector.

The second column of a 3×3 matrix:

```
>>> [3 3].iota.column(2)
[2 5 8]
```

C.f. `columns` to answer a column vector:

```
>>> [3 3].iota.columns(2:2)
[
	2;
	5;
	8
]
```

C.f. `submatrix` to answer a column vector:

```
>>> [3 3].iota.submatrix(1:3, 2:2)
[2; 5; 8]
```

C.f. `transposed` to answer all columns as rows:

```
>>> [3 3].iota.transposed
[1 4 7; 2 5 8; 3 6 9]
```

It is an error if the column is out of bounds:

```
>>> {
>>> 	[5 5].iota.column(9)
>>> }.ifError { true }
true
```

* * *

See also: at, columns, List, Matrix, row, submatrix, transposed

Guides: Matrix Functions
