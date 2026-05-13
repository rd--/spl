# asPlanarCoordinates

- _asPlanarCoordinates(c)_

Answer a `PlanarCoordinates` given a collection _c_.

`List` case:

```
>>> [1 2].asPlanarCoordinates
PlanarCoordinates[1 2]
```

`Record` case:

```
>>> (x: 1, y: 2).asPlanarCoordinates
PlanarCoordinates[1 2]
```

In the `PlanarCoordinates` cases answer `identity`:

```
>>> let c = PlanarCoordinates[1 2];
>>> c.asPlanarCoordinates == c
true
```

* * *

See also: asComplex, CartesianCoordinates, Point, PlanarCoordinates

Guides: Geometry Functions

Categories: Converting
