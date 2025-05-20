# Coordinate System Functions

Types:

- `BarycentricCoordinates`: _(λ₁, λ₂ …)_
- `CartesianCoordinates`: _(x, y, z …)_
- `CylindricalCoordinates`: _(ρ, φ, z)_
- `HexagonalCoordinates`: _(q, r, s)_
- `HexagonalEfficientCoordinates`: _(a, r, c)_
- `IsoSphericalCoordinates`: _(r, θ, φ)_
- `PlanarCoordinates`: _(x, y)_
- `PolarCoordinates`: _(r, θ)_
- `SphericalCoordinates`: _(r, θ, φ)_

Converting:

- `asBarycentricCoordinates`
- `asCartesianCoordinates`
- `asCylindricalCoordinates`
- `asPlanarCoordinates`
- `asPolarCoordinates`
- `asSphericalCoordinates`

Translating:

- `fromBarycentricCoordinates`
- `fromCylindricalCoordinates`
- `fromHexagonalCoordinates`
- `fromHexagonalEfficientCoordinates`
- `fromPolarCoordinates`
- `fromSphericalCoordinates`
- `fromTrilinearCoordinates`
- `toBarycentricCoordinates`
- `toCylindricalCoordinates`
- `toHexagonalCoordinates`
- `toPolarCoordinates`
- `toSphericalCoordinates`

Accessing:

- `x`, `y`, `z`
- `r`, `theta`, `phi`
- `azimuth`, `inclination`, `radius`, `rho`

Arrays:

- `coordinateBoundsArray`
- `coordinateBoundingBoxArray`
- `discretize`
- `subdivide`
- `table`

Grids:

- `polygonalHexagonalGrid`
- `rectangularHexagonalGrid`

_Note_:
Lattice coordinates are coordinates where each entry is an integer.

* * *

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CartesianCoordinates.html)
[2](https://mathworld.wolfram.com/PolarCoordinates.html)
[3](https://mathworld.wolfram.com/SphericalCoordinates.html)
