# LsGeom

- _LsGeom(start, grow, length)_

Geometric series from _start_, incrementing by _grow_, for _length_ places.

```
>>> LsGeom(1, 2, 9).upToEnd
[1 2 4 8 16 32 64 128 256]
```

With non-finite length:

```
>>> let p = LsGeom(1, 3, Infinity);
>>> let q = LsGeom(3, 5, Infinity);
>>> p.next(4) ++ q.next(4)
[1 3 9 27 3 15 75 375]
```

* * *

See also: LsSeries, LsUnfold

Guides: Patterns and Streams

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pgeom.html)

Categories: Stream
