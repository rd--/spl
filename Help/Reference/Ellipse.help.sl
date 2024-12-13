# Ellipse

- _Ellipse(center, radius)_

A `Type` that represents an axis aligned ellipse of _radii_ at _center_.

```
>>> let c = Ellipse([0 0], [2 1]);
>>> (c.isEllipse, c.center, c.radii)
(true, [0 0], [2 1])
```

The bounding box of an ellipse:

```
>>> Ellipse([0 0], [2 1]).boundingBox
[-2 -1; 2 1]
```

The Svg description of an ellipse:

```
>>> Ellipse([0 0], [2 1]).forSvg(precision: 0)
'<ellipse cx="0" cy="0" rx="2" ry="1" />'
```

A drawing of two ellipses:

~~~spl svg=A
Ellipse(
	[0 0; 0 0],
	[3 4; 3 2]
).LineDrawing
~~~

![](sw/spl/Help/Image/Ellipse-A.svg)

* * *

See also: Circle, Polygon, Rectangle, Triangle

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Ellipse.html)
[2](https://reference.wolfram.com/language/ref/Circle.html),
_W_
[1](https://en.wikipedia.org/wiki/Ellipse)

Categories: Geometry
