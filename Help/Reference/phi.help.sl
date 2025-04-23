# phi

- _phi(aPoint)_

Answer the `phi` (inclination) field of _aPoint_.

At `SphericalCoordinates`, also called `inclination`:

```
>>> let p = SphericalCoordinates([1 0 1.pi]);
>>> (p.phi, p.inclination)
(1.pi, 1.pi)
```

`CartesianCoordinates` implements `phi`:

```
>>> let p = CartesianCoordinates([1 0 1]);
>>> (p.phi, p.inclination)
(1/4.pi, 1/4.pi)
```

Where supported `phi` is displayed as φ.

* * *

See also: inclination, phi, theta, x, y, z

Guides: Geometry Functions

Unicode: U+03C6 φ Greek Small Letter Phi
