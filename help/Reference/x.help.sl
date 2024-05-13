# x

- _x(aPoint)_

Answer the _x_-coordinate of a two or three dimensional Cartesian coordinate.

Two-dimensional case:

```
>>> RectangularCoordinates(1, 2).x
1

>>> (x: 1, y: 2).asRectangularCoordinates.x
1
```

`PolarCoordinates` implements `x`:

```
>>> PolarCoordinates(1, pi).x
-1
```

Three-dimensional case:

```
>>> CartesianCoordinates(1, 2, 3).x
1

>>> (x: 1, y: 2, z: 3).asCartesianCoordinates.x
1
```

`SphericalCoordinates` implements `x`:

```
>>> SphericalCoordinates(1, 1.pi, 1.pi / 2).x
-1
```

The _x_-coordinate of the center of a `Circle`:

```
>>> Circle([0 0], 1).x
0
```

* * *

See also: imaginary, real, y, z

Guides: Geometry Types

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Abscissa.html)
[2](https://mathworld.wolfram.com/x-Axis.html)
