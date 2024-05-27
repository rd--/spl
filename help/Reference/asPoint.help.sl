# asPoint

- _asPoint(aList | aRecord | aTuple)_

Constructs Cartesian coordinates of two and three dimensions given an appropriate list, record or tuple.

`List` case:

```
>>> [1, 2].asPoint
PlanarCoordinates(1, 2)

>>> [1, 2, 3].asPoint
CartesianCoordinates(1, 2, 3)
```

`Tuple` case:

```
>>> (1, 2).asPoint
PlanarCoordinates(1, 2)

>>> (1, 2, 3).asPoint
CartesianCoordinates(1, 2, 3)
```

`Record` case:

```
>>> (x: 1, y: 2).asPoint
PlanarCoordinates(1, 2)

>>> (x: 1, y: 2, z: 3).asPoint
CartesianCoordinates(1, 2, 3)
```

In the `PlanarCoordinates` and `CartesianCoordinates` cases answer `identity`:

```
>>> let p = PlanarCoordinates(1, 2);
>>> p == p.asPoint
true

>>> let p = CartesianCoordinates(1, 2, 3);
>>> p == p.asPoint
true
```

* * *

See also: asComplex, CartesianCoordinates, Point, PlanarCoordinates

Categories: Converting
