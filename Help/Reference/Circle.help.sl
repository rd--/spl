# Circle

- _Circle(center, radius)_

A `Type` that represents a circle of _radius_ at _center_.

```
>>> let c = Circle([0 0], 1);
>>> (c.isCircle, c.center, c.radius)
(true, [0 0], 1)
```

Implements `x`, `y` and `r`:

```
>>> let c = Circle([0 0], 1);
>>> (c.x, c.y, c.r)
(0, 0, 1)
```

Calculate arc length, area, circumference, perimeter, centroid, diameter and radius:

```
>>> let c = Circle([0 0], 1);
>>> (
>>> 	c.arcLength,
>>> 	c.area,
>>> 	c.circumference,
>>> 	c.perimeter,
>>> 	c.centroid,
>>> 	c.center,
>>> 	c.diameter,
>>> 	c.radius
>>> )
(2.pi, 1.pi, 2.pi, 2.pi, [0 0], [0 0], 2, 1)
```

The Svg description of a circle:

```
>>> Circle([0 0], 1).asSvg
'<circle cx="0" cy="0" r="1" />'
```

* * *

See also: arcLength, area, centroid, perimeter, Polygon, Rectangle, r, Triangle, x, y

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Circle.html)
[2](https://reference.wolfram.com/language/ref/Circle.html)

Categories: Geometry
