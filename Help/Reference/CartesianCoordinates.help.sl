# CartesianCoordinates

- _CartesianCoordinates(x, y, z)_

A `Type` representing a point in three-dimensional Cartesian space given by a triple _(x, y, z)_.

> The three-dimensional Cartesian coordinate system is an extension of
> the two-dimensional system formed by the addition of a third axis
> mutually perpendicular to the _x_- and _y_-axes, conventionally referred
> to as the _z_-axis.

Implements `size` and `at`:

```
>>> let p = CartesianCoordinates(1, 2, 3);
>>> (p.size, [p[3], p[2], p[1]])
(3, [3 2 1])
```

allowing terms to be fetched using `List Assignment Syntax`:

```
>>> let [x, y, z] = CartesianCoordinates(1, 2, 3);
>>> [z y x]
[3 2 1]
```

* * *

See also: asPoint, Point, PolarCoordinates, PlanarCoordinates, SphericalCoordinates, x, y, z

Guides: Geometry Types

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CartesianCoordinates.html)

Categories: Geometry, Type
