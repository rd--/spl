# numberOfRows

- _numberOfRows(aMatrix)_

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

* * *

See also: isArray, isMatrix, isVolume, numberOfColumns, shape

Categories: Querying
