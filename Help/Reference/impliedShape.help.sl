# impliedShape

- _impliedShape(aList)_

Answer the shape that an array would have to have to have positions to hold the, possibly irregular, array at _aList_.

The implied shape of a triangular matrix:

```
>>> [1 2 3; 4 5; 6].impliedShape
[3 3]
```

The implied shape of an irregular volume:

```
>>> [1; ; 2 3:; 4; 5; ].impliedShape
[2 3 2]
```

The implied shape of an array is equal to its `shape`:

```
>>> [2 3 2].iota.impliedShape
[2 3 2]
```

The implied shape is the shape of the answer to `padLeft` and `padRight`.

```
>>> let l = [1; ; 2 3:; 4; 5; ];
>>> (l.impliedShape, l.padRight.shape)
([2 3 2], [2 3 2])
```

* * *

See also: padLeft, padRight, reshape, shape
