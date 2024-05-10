# fromCylindricalCoordinates

- _fromCylindricalCoordinates(aVector)_

Answers the _(x,y,z)_ Cartesian coordinates corresponding to the cylindrical coordinates _(rho,phi,z)_,
where _(rho, phi)_ is the polar coordinate on the _x/y_ plane and _z_ is Cartesian _z_-coordinate.

```
>>> [4, 2.pi / 3, -2].fromCylindricalCoordinates
[-2, 2 * 3.sqrt, -2]

>>> [5, pi / 6, 4].fromCylindricalCoordinates
[5 * 3.sqrt / 2, 5 / 2, 4]

>>> [8 * 2.sqrt, 3.pi / 4, -7].fromCylindricalCoordinates
[-8 8 -7]
```

* * *

See also: CylindricalCoordinates, toCylindricalCoordinates
