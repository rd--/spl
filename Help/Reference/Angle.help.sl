# Angle

A type representing a unit of measure for angles.

- _degrees(aNumber | anAngle)_
- _radians(aNumber | anAngle)_

An angle is constructed by the _degrees_ and _radians_ methods at _Number_.

```
>>> 360.degrees.isAngle
true

>>> 2.pi.radians.isAngle
true
```

There are _degrees_ and _radians_ accessors.

```
>>> 2.pi.radians.degrees
360

>>> 360.degrees.radians
2.pi
```

The circular (trigonometric) functions are implemented:

```
>>> 30.degrees.cos
(3.sqrt / 2)
```

* * *

See also: degrees, degreesToRadians, radians, radiansToDegrees

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Angle.html)

Categories: Geometry, Type
