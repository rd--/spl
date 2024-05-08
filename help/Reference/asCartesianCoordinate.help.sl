# asCartesianCoordinate

- _asCartesianCoordinate(aList | aRecord | aTuple)_

Answer a `CartesianCoordinate`.

`List` case:

```
>>> [1, 2, 3].asCartesianCoordinate
CartesianCoordinate(1, 2, 3)
```

`Tuple` case:

```
>>> (1, 2, 3).asCartesianCoordinate
CartesianCoordinate(1, 2, 3)
```

`Record` case:

```
>>> (x: 1, y: 2, z: 3).asCartesianCoordinate
CartesianCoordinate(1, 2, 3)
```

In the `CartesianCoordinate` cases answer `identity`:

```
>>> let p = CartesianCoordinate(1, 2, 3);
>>> p.asCartesianCoordinate
p
```

* * *

See also: asComplex, asPoint, asPolarCoordinate, asRectangularCoordinate, asSphericalCoordinate

Guides: Geometry Types

Categories: Converting
