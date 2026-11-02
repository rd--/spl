# linearBezierFunctionAt

- _linearBezierFunctionAt(m, n)_

Answers the linear Bézier curve at _b_ given the two row matrix _m_.
This is the method utilised by `bezierFunction` for linear Bézier curves.

A linear Bézier curve, a straight line:

~~~spl svg=A
(0 -- 1).functionPlot { :x |
	[0 1; 1 0]
	.linearBezierFunctionAt(x)
}
~~~

![](Help/Image/linearBezierFunctionAt-A.svg)

* * *

See also: BezierCurve, bezierFunction, cubicBezierFunctionAt, deCasteljausAlgorithm, quadraticBezierFunctionAt

Guides: Geometry Functions
