# Ellipse

- _Ellipse(c, r)_

A `Type` that represents an axis aligned ellipse of radii _r_ at center coordinates _c_.

```
>>> let e = Ellipse([0 0], [2 1]);
>>> (e.isEllipse, e.center, e.radii)
(true, [0 0], [2 1])
```

The bounding box of an ellipse:

```
>>> Ellipse([0 0], [2 1]).boundingBox
[-2 -1; 2 1]
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

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Ellipse.html)
[2](https://reference.wolfram.com/language/ref/Circle.html),
_W_
[1](https://en.wikipedia.org/wiki/Ellipse)

Categories: Geometry
