# PolarCoordinates

- _PolarCoordinates([r θ])_

`PolarCoordinates` is a `Type` that represents a point in a polar coordinate system,
where each point on a plane is determined by a distance from a reference point and an angle in radians from a reference direction.

The usual mathematical notation is _(r, theta)_, where _r_ is the radius and _theta_ the angle.
The ISO standardised notation is _(rho, phi)_, where _rho_ is the radius and _phi_ the angle.

Theta, or phi, is the angle of counter-clockwise rotation from the positive _x_ axis,
with _0 <= theta < 2.pi_.

```
>>> let p = PolarCoordinates([2.sqrt, 0.25.pi]);
>>> (
>>> 	p.r, p.theta,
>>> 	p.rho, p.phi,
>>> 	p.x, p.y,
>>> 	p.asPlanarCoordinates
>>> )
(
	2.sqrt, 0.25.pi,
	2.sqrt, 0.25.pi,
	1, 1,
	PlanarCoordinates([1 1])
)
```

Threads over lists:

```
>>> PolarCoordinates([1 1.pi; 2 1/2.pi; 3 1/3.pi])
[
	PolarCoordinates([1 1.pi]),
	PolarCoordinates([2 1/2.pi]),
	PolarCoordinates([3 1/3.pi])
]
```

* * *

See also: CartesianCoordinates, fromPolarCoordinates, Point, PlanarCoordinates, SphericalCoordinates, toPolarCoordinates

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PolarCoordinates.html),
_W_
[1](https://en.wikipedia.org/wiki/Polar_coordinate_system)

Categories: Geometry
