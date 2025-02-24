# linearBezierFunctionAt

- _linearBezierFunctionAt(aList, aNumber)_

Answers the linear Bézier curve at _aNumber_ given the two row matrix _aList_.
This is the method utilised by `bezierFunction` for linear Bézier curves.

A linear Bézier curve, a straight line:

~~~spl svg=A
(0 -- 1).functionPlot { :x |
	[0 1; 1 0]
	.linearBezierFunctionAt(x)
}
~~~

![](sw/spl/Help/Image/linearBezierFunctionAt-A.svg)

* * *

See also: BezierCurve, bezierFunction, cubicBezierFunctionAt, deCasteljausAlgorithm, quadraticBezierFunctionAt

Guides: Geometry Functions

Categories: Geometry
