# Ellipse

- _Ellipse(center, radius)_

A `Type` that represents a circle of _radius_ at _center_.

```
>>> let c = Ellipse([0 0], [2 1]);
>>> (c.isEllipse, c.center, c.radii)
(true, [0 0], [2 1])
```

Implements `x`, `y` and `r`:

```
>>> let c = Ellipse([0 0], 1);
>>> (c.x, c.y, c.r)
(0, 0, 1)
```

The Svg description of an ellipse:

```
>>> Ellipse([0 0], 1).asSvg
'<circle cx="0" cy="0" r="1" />'
```

* * *

See also: Circle, Polygon, Rectangle, Triangle

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Ellipse.html)
[2](https://reference.wolfram.com/language/ref/Circle.html),
_W_
[1](https://en.wikipedia.org/wiki/Ellipse)

Categories: Geometry
