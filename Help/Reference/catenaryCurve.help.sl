# catenaryCurve

- _catenaryCurve(a)_

The curve a hanging wire assumes when supported at its ends and acted upon by a uniform gravitational force.

Plot:

~~~spl svg=A
(-1/2.pi -- 1/2.pi).functionPlot(
	catenaryCurve(1)
)
~~~

![](sw/spl/Help/Image/catenaryCurve-A.svg)

A collection of catenary curves:

~~~spl svg=B
(-1/2.pi -- 1/2.pi).functionPlot(
	[0.95 1 1.15 1.25].collect(
		catenaryCurve:/1
	)
)
~~~

![](sw/spl/Help/Image/catenaryCurve-B.svg)

* * *

See also: cosh

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Catenary.html)
_W_
[1](https://en.wikipedia.org/wiki/Catenary)
