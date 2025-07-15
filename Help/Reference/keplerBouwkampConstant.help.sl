# keplerBouwkampConstant

- _keplerBouwkampConstant(n)_

Answer the Kepler–Bouwkamp constant, the reciprocal of the polygon inscribing constant.

```
>>> 1.keplerBouwkampConstant
0.11494

>>> 1 / 1.keplerBouwkampConstant
8.70004
```

Approximate using first few terms:

```
>>> (3 .. 5E4).product { :n |
>>> 	(1.pi / n).cos
>>> }
0.11495
```

Draw the first few inscribed polygons,
taking inradius of each polygon:

~~~spl svg=A
let r = 1;
let g = [];
3.toDo(6) { :n |
	g.add(Circle([0 0], r));
	g.add(regularPolygon(n, [0 0], r, 0));
	r := r / (1.pi / n).cos
};
g.LineDrawing
~~~

![](sw/spl/Help/Image/keplerBouwkampConstant-A.svg)

Draw the first few inscribed polygons,
taking circumradius of each polygon:

~~~spl svg=B
let r = 1;
let g = [];
3.toDo(6) { :n |
	g.add(Circle([0 0], r));
	g.add(regularPolygon(n, [0 0], r, 0));
	r := r * (1.pi / n).cos
};
g.LineDrawing
~~~

![](sw/spl/Help/Image/keplerBouwkampConstant-B.svg)

* * *

See also: Circle, Polygon, regularPolygon

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PolygonInscribing.html),
_OEIS_
[1](https://oeis.org/A085365),
_W_
[1](https://en.wikipedia.org/wiki/Kepler%E2%80%93Bouwkamp_constant)
