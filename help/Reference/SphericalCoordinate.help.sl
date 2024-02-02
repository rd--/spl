# SphericalCoordinate -- geometry

_SphericalCoordinate(r, theta, phi)_

Construct a spherical coordinate following the convention:

- r(𝑟), or rho(ρ): radial distance (radial line, radial coordinate)
- theta(θ): azimuth
- phi(φ): inclination angle (polar angle, zenith angle, normal angle, colatitude)

There are differing conventions for notating spherical coordinates.
The function _IsoSphericalCoordinate(r, theta, phi)_ follows the ISO convention,
in which the meaning (and ordering) of theta and phi are reversed.

_radius_, _rho_, _azimuth_ and _inclination_ are provided as aliases.

Theta is the angle of counter-clockwise rotation from the initial meridian plane,
ie. in the xy-plane from the x-axis with 0 <= phi < 2 pi.

Phi is with respect to the positive polar axis,
ie. from the positive z-axis with 0 <= theta <= pi.

Instead of the inclination angle one may wish to use the elevation angle instead,
which is measured upward between the reference plane and the radial line,
ie. from the reference plane upward (towards to the positive z-axis) to the radial line.
The depression angle is the negative of the elevation angle.

Where supported r is displayed as 𝑟, rho is displayed as ρ, theta as θ, and phi as φ.

* * *

See also: PolarCoordinate

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SphericalCoordinates.html)
_W_
[1](https://en.wikipedia.org/wiki/ISO/IEC_80000)

Unicode:
U+1D45F 𝑟 Mathematical Italic Small R
