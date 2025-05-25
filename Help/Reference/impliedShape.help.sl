# impliedShape

- _impliedShape(aList)_

Answer the shape that an array would have to have if it were to hold the,
possibly irregular,
array at _aList_.

The implied shape of a triangular matrix:

```
>>> [1 2 3; 4 5; 6].impliedShape
[3 3]

>>> [1 2 3; 4 5; 6].deepIndices.max
[3 3]
```

The implied shape of an irregular volume:

```
>>> [1; ; 2 3:; 4; 5; ].impliedShape
[2 3 2]

>>> [1; ; 2 3:; 4; 5; ].deepIndices.max
[2 3 2]
```

The implied shape of an array is equal to its `shape`:

```
>>> [2 3 2].iota.impliedShape
[2 3 2]
```

The implied shape is the `shape` of the answer to `padLeft` and `padRight`:

```
>>> let l = [1; ; 2 3:; 4; 5; ];
>>> (
>>> 	l.impliedShape,
>>> 	l.padLeft.shape,
>>> 	l.padRight.shape
>>> )
([2 3 2], [2 3 2], [2 3 2])
```

It is also the `shape` of `recycle` if there are no empty places:

```
>>> let l = [1; 2; 3 4:; 5; 6; 7];
>>> (
>>> 	l.impliedShape,
>>> 	l.recycle.shape
>>> )
([2 3 2], [2 3 2])
```

* * *

See also: deepIndices, padLeft, padRight, recycle, reshape, shape
