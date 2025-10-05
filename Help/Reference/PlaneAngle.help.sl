# PlaneAngle

- _PlaneAngle(x)_

PlaneAngle is `Trait` for types representing a _plane angle_ measured in radians.
It is also a specialized constructor method for `Quantity` values.

Make a plane angle:

```
>>> let a = PlaneAngle(2.pi);
>>> (a.isPlaneAngle, a.unit, a.magnitude)
(true, 'radians', 2.pi)
```

There are `degrees` and `radians` accessors:

```
>>> PlaneAngle(2.pi).degrees
360

>>> PlaneAngle(360.degree).radians
2.pi
```

The circular (trigonometric) functions are implemented:

```
>>> PlaneAngle(30.degree).cos
3.sqrt / 2
```

* * *

See also: degree, degrees, degreesToRadians, Quantity, radians, radiansToDegrees

Guides: Quantity Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Angle.html),
_NIST_
[1](https://www.nist.gov/pml/special-publication-811),
_W_
[1](https://en.wikipedia.org/wiki/Angle)

Categories: Geometry, Trait
