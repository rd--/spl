# PlanarCoordinates

- _PlanarCoordinates([x y])_

A `Type` holding the coordinates of a point in two-dimensional Cartesian space,
given by an ordered pair _(x, y)_.

There are accessors for the _x_ and _y_ coordinates,
as well as for _r_ and _theta_ (equivalently _rho_ and _phi_),
and for converting to a `PolarCoordinates`:

```
>>> let p = PlanarCoordinates([1 1]);
>>> (
>>> 	p.x, p.y,
>>> 	p.radius, p.theta,
>>> 	p.rho, p.phi,
>>> 	p.asPolarCoordinates
>>> )
(
	1, 1,
	2.sqrt, 0.25.pi,
	2.sqrt, 0.25.pi,
	PolarCoordinates([2.sqrt 0.25.pi])
)
```

Threads over lists:

```
>>> PlanarCoordinates([1 4; 2 5; 3 6])
[
	PlanarCoordinates([1 4]),
	PlanarCoordinates([2 5]),
	PlanarCoordinates([3 6])
]
```

* * *

See also: asPoint, asPolarCoordinates, asPlanarCoordinates, CartesianCoordinates, Point, PolarCoordinates, x, y

Guides: Geometry Types

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CartesianCoordinates.html)

Categories: Geometry, Type
