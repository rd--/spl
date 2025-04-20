# CartesianCoordinates

- _CartesianCoordinates([x, y, …])_

A `Type` representing a point in _n_-dimensional Cartesian space.

> The two axes of two-dimensional Cartesian coordinates,
> conventionally denoted the _x_- and _y_-axes
> (a notation due to Descartes),
> are chosen to be linear and mutually perpendicular.
> Typically, the x-axis is thought of as the horizontal axis
> while the y-axis is thought of as the vertical axis.
>
> The three-dimensional Cartesian coordinate system is an extension of
> the two-dimensional system formed by the addition of a third axis
> mutually perpendicular to the _x_- and _y_-axes, conventionally referred
> to as the _z_-axis.

Implements `size` and `at`:

```
>>> let p = CartesianCoordinates([1 2 3]);
>>> (p.size, [p[3], p[2], p[1]])
(3, [3 2 1])
```

allowing terms to be fetched using `List Assignment Syntax`:

```
>>> let p = CartesianCoordinates([1 2 3]);
>>> let [x, y, z] = p;
>>> [z y x]
[3 2 1]
```

Implements `<`,
meaning behind, below and to the left of:

```
>>> let u = CartesianCoordinates([0 0 0]);
>>> let v = CartesianCoordinates([1 1 1]);
>>> (u < v, u = v, u > v)
(true, false, false)
```

Converting from `Record`:

```
>>> (x: 1, y: 2)
>>> .asCartesianCoordinates
CartesianCoordinates([1 2])

>>> (x: 1, y: 2, z: 3)
>>> .asCartesianCoordinates
CartesianCoordinates([1 2 3])

>>> (x: 1, y: 2, z: 3, w: 4)
>>> .asCartesianCoordinates
CartesianCoordinates([1 2 3 4])
```

* * *

See also: asPoint, Point, PolarCoordinates, PlanarCoordinates, SphericalCoordinates, x, y, z

Guides: Geometry Types

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CartesianCoordinates.html),
_W_
[1](https://en.wikipedia.org/wiki/Cartesian_coordinate_system)

Categories: Geometry, Type
