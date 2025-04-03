# SphericalCoordinates

- _SphericalCoordinates(r, theta, phi)_

Answer a `SphericalCoordinates` instance following the convention:

- r(𝑟), or rho(ρ): radial distance (radial line, radial coordinate)
- theta(θ): azimuth
- phi(φ): inclination angle (polar angle, zenith angle, normal angle, colatitude)

There are differing conventions for notating spherical coordinates.
The function `IsoSphericalCoordinates`, with parameters _(r, theta, phi)_, follows the ISO convention,
in which the meaning (and ordering) of `theta` and `phi` are reversed.

`radius`, `rho`, `azimuth` and `inclination` are provided as aliases.

`theta` is the angle of counter-clockwise rotation from the initial meridian plane,
ie. in the _xy_-plane from the _x_-axis with _0 <= phi < 2.pi_.

`phi` is with respect to the positive polar axis,
ie. from the positive _z_-axis with _0 <= theta <= pi_.

Instead of the inclination angle one may wish to use the elevation angle instead,
which is measured upward between the reference plane and the radial line,
ie. from the reference plane upward (towards to the positive _z_-axis) to the radial line.
The depression angle is the negative of the elevation angle.

```
>>> SphericalCoordinates(
>>> 	2.sqrt,
>>> 	1.pi / 4,
>>> 	1.pi / 2
>>> ).asCartesianCoordinates
CartesianCoordinates([1 1 0])

>>> SphericalCoordinates(
>>> 	3.sqrt,
>>> 	0.25.pi,
>>> 	2.sqrt.arcTan
>>> ).asCartesianCoordinates
CartesianCoordinates([1 1 1])
```

Where supported `r` is displayed as 𝑟, `rho` as ρ, `theta` as θ, and `phi` as φ.

* * *

See also: asCartesianCoordinates, CartesianCoordinates, PolarCoordinates, IsoSphericalCoordinates, PlanarCoordinates

Guides: Geometry Types

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SphericalCoordinates.html)
_W_
[1](https://en.wikipedia.org/wiki/ISO/IEC_80000)

Categories: Geometry
