# phi

- _phi(aPoint)_

Answer the `phi` (inclination) field of _aPoint_.

At `SphericalCoordinates`, also called `inclination`:

```
>>> let p = SphericalCoordinates(1, 0, pi);
>>> (p.phi, p.inclination)
(pi, pi)
```

`CartesianCoordinates` implements `phi`:

```
>>> let p = CartesianCoordinates(1, 0, 1);
>>> (p.phi, p.inclination)
(pi / 4, pi / 4)
```

Where supported `phi` is displayed as φ.

* * *

See also: inclination, phi, theta, x, y, z

Guides: Geometry Types

Unicode: U+03C6 φ Greek Small Letter Phi
