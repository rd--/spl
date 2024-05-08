# asSphericalCoordinate

- _asSphericalCoordinate(aList | aRecord | aTuple)_

Answer a `SphericalCoordinate`.

`List` case:

```
>>> [1, 2, 3].asSphericalCoordinate
SphericalCoordinate(1, 2, 3)
```

`Tuple` case:

```
>>> (1, 2, 3).asSphericalCoordinate
SphericalCoordinate(1, 2, 3)
```

`Record` case:

```
>>> (r: 1, theta: 2, phi: 3).asSphericalCoordinate
SphericalCoordinate(1, 2, 3)
```

In the `SphericalCoordinate` cases answer `identity`:

```
>>> let p = SphericalCoordinate(1, 2, 3);
>>> p.asSphericalCoordinate
p
```

* * *

See also: asComplex, asPoint, asPolarCoordinate, asRectangularCoordinate, asSphericalCoordinate

Guides: Geometry Types

Categories: Converting
