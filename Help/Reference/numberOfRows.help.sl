# numberOfRows

- _numberOfRows(m)_

Answer the number of rows in an array.
This is the first element of `shape`.

A 2×3 matrix:

```
>>> [
>>> 	1 2 3;
>>> 	4 5 6
>>> ].numberOfRows
2
```

A 3×2 matrix:

```
>>> [
>>> 	1 2;
>>> 	3 4;
>>> 	5 6
>>> ].numberOfRows
3
```

At `NumericArray`:

```
>>> [3 4].iota.asNumericArray
>>> .numberOfRows
3
```

At multidimensional arrays answers the size of the first dimension:

```
>>> [2 4 3 5].iota.numberOfRows
2
```

The matrix specific form is `rowCount`:

```
>>> [1 2 3; 4 5 6].rowCount
2

>>> NumericArray([3 4].iota).rowCount
3
```

* * *

See also: dimensions, isArray, isMatrix, isVolume, numberOfColumns, rowCount, shape

Guides: Array Functions, Matrix Functions

Categories: Querying
