# degrees

- _degrees(x)_

At `SmallFloat`,
answer a `Quantity` value:

```
>>> 90.degrees
Quantity(1/2.pi, 'radians')
```

At `Quantity` and `PlaneAngle`,
answer the value in degrees:

```
>>> 1.5.pi.radians.degrees
270

>>> PlaneAngle(0.5.pi).degrees
90
```

See also `degree`, which answers the angle in radians directly:

```
>>> 90.degree
0.5.pi

>>> 30.degree
(1 / 6).pi
```

See also `degreesToRadians`:

```
>>> 30.degreesToRadians
(1 / 6).pi

>>> 30.degree
(1 / 6).pi
```

* * *

See also: degree, PlaneAngle, Quantity, radians

Guides: Quantity Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Degree.html)
_W_
[1](https://en.wikipedia.org/wiki/Degree_(angle))
