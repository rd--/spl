# IsoSphericalCoordinate

- _IsoSphericalCoordinate(alpha, beta, gamma)_ => _SphericalCoordinate(alpha, gamma, beta)_

There are differing conventions for notating spherical coordinates.
`IsoSphericalCoordinate` follows the ISO convention,
in which the meaning (and ordering) of theta and phi are reversed in relation to `SphericalCoordinate`.

```
>>> IsoSphericalCoordinate(2.sqrt, 1.pi / 2, 1.pi / 4).asCartesianCoordinate
CartesianCoordinate(1, 1, 0)

>>> IsoSphericalCoordinate(3.sqrt, 2.sqrt.arcTan, 0.25.pi).asCartesianCoordinate
CartesianCoordinate(1, 1, 1)
```

* * *

See also: SphericalCoordinate
