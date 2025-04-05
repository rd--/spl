# asSphericalCoordinates

- _asSphericalCoordinates(aCollection)_

Answer a `SphericalCoordinates`.

`List` case:

```
>>> [1 2 3].asSphericalCoordinates
SphericalCoordinates([1 2 3])
```

`Record` case:

```
>>> (r: 1, theta: 2, phi: 3).asSphericalCoordinates
SphericalCoordinates([1 2 3])
```

In the `SphericalCoordinates` cases answer `identity`:

```
>>> let p = SphericalCoordinates([1 2 3]);
>>> p.asSphericalCoordinates
p
```

* * *

See also: asComplex, asPoint, asPolarCoordinates, asPlanarCoordinates, asSphericalCoordinates

Guides: Geometry Types

Categories: Converting
