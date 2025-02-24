# cubicBezierFunctionAt

- _cubicBezierFunctionAt(aList, aNumber)_

Answers the cubic Bézier curve at _aNumber_ given the four row matrix _aList_.
This is a special case of the more general `bezierFunctionAt`.

A cubic Bézier curve:

~~~spl svg=A
(0 -- 1).functionPlot { :x |
	[0 0; 1 1; 2 0; 3 2]
	.cubicBezierFunctionAt(x)
}
~~~

![](sw/spl/Help/Image/cubicBezierFunctionAt-A.svg)

A symmetric cubic Bézier curve:

~~~spl svg=B
(0 -- 1).functionPlot { :x |
	[0 0; 1 1; 2 -1; 3 0]
	.cubicBezierFunctionAt(x)
}
~~~

![](sw/spl/Help/Image/cubicBezierFunctionAt-B.svg)

An arc:

~~~spl svg=C
(0 -- 1).functionPlot { :x |
	[0 0; 1 1; 2 1; 3 0]
	.cubicBezierFunctionAt(x)
}
~~~

![](sw/spl/Help/Image/cubicBezierFunctionAt-C.svg)

* * *

See also: BezierCurve, bezierFunction, deCasteljausAlgorithm, linearBezierFunctionAt, quadraticBezierFunctionAt

Guides: Geometry Functions

Categories: Geometry
