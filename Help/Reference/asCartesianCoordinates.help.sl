# asCartesianCoordinates

- _asCartesianCoordinates(c)_

Answer `CartesianCoordinates` given a collection _c_.

`List` case:

```
>>> [1 2 3].asCartesianCoordinates
CartesianCoordinates([1 2 3])
```

`Record` case:

```
>>> (x: 1, y: 2, z: 3)
>>> .asCartesianCoordinates
CartesianCoordinates([1 2 3])
```

In the `CartesianCoordinates` cases answer `identity`:

```
>>> let p = CartesianCoordinates([1 2 3]);
>>> p.asCartesianCoordinates
p
```

* * *

See also: asComplex, asPoint, asPolarCoordinates, asPlanarCoordinates, asSphericalCoordinates

Guides: Geometry Functions

Categories: Converting
