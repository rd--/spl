# theta

- _theta(aCoordinate)_

Answer the _theta_ field of _aCoordinate_.

The two-dimensional case:

```
>>> PolarCoordinate(0, pi).theta
pi
```

`RectangularCoordinate` implements `theta`:

```
>>> RectangularCoordinate(1, 1).theta
(pi / 4)
```

The three-dimensional case, also called `azimuth`:

```
>>> let p = SphericalCoordinate(1, pi, 0);
>>> (p.theta, p.azimuth)
(pi, pi)
```

`CartesianCoordinate` implements `theta`:

```
>>> let p = CartesianCoordinate(1, 1, 0);
>>> (p.theta, p.azimuth)
(pi / 4, pi / 4)
```

Where supported `theta` is displayed as θ.

* * *

See also: azimuth, phi, theta, x, y, z

Guides: Geometry Types

Unicode: U+03B8 θ Greek Small Letter Theta

