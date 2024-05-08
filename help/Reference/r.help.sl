# r

- _r(aCoordinate)_


Answer the _r_ (radius) field of _aCoordinate_.

The two-dimensional case, also named `rho` and `radius`:

```
>>> let p = PolarCoordinate(1, 0);
>>> (p.r, p.rho, p.radius)
(1, 1, 1)
```

`RectangularCoordinate` implements `r`:

```
>>> let p = RectangularCoordinate(1, 1);
>>> (p.r, p.rho, p.radius)
(2.sqrt, 2.sqrt, 2.sqrt)
```

The three-dimensional case:

```
>>> let p = SphericalCoordinate(1, 0, 0);
>>> (p.r, p.rho, p.radius)
(1, 1, 1)
```

`CartesianCoordinate` implements `r`:

```
>>> let p = CartesianCoordinate(1, 0, 1);
>>> (p.r, p.rho, p.radius)
(2.sqrt, 2.sqrt, 2.sqrt)
```

Where supported `r` is displayed as 𝑟.

* * *

See also: phi, radius, rho, theta, x, y, z

Guides: Geometry Types

Unicode: U+1D45F 𝑟 Mathematical Italic Small R
