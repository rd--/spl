# randomSimplePolygon

- _randomSimplePolygon(r, n, shape)_

Answer _shape_ simple random polygons,
each with _n_ vertices,
drawn from the random number generator _r_.

Draw a simple polygon of four randomly generated vertices:

~~~spl svg=A
Sfc32(371741)
.randomSimplePolygon(4)
.asLineDrawing
~~~

![](sw/spl/Help/Image/randomSimplePolygon-A.svg)

Draw a simple polygon of seven randomly generated vertices:

~~~spl svg=B
Sfc32(798431)
.randomSimplePolygon(7)
.asLineDrawing
~~~

![](sw/spl/Help/Image/randomSimplePolygon-B.svg)

Draw a simple polygon of thirteen randomly generated vertices:

~~~spl svg=C
Sfc32(793841)
.randomSimplePolygon(13)
.asLineDrawing
~~~

![](sw/spl/Help/Image/randomSimplePolygon-C.svg)

* * *

See also: findShortestTour, randomConvexHullPolygon, randomStarConvexPolygon

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SimplePolygon.html)
[2](https://reference.wolfram.com/language/ref/RandomPolygon.html),
_W_
[1](https://en.wikipedia.org/wiki/Simple_polygon)
