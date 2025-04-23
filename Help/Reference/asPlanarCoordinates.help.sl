# asPlanarCoordinates

- _asPlanarCoordinates(aCollection)_

Answer a `PlanarCoordinates`.

`List` case:

```
>>> [1 2].asPlanarCoordinates
PlanarCoordinates([1 2])
```

`Record` case:

```
>>> (x: 1, y: 2).asPlanarCoordinates
PlanarCoordinates([1 2])
```

In the `PlanarCoordinates` cases answer `identity`:

```
>>> let p = PlanarCoordinates([1 2]);
>>> p.asPlanarCoordinates
p
```

* * *

See also: asComplex, CartesianCoordinates, Point, PlanarCoordinates

Guides: Geometry Functions

Categories: Converting
