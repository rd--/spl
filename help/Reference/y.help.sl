# y

- _y(aPoint)_

Answer the _y_ coordinate of a two or three dimensional point.

At `List`:

```
>>> ([1 2].y, [3 4 5].y)
(2, 4)
```

At `Tuple`:

```
>>> [(1, 2).y, (3, 4, 5).y]
[2 4]
```

At `Record`:

```
>>> (x: 1, y: 2, z: 3).y
2
```

Two-dimensional case:

```
>>> PlanarCoordinates(1, 2).y
2

>>> (x: 1, y: 2).asPlanarCoordinates.y
2
```

`PolarCoordinates` implements `y`:

```
>>> PolarCoordinates(1, 3.pi / 2).y
-1
```

Three-dimensional case:

```
>>> CartesianCoordinates(1, 2, 3).y
2

>>> (x: 1, y: 2, z: 3).asCartesianCoordinates.y
2
```

`SphericalCoordinates` implements `y`:

```
>>> SphericalCoordinates(1, -1.pi / 2, 1.pi / 2).y
-1
```

* * *

See also: imaginary, real, x, z

Guides: Geometry Types

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Ordinate.html)
[2](https://mathworld.wolfram.com/y-Axis.html)
