# randomStarConvexPolygon

- _randomStarConvexPolygon(r, n, minRadius, maxRadius)_

Answer a randomly generated star convex `Polygon`,
with a vertex count of _n_,
drawn from the random number generator _r_.

Draw a randomly generated star convex polygon with 13 vertices and minimal radius of 0.5:

~~~spl svg=A
Sfc32(378941)
.randomStarConvexPolygon(13, 0.5, 1)
.asLineDrawing
~~~

![](sw/spl/Help/Image/randomStarConvexPolygon-A.svg)

A star-convex polygon is not necessarily convex,
although all convex polygons are star-convex:

```
>>> Sfc32(378941)
>>> .randomStarConvexPolygon(13, 0.5, 1)
>>> .isConvex
false
```

Draw a randomly generated star convex polygon with 33 vertices and minimal radius of 0.33:

~~~spl svg=B
Sfc32(379148)
.randomStarConvexPolygon(33, 0.33, 1)
.asLineDrawing
~~~

![](sw/spl/Help/Image/randomStarConvexPolygon-B.svg)

Draw three randomly generated star convex polygons:

~~~spl svg=C
let r = Sfc32(123123);
[3 7 13].collect { :rMin |
	r.randomStarConvexPolygon(
		23,
		rMin,
		rMin + 2.3
	)
}.LineDrawing
~~~

![](sw/spl/Help/Image/randomStarConvexPolygon-C.svg)

* * *

See also: fromPolarCoordinates, Polygon, randomConvexHullPolygon, randomReal, randomSimplePolygon

References:
_Mathematica_
[1](https://mathworld.wolfram.com/StarConvex.html)
[2](https://reference.wolfram.com/language/ref/RandomPolygon.html),
_W_
[1](https://en.wikipedia.org/wiki/Star_domain)
