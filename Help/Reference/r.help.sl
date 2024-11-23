# r

- _r(aPoint)_

Answer the radius field of _aPoint_.

The two-dimensional case, also named `rho` and `radius`:

```
>>> let p = PolarCoordinates(1, 0);
>>> (p.r, p.rho, p.radius)
(1, 1, 1)
```

`PlanarCoordinates` implements `r`:

```
>>> let p = PlanarCoordinates(1, 1);
>>> (p.r, p.rho, p.radius)
(2.sqrt, 2.sqrt, 2.sqrt)
```

The three-dimensional case:

```
>>> let p = SphericalCoordinates(1, 0, 0);
>>> (p.r, p.rho, p.radius)
(1, 1, 1)
```

`CartesianCoordinates` implements `r`:

```
>>> let p = CartesianCoordinates(1, 0, 1);
>>> (p.r, p.rho, p.radius)
(2.sqrt, 2.sqrt, 2.sqrt)
```

Where supported `r` is displayed as 𝑟.

* * *

See also: phi, radius, rho, theta, x, y, z

Guides: Geometry Types

Unicode: U+1D45F 𝑟 Mathematical Italic Small R

Categories: Accessing, Geometry
