# bezierFunction

- _bezierFunction(aList)_

Answers a unary function that will index the Bézier curve defined by the sequence of control points at _aList_.
In the common case, _aList_ will be a 4×2 matrix.

~~~spl svg=A
(0 -- 1).functionPlot(
	[0 0; 1 1; 2 0; 3 2].bezierFunction
)
~~~

![](sw/spl/Help/Image/bezierFunction-A.svg)

A symmetric curve:

~~~spl svg=B
(0 -- 1).functionPlot(
	[0 0; 1 1; 2 -1; 3 0].bezierFunction
)
~~~

![](sw/spl/Help/Image/bezierFunction-B.svg)

* * *

See also: bernsteinBasis, BezierCurve

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BezierFunction.html)
