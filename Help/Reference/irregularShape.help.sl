# irregularShape

- _irregularShape(a)_

Answer the irregular shape of the irregular array _a_.
The length of the irregular shape is one less than the `depth` of the array.

The irregular shapes of regular arrays:

```
>>> let a = [];
>>> (a.shape, a.irregularShape)
([0], [0])

>>> let a = [1 2 3 4 5 6 7 8];
>>> (a.shape, a.irregularShape)
([8], [8])

>>> let a = [1 2 3 4; 5 6 7 8];
>>> (a.shape, a.irregularShape)
([2, 4], [2, [4]])

>>> let a = [1 2; 3 4; 5 6; 7 8];
>>> (a.shape, a.irregularShape)
([4, 2], [4, [2]])

>>> let a = [1 2; 3 4:; 5 6; 7 8];
>>> (a.shape, a.irregularShape)
([2 2 2], [2, [2], [[2]]])

>>> let a = [5 4 3 2].iota;
>>> (a.shape, a.irregularShape)
(
	[5 4 3 2],
	[5, [4], [[3]], [[[2]]]]
)
```

A triangular array or four rows and one through four columns:

```
>>> [0; 1 2; 3 4 5; 6 7 8 9]
>>> .irregularShape
[4, [1 2 3 4]]
```

Two pages of triangular arrays,
the first with increasing row lengths,
the second decreasing:

```
>>> [0; 1 2; 3 4 5:; 6 7 8; 9 10; 11]
>>> .irregularShape
[2, [3], [1 2 3; 3 2 1]]
```

Repeats are elided:

```
>>> [0; 1 2; 3; 4 5; 6; 7 8; 9]
>>> .irregularShape
[7, [1 2]]
```

Two pages, unequal number of rows, some zero columns:

```
>>> [0; 1 2; ; 3:; 4 5; 6]
>>> .irregularShape
[2, [4 2], [1 2 0; 2 1]]
```

* * *

See also: shape

Guides: Array Functions
