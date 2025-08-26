# reuleauxPolygonCurve

- _reuleauxPolygonCurve(n)_

Answer a parametric curve for the degree-_n_ Reuleaux polygon.

Plot a Reuleaux triangle:

~~~spl svg=A
(0 -- 2.pi).functionPlot(
	3.reuleauxPolygonCurve
)
~~~

![](sw/spl/Help/Image/reuleauxPolygonCurve-A.svg)

Plot a Reuleaux 5-polygon:

~~~spl svg=A
(0 -- 2.pi).functionPlot(
	5.reuleauxPolygonCurve
)
~~~

![](sw/spl/Help/Image/reuleauxPolygonCurve-B.svg)

* * *

See also: cos, pi, superellipseCurve

Guides: Curve Functions

References:
_Mathematica_
[1](https://en.wikipedia.org/wiki/Reuleaux_triangle),
_W_
[1](https://en.wikipedia.org/wiki/Reuleaux_triangle)
