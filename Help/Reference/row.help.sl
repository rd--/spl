# row

- _row(m, n)_

Answer the _n_-th row of the matrix _m_ as a vector.

The second row of a 3×3 matrix:

```
>>> [3 3].iota.row(2)
[4 5 6]
```

C.f. `submatrix` to answer a one row matrix:

```
>>> [3 3].iota.submatrix(2:2, 1:3)
[
	[4 5 6]
]
```

C.f. `at`, which does not require the input be a matrix:

```
>>> [3 3].iota[2]
[4 5 6]
```

* * *

See also: at, column, rows, submatrix

Guides: Matrix Functions
