# theta

- _theta(aPoint)_

Answer the `theta` field of _aPoint_.

The two-dimensional case:

```
>>> PolarCoordinates(0, 1.pi).theta
1.pi
```

`PlanarCoordinates` implements `theta`:

```
>>> PlanarCoordinates(1, 1).theta
1/4.pi
```

The three-dimensional case, also called `azimuth`:

```
>>> let p = SphericalCoordinates(1, 1.pi, 0);
>>> (p.theta, p.azimuth)
(1.pi, 1.pi)
```

`CartesianCoordinates` implements `theta`:

```
>>> let p = CartesianCoordinates(1, 1, 0);
>>> (p.theta, p.azimuth)
(1/4.pi, 1/4.pi)
```

Where supported `theta` is displayed as θ.

* * *

See also: azimuth, phi, theta, x, y, z

Guides: Geometry Types

Unicode: U+03B8 θ Greek Small Letter Theta

Categories: Accessing
