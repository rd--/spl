# Regular and Irregular Arrays

A regular array has a `shape`.
An irregular array has a `irregularShape`.

A scalar has shape `[]`:

```
>>> 1.shape
[]
```

A vector has shape _[n]_:

```
>>> [1 2 3 4 5 6 7 8].shape
[8]
```

A matrix has shape _[m n]_,
where _m_ counts the rows
and _n_ the columns:

```
>>> [1 2 3 4; 5 6 7 8].shape
[2 4]

>>> [1 2; 3 4; 5 6; 7 8].shape
[4 2]
```

A volume has shape _[l m n]_,
where _l_ counts the pages,
_m_ counts the rows
and _n_ the columns:

```
>>> [1 2; 3 4:; 5 6; 7 8].shape
[2 2 2]
```

Two pages of triangular arrays,
the first with increasing row lengths,
the second decreasing:

```
>>> [0; 1 2; 3 4 5:; 6 7 8; 9 10; 11]
>>> .irregularShape
[2, [3], [1 2 3; 3 2 1]]
```

To regularise an irregular array:

```
>>> [1; 2 3; 4 5 6].padRight
[1 0 0; 2 3 0; 4 5 6]

>>> [1; 2 3; 4 5 6].padLeft
[0 0 1; 0 2 3; 4 5 6]

>>> [1; 2 3; 4 5 6].recycle([3 3])
[1 1 1; 2 3 2; 4 5 6]
```

* * *

See also: irregularIota, irregularShape, recycle, reshape, shape

Guides: Array Functions
