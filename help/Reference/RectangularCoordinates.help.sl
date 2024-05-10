# RectangularCoordinates

- _RectangularCoordinates(x, y)_

A `Type` holding the coordinates of a point in two-dimensional Cartesian space,
given by an ordered pair _(x, y)_.

> The two axes of two-dimensional Cartesian coordinates,
> conventionally denoted the _x_- and _y_-axes
> (a notation due to Descartes),
> are chosen to be linear and mutually perpendicular.
> Typically, the x-axis is thought of as the horizontal axis
> while the y-axis is thought of as the vertical axis.

There are accessors for the _x_ and _y_ coordinates,
as well as for _r_ and _theta_ (equivalently _rho_ and _phi_),
and for converting to a `PolarCoordinates`:

```
>>> let p = RectangularCoordinates(1, 1);
>>> (
>>> 	p.x, p.y,
>>> 	p.r, p.theta,
>>> 	p.rho, p.phi,
>>> 	p.asPolarCoordinates
>>> )
(
	1, 1,
	2.sqrt, 0.25.pi,
	2.sqrt, 0.25.pi,
	PolarCoordinates(2.sqrt, 0.25.pi)
)
```

* * *

See also: asPoint, asPolarCoordinates, asRectangularCoordinates, CartesianCoordinates, Point, PolarCoordinates, x, y

Guides: Geometry Types

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CartesianCoordinates.html)

Categories: Geometry, Type
