# randomConvexHullPolygon

- _randomConvexHullPolygon(r, d, n, shape)_

Answer the convex hull of _n_ random points from the distribution _d_.

Draw the convex hull of 13 uniformly distributed randomly generated coordinates:

~~~spl svg=A
Sfc32(789341)
.randomConvexHullPolygon(
	 UniformDistribution(
		 [-1 1; -1 1]
	 ),
	13
).asLineDrawing
~~~

![](sw/spl/Help/Image/randomConvexHullPolygon-A.svg)

Draw the convex hull of 13 binormally distributed randomly generated coordinates:

~~~spl svg=B
Sfc32(793841)
.randomConvexHullPolygon(
	BinormalDistribution([0 0], [1 1], 0.5),
	13
).asLineDrawing
~~~

![](sw/spl/Help/Image/randomConvexHullPolygon-B.svg)

* * *

See also: convexHull, randomStarConvexPolygon, randomVariate

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ConvexHull.html)
[2](https://reference.wolfram.com/language/ref/RandomPolygon.html),
_W_
[1](https://en.wikipedia.org/wiki/Convex_hull)
