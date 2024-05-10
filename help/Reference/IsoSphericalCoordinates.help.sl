# IsoSphericalCoordinates

- _IsoSphericalCoordinates(alpha, beta, gamma)_ => _SphericalCoordinates(alpha, gamma, beta)_

There are differing conventions for notating spherical coordinates.
`IsoSphericalCoordinates` follows the ISO convention,
in which the meaning (and ordering) of theta and phi are reversed in relation to `SphericalCoordinates`.

```
>>> let p = IsoSphericalCoordinates(2.sqrt, 1.pi / 2, 1.pi / 4);
>>> p.asCartesianCoordinates
CartesianCoordinates(1, 1, 0)

>>> let p = IsoSphericalCoordinates(3.sqrt, 2.sqrt.arcTan, 0.25.pi);
>>> p.asCartesianCoordinates
CartesianCoordinates(1, 1, 1)
```

* * *

See also: SphericalCoordinates
