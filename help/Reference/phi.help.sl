# phi

- _phi(aCoordinate)_

Answer the _phi_ (inclination) field of _aCoordinate_.

At `SphericalCoordinate`, also called `inclination`:

```
>>> let p = SphericalCoordinate(1, 0, pi);
>>> (p.phi, p.inclination)
(pi, pi)
```

`CartesianCoordinate` implements `phi`:

```
>>> let p = CartesianCoordinate(1, 0, 1);
>>> (p.phi, p.inclination)
(pi / 4, pi / 4)
```

Where supported `phi` is displayed as φ.

* * *

See also: inclination, phi, theta, x, y, z

Guides: Geometry Types

Unicode: U+03C6 φ Greek Small Letter Phi
