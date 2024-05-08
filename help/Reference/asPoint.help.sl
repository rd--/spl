# asPoint

- _asPoint(aList | aRecord | aTuple)_

Constructs Cartesian coordinates of two and three dimensions given an appropriate list, record or tuple.

`List` case:

```
>>> [1, 2].asPoint
RectangularCoordinate(1, 2)

>>> [1, 2, 3].asPoint
CartesianCoordinate(1, 2, 3)
```

`Tuple` case:

```
>>> (1, 2).asPoint
RectangularCoordinate(1, 2)

>>> (1, 2, 3).asPoint
CartesianCoordinate(1, 2, 3)
```

`Record` case:

```
>>> (x: 1, y: 2).asPoint
RectangularCoordinate(1, 2)

>>> (x: 1, y: 2, z: 3).asPoint
CartesianCoordinate(1, 2, 3)
```

In the `RectangularCoordinate` and `CartesianCoordinate` cases answer `identity`:

```
>>> let p = RectangularCoordinate(1, 2);
>>> p == p.asPoint
true

>>> let p = CartesianCoordinate(1, 2, 3);
>>> p == p.asPoint
true
```

* * *

See also: asComplex, CartesianCoordinate, Point, RectangularCoordinate

Categories: Converting
