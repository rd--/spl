# superellipseCurve

- _superellipseCurve(a, b, n)_

A superellipse,
also known as a Lamé curve,
is a closed curve defined by an equation that allows for various shapes between a rectangle and an ellipse.

A four-armed star with concave sides:

~~~spl svg=A
(0 -- 2.pi).functionPlot(
	superellipseCurve(1, 1, 0.5)
)
~~~

![](Help/Image/superellipseCurve-A.svg)

A rhombus:

~~~spl svg=B
(0 -- 2.pi).functionPlot(
	superellipseCurve(1, 1, 1)
)
~~~

![](Help/Image/superellipseCurve-B.svg)

A rhombus with with convex sides:

~~~spl svg=C
(0 -- 2.pi).functionPlot(
	superellipseCurve(1, 1, 3 / 2)
)
~~~

![](Help/Image/superellipseCurve-C.svg)

A circle:

~~~spl svg=D
(0 -- 2.pi).functionPlot(
	superellipseCurve(1, 1, 2)
)
~~~

![](Help/Image/superellipseCurve-D.svg)

A squircle:

~~~spl svg=E
(0 -- 2.pi).functionPlot(
	superellipseCurve(1, 1, 4)
)
~~~

![](Help/Image/superellipseCurve-E.svg)

Approximate path the geometric centroid of a rotating Reuleaux triangle:

~~~spl svg=F
let a = 2 * 3.sqrt / 3 - 1;
let r = 2.36185;
(0 -- 2.pi).functionPlot(
	superellipseCurve(a, a, r)
)
~~~

![](Help/Image/superellipseCurve-F.svg)

* * *

See also: fernandezGuastiSquircle, Superellipse, superformulaCurve

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Superellipse.html),
_W_
[1](https://en.wikipedia.org/wiki/Superellipse)
