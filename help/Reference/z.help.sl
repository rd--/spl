# z

- _z(aCoordinate)_

Answer the _z_ coordinate of a three dimensional Cartesian coordinate.

```
>>> CartesianCoordinate(1, 2, 3).z
3

>>> (x: 1, y: 2, z: 3).asCartesianCoordinate.z
3
```

`SphericalCoordinate` implements `z`:

```
>>> SphericalCoordinate(1, 0, 1.pi).z
-1
```

* * *

See also: imaginary, real, x, y

Guides: Geometry Types
