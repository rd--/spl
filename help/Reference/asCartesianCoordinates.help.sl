# asCartesianCoordinates

- _asCartesianCoordinates(aCollection)_

Answer a `CartesianCoordinates`.

`List` case:

```
>>> [1 2 3].asCartesianCoordinates
CartesianCoordinates(1, 2, 3)
```

`Tuple` case:

```
>>> (1, 2, 3).asCartesianCoordinates
CartesianCoordinates(1, 2, 3)
```

`Record` case:

```
>>> (x: 1, y: 2, z: 3).asCartesianCoordinates
CartesianCoordinates(1, 2, 3)
```

In the `CartesianCoordinates` cases answer `identity`:

```
>>> let p = CartesianCoordinates(1, 2, 3);
>>> p.asCartesianCoordinates
p
```

* * *

See also: asComplex, asPoint, asPolarCoordinates, asPlanarCoordinates, asSphericalCoordinates

Guides: Geometry Types

Categories: Converting
