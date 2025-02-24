# quadraticBezierFunctionAt

- _quadraticBezierFunctionAt(aList, aNumber)_

Answers the quadratic Bézier curve at _aNumber_ given the three row matrix _aList_.
This is the method utilised by `bezierFunction` for quadratic Bézier curves.

A quadratic Bézier curve:

~~~spl svg=A
(0 -- 1).functionPlot { :x |
	[0 0; 0 1; 1 1]
	.quadraticBezierFunctionAt(x)
}
~~~

![](sw/spl/Help/Image/quadraticBezierFunctionAt-A.svg)

A symmetric quadratic Bézier curve (an arc):

~~~spl svg=B
(0 -- 1).functionPlot { :x |
	[0 0; 1 1; 2 0]
	.quadraticBezierFunctionAt(x)
}
~~~

![](sw/spl/Help/Image/quadraticBezierFunctionAt-B.svg)

* * *

See also: BezierCurve, bezierFunction, cubicBezierFunctionAt, deCasteljausAlgorithm, linearBezierFunctionAt

Guides: Geometry Functions

Categories: Geometry
