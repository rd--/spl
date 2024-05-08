# Geometry Types

Two-dimensional (_planar_) coordinate types:

- `RectangularCoordinate`: An _(x, y)_ Cartesian coordinate
- `PolarCoordinate`: An _(r, theta)_ polar coordinate

Three-dimensional (_volumetric_) coordinate types:

- `CartesianCoordinate`: An _(x, y, z)_ Cartesian coordinate
- `SphericalCoordinate`: An _(r, theta, phi)_ spherical coordinate

Methods for accessing fields:

- `x`, `y`, `z`
- `r`, `theta`, `phi`
- `azimuth`, `inclination`, `radius`, `rho`

Methods for converting from generic to specific representations of coordinates:

- `asRectangularCoordinate`
- `asPolarCoordinate`
- `asCartesianCoordinate`
- `asSphericalCoordinate`

* * *

See also: RectangularCoordinate, PolarCoordinate, CartesianCoordinate, SphericalCoordinate

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CartesianCoordinates.html)
[2](https://mathworld.wolfram.com/PolarCoordinates.html)
[3](https://mathworld.wolfram.com/SphericalCoordinates.html)
