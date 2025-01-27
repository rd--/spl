# quadraticBezierFunctionAt

- _quadraticBezierFunctionAt(aList, aNumber)_

Answers the quadratic Bézier curve at _aNumber_ given the three row matrix _aList_.
This is a special case of the more general `bezierFunctionAt`.

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

See also: bernsteinBasis, BezierCurve, bezierFunction, bezierFunctionAt, cubicBezierFunctionAt

Guides: Geometry Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BezierFunction.html)

Categories: Geometry
