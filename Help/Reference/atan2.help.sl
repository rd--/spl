# atan2

- _atan2(y, x)_

Four-quadrant inverse tangent.

The four-quadrant inverse tangent of the point _y=4,x=-3_:

```
>>> atan2(4, -3)
2.2143
```

Convert _4+3i_ into polar coordinates:

```
>>> let z = 4J3;
>>> let r = z.abs;
>>> let theta = atan2(z.imaginary, z.real);
>>> (r, theta)
(5, 0.6435)
```

* * *

See also: arcTan, tan

Guides: Trigonometric Functions

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/double.atan2.html),
_W_
[1](https://en.wikipedia.org/wiki/Atan2)
