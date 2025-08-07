# transpose

- _transpose(m)_

Transpose the rows and columns of the matrix _m_ in place.

At square `NumericArray`:

```
>>> let m = [3 3].iota.asNumericArray;
>>> m.transpose;
>>> m.normal
[
	1 4 7;
	2 5 8;
	3 6 9
]
```

At 3×4 rectangular `NumericArray`:

```
>>> let m = [3 4].iota.asNumericArray;
>>> m.transpose;
>>> m.normal
[
	1  5  9;
	2  6 10;
	3  7 11;
	4  8 12
]
```

At 5×2 rectangular `NumericArray`:

```
>>> let m = [5 2].iota.asNumericArray;
>>> m.transpose;
>>> m.normal
[
	1  3  5  7  9;
	2  4  6  8 10
]
```

* * *

See also: NumericArray, transposed

Categories: Ordering
