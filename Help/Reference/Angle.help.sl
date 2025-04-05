# Angle

- _Angle(x)_

A `Type` representing an angle measured in radians.

Make an angle:

```
>>> Angle(2.pi).isAngle
true
```

There are `degrees` and `radians` accessors:

```
>>> Angle(2.pi).degrees
360

>>> Angle(360.degree).radians
2.pi
```

The circular (trigonometric) functions are implemented:

```
>>> Angle(30.degree).cos
3.sqrt / 2
```

* * *

See also: degrees, degreesToRadians, radians, radiansToDegrees

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Angle.html)

Categories: Geometry, Type
