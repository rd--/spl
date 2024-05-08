# SphericalCoordinate

- _SphericalCoordinate(r, theta, phi)_

Construct a spherical coordinate following the convention:

- r(𝑟), or rho(ρ): radial distance (radial line, radial coordinate)
- theta(θ): azimuth
- phi(φ): inclination angle (polar angle, zenith angle, normal angle, colatitude)

There are differing conventions for notating spherical coordinates.
The function _IsoSphericalCoordinate(r, theta, phi)_ follows the ISO convention,
in which the meaning (and ordering) of _theta_ and _phi_ are reversed.

_radius_, _rho_, _azimuth_ and _inclination_ are provided as aliases.

_theta_ is the angle of counter-clockwise rotation from the initial meridian plane,
ie. in the _xy_-plane from the _x_-axis with _0 <= phi < 2 * pi_.

_phi_ is with respect to the positive polar axis,
ie. from the positive _z_-axis with _0 <= theta <= pi_.

Instead of the inclination angle one may wish to use the elevation angle instead,
which is measured upward between the reference plane and the radial line,
ie. from the reference plane upward (towards to the positive z-axis) to the radial line.
The depression angle is the negative of the elevation angle.

```
>>> SphericalCoordinate(2.sqrt, 1.pi / 4, 1.pi / 2).asCartesianCoordinate
CartesianCoordinate(1, 1, 0)

>>> SphericalCoordinate(3.sqrt, 0.25.pi, 2.sqrt.arcTan).asCartesianCoordinate
CartesianCoordinate(1, 1, 1)
```

Where supported `r` is displayed as 𝑟, `rho` as ρ, `theta` as θ, and `phi` as φ.

* * *

See also: asCartesianCoordinate, CartesianCoordinate, PolarCoordinate, IsoSphericalCoordinate, RectangularCoordinate

Guides: Geometry Types

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SphericalCoordinates.html)
_W_
[1](https://en.wikipedia.org/wiki/ISO/IEC_80000)

Categories: Geometry
