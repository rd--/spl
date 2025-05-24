# GeodeticCoordinates

- _GeodeticCoordinates([ϕ λ h])_

A `Type` representing the Geodetic coordinates of a point in a Geographic coordinate system.

The components are
ϕ (geodetic latitude),
λ (longitude) and
_h_ (ellipsoidal height).
Note that ϕ is given before λ.

Access components using `phi`, `lambda` and `h`:

```
>>> let c = [40.11 -88.24 244.32];
>>> let g = GeodeticCoordinates(c);
>>> (g.phi, g.lambda, g.h)
(40.11, -88.24, 244.32)
```

Access components using `latitude`, `longitude` and `elevation`:

```
>>> let c = [40.11 -88.24 244.32];
>>> let g = GeodeticCoordinates(c);
>>> (g.latitude, g.longitude, g.elevation)
(40.11, -88.24, 244.32)
```

* * *


See also: CartesianCoordinates, PlanarCoordinates, PolarCoordinates, SphericalCoordinates

Guides: Coordinate System Functions, Geometry Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/GeoPosition.html),
_W_
[1](https://en.wikipedia.org/wiki/Geodetic_coordinates)
