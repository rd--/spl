# Ellipse

- _Ellipse(center, radius)_

A `Type` that represents an axis aligned ellipse of _radii_ at _center_.

```
>>> let c = Ellipse([0 0], [2 1]);
>>> (c.isEllipse, c.center, c.radii)
(true, [0 0], [2 1])
```

The Svg description of an ellipse:

```
>>> Ellipse([0 0], [2 1]).forSvg(1)
'<ellipse cx="0.00" cy="0.00" rx="2.00" ry="1.00" />'
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
