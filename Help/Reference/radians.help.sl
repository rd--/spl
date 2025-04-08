# radians

- _radians(x)_

At `SmallFloat`,
answer a `Quantity` value:

```
>>> 2.pi.radians
Quantity(2.pi, 'radians')
```

At `Quantity` and `PlaneAngle`,
answer the value in radians:

```
>>> 270.degrees.radians
1.5.pi

>>> PlaneAngle(90.degree).radians
1/2.pi
```

* * *

See also: Angle, degrees, radiansToDegrees

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Degree.html)
