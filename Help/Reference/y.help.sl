# y

- _y(p)_

Answer the _y_ coordinate of a two or three dimensional point _p_.

At `Point`:

```
>>> (Point[1 2].y, Point[3 4 5].y)
(2, 4)
```

Two-dimensional case:

```
>>> PlanarCoordinates[1 2].y
2

>>> PlanarCoordinates(x: 1, y: 2).y
2
```

`PolarCoordinates` implements `y`:

```
>>> PolarCoordinates[1 3/2.pi].y
-1
```

Three-dimensional case:

```
>>> CartesianCoordinates[1 2 3].y
2

>>> CartesianCoordinates(
>>> 	x: 1, y: 2, z: 3
>>> ).y
2
```

`SphericalCoordinates` implements `y`:

```
>>> SphericalCoordinates[
>>> 	1 -1/2.pi 1/2.pi
>>> ].y
-1
```

* * *

See also: imaginary, real, x, z

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Ordinate.html)
[2](https://mathworld.wolfram.com/y-Axis.html)

Categories: Accessing, Geometry
