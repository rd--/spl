# y

- _y(aCoordinate)_

Answer the _y_ coordinate of a two or three dimensional Cartesian coordinate.

Two-dimensional case:

```
>>> RectangularCoordinate(1, 2).y
2

>>> (x: 1, y: 2).asRectangularCoordinate.y
2
```

`PolarCoordinate` implements `y`:

```
>>> PolarCoordinate(1, 3.pi / 2).y
-1
```

Three-dimensional case:

```
>>> CartesianCoordinate(1, 2, 3).y
2

>>> (x: 1, y: 2, z: 3).asCartesianCoordinate.y
2
```

`SphericalCoordinate` implements `y`:

```
>>> SphericalCoordinate(1, -1.pi / 2, 1.pi / 2).y
-1
```

* * *

See also: imaginary, real, x, z

Guides: Geometry Types
