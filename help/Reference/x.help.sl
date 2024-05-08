# x

- _x(aCoordinate)_

Answer the _x_ coordinate of a two or three dimensional Cartesian coordinate.

Two-dimensional case:

```
>>> RectangularCoordinate(1, 2).x
1

>>> (x: 1, y: 2).asRectangularCoordinate.x
1
```

`PolarCoordinate` implements `x`:

```
>>> PolarCoordinate(1, pi).x
-1
```

Three-dimensional case:

```
>>> CartesianCoordinate(1, 2, 3).x
1

>>> (x: 1, y: 2, z: 3).asCartesianCoordinate.x
1
```

`SphericalCoordinate` implements `x`:

```
>>> SphericalCoordinate(1, 1.pi, 1.pi / 2).x
-1
```

* * *

See also: imaginary, real, y, z

Guides: Geometry Types
