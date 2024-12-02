# Point

- _Point(aVector)_

A `Type` representing a geometric point in _n_-dimensions.

A two-dimensional cartesian co-ordinate:

```
>>> let p = Point([1, 2]);
>>> (p.dimension, p.embeddingDimension)
(0, 2)
```

A three-dimensional cartesian co-ordinate:

```
>>> let p = Point([1, 2, 3]);
>>> (p.dimension, p.embeddingDimension)
(0, 3)
```

The Svg description of a point:

```
>>> Point([0 0]).forSvg(1).abbreviateTo(36)
'<circle cx="0.00" cy="0.00" ... &etc'
```

* * *

See also: asPoint, CartesianCoordinates, PolarCoordinates, PlanarCoordinates, SphericalCoordinates

Guides: Geometry Types

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Point.html)
[2](https://reference.wolfram.com/language/ref/Point.html)

Categoriess: Geometry
