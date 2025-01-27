# bezierFunction

- _bezierFunction(aList)_

Answers a unary function that will index the Bézier curve defined by the sequence of control points at _aList_.
In common cases _aList_ will be a either
a 3×2 matrix specifying a quadratic Bézier curve,
or a 4×2 matrix specifying a cubic Bézier curve.

A cubic Bézier curve:

~~~spl svg=A
(0 -- 1).functionPlot(
	[0 0; 1 1; 2 0; 3 2].bezierFunction
)
~~~

![](sw/spl/Help/Image/bezierFunction-A.svg)

A symmetric cubic Bézier curve:

~~~spl svg=B
(0 -- 1).functionPlot(
	[0 0; 1 1; 2 -1; 3 0].bezierFunction
)
~~~

![](sw/spl/Help/Image/bezierFunction-B.svg)

* * *

See also: bernsteinBasis, BezierCurve, bezierFunctionAt

Guides: Geometry Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BezierFunction.html)

Categories: Geometry
