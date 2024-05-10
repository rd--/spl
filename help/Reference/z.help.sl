# z

- _z(aPoint)_

Answer the _z_-coordinate of a three dimensional Cartesian coordinate.

```
>>> CartesianCoordinates(1, 2, 3).z
3

>>> (x: 1, y: 2, z: 3).asCartesianCoordinates.z
3
```

`SphericalCoordinates` implements `z`:

```
>>> SphericalCoordinates(1, 0, 1.pi).z
-1
```

* * *

See also: imaginary, real, x, y

Guides: Geometry Types

References:
_Mathematica_
[1](https://mathworld.wolfram.com/z-Axis.html)
