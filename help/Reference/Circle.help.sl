# Circle

- _Circle(center, radius)_

A `Type` that represents a circle of _radius_ at _center_.

```
>>> let c = Circle([0 0], 1);
>>> (c.isCircle, c.center, c.radius)
(true, Point(0, 0), 1)
```

Implements `x`, `y` and `r`:

```
>>> let c = Circle([0 0], 1);
>>> (c.x, c.y, c.r)
(0, 0, 1)
```

Calculate arc length, area, circumference and diameter:

```
>>> let c = Circle([0 0], 1);
>>> (c.arcLength, c.area, c.circumference, c.diameter)
(2.pi, 1.pi, 2.pi, 2)
```

* * *

See also: arcLength, area, r, x, y

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Circle.html)
[2](https://reference.wolfram.com/language/ref/Circle.html)
