# toCylindricalCoordinates

- _toCylindricalCoordinates(aVector)_

Answers the _(rho, phi, z)_ cylindrical coordinates corresponding to the Cartesian coordinates _(x,y,z)_,
where _(rho, phi)_ is the polar coordinate on the _x/y_ plane and _z_ is Cartesian _z_-coordinate.

```
>>> [-2, 2 * 3.sqrt, -2].toCylindricalCoordinates
[4, 2.pi / 3, -2]

>>> [5 * 3.sqrt / 2, 5 / 2, 4].toCylindricalCoordinates
[5, 1/6.pi, 4]

>>> [-8 8 -7].toCylindricalCoordinates
[8 * 2.sqrt, 3.pi / 4, -7]
```

* * *

See also: CylindricalCoordinates, fromCylindricalCoordinates

Categories: Converting, Geometry
