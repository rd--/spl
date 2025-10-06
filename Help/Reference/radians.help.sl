# radians

- _radians(x)_

At `SmallFloat`,
answer a `Quantity` value:

```
>>> 2.pi.radians
Quantity(2.pi, 'radians')
```

Threads over lists:

```
>>> [1/6 1/3 2/3].pi.radians
[30 60 120].degrees
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

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Radian.html),
_W_
[1](https://en.wikipedia.org/wiki/Radian)
