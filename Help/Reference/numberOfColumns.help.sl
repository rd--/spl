# numberOfColumns

- _numberOfColumns(m)_

Answer the number of columns in an array.
This is the second element of `shape`.

A 2×3 matrix:

```
>>> [
>>> 	1 2 3;
>>> 	4 5 6
>>> ].numberOfColumns
3
```

A 3×2 matrix:

```
>>> [
>>> 	1 2;
>>> 	3 4;
>>> 	5 6
>>> ].numberOfColumns
2
```

At `NumericArray`:

```
>>> NumericArray([3 4].iota)
>>> .numberOfColumns
4
```

At multidimensional arrays answers the size of the second dimension:

```
>>> [2 4 3 5].iota.numberOfColumns
4
```

The matrix specific form is `columnCount`:

```
>>> [1 2 3; 4 5 6].columnCount
3

>>> NumericArray([3 4].iota).columnCount
4
```

* * *

See also: columnCount, dimensions, isArray, isMatrix, isVolume, List, Matrix, numberOfRows, shape

Guides: Array Functions, Matrix Functions
