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

![](sw/spl/Help/Image/superellipseCurve-A.svg)

A rhombus:

~~~spl svg=B
(0 -- 2.pi).functionPlot(
	superellipseCurve(1, 1, 1)
)
~~~

![](sw/spl/Help/Image/superellipseCurve-B.svg)

A rhombus with with convex sides:

~~~spl svg=C
(0 -- 2.pi).functionPlot(
	superellipseCurve(1, 1, 3 / 2)
)
~~~

![](sw/spl/Help/Image/superellipseCurve-C.svg)

A circle:

~~~spl svg=D
(0 -- 2.pi).functionPlot(
	superellipseCurve(1, 1, 2)
)
~~~

![](sw/spl/Help/Image/superellipseCurve-D.svg)

A squircle:

~~~spl svg=E
(0 -- 2.pi).functionPlot(
	superellipseCurve(1, 1, 4)
)
~~~

![](sw/spl/Help/Image/superellipseCurve-E.svg)

* * *

See also: Superellipse, superformulaCurve

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Superellipse.html),
_W_
[1](https://en.wikipedia.org/wiki/Superellipse)
