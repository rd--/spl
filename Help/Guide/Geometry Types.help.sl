# Geometry Types

- `Point`, `PointCloud`
- `Line`, `InfiniteLine`, `HalfLine`
- `BezierCurve`
- `Rectangle`, `Parallelogram`
- `Polygon`
- `PolygonMesh`, `Polyhedron`
- `Circle`, `Disk`, `Ellipse`
- `InfinitePlane`, `HalfPlane`
- `GeometryCollection`

Two-dimensional (_planar_) coordinate types:

- `PlanarCoordinates`: An _(x, y)_ Cartesian point
- `PolarCoordinates`: An _(r, theta)_ polar point

Three-dimensional (_volumetric_) coordinate types:

- `CartesianCoordinates`: An _(x, y, z)_ Cartesian point
- `SphericalCoordinates`: An _(r, theta, phi)_ spherical point

Methods for accessing fields:

- `x`, `y`, `z`
- `r`, `theta`, `phi`
- `azimuth`, `inclination`, `radius`, `rho`

Methods for converting from generic to specific representations of coordinates:

- `asPlanarCoordinates`
- `asPolarCoordinates`
- `asCartesianCoordinates`
- `asSphericalCoordinates`
- `asCylindricalCoordinates`

* * *

See also: PlanarCoordinates, PolarCoordinates, CartesianCoordinates, SphericalCoordinates

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CartesianCoordinates.html)
[2](https://mathworld.wolfram.com/PolarCoordinates.html)
[3](https://mathworld.wolfram.com/SphericalCoordinates.html)
