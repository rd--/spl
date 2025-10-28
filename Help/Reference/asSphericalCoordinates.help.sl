# asSphericalCoordinates

- _asSphericalCoordinates(c)_

Answer a `SphericalCoordinates` given a collection _c_..

`List` case:

```
>>> [1 2 3].asSphericalCoordinates
SphericalCoordinates([1 2 3])
```

`Record` case:

```
>>> (r: 1, theta: 2, phi: 3)
>>> .asSphericalCoordinates
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

Guides: Geometry Functions

Categories: Converting
