# quadraticBezierFunctionAt

- _quadraticBezierFunctionAt(aList, aNumber)_

Answers the cubic Bézier curve at _aNumber_ given the three row matrix _aList_.

A quadratic Bézier curve:

~~~spl svg=A
(0 -- 1).functionPlot { :x |
	[0 0; 0 1; 1 1]
	.quadraticBezierFunctionAt(x)
}
~~~

![](sw/spl/Help/Image/quadraticBezierFunctionAt-A.svg)

A symmetric quadratic Bézier curve:

~~~spl svg=B
(0 -- 1).functionPlot { :x |
	[0 0; 1 1; 2 0]
	.quadraticBezierFunctionAt(x)
}
~~~

![](sw/spl/Help/Image/quadraticBezierFunctionAt-B.svg)

An arc:

~~~spl svg=C
(0 -- 1).functionPlot { :x |
	[0 0; 1 1; 2 1; 3 0]
	.quadraticBezierFunctionAt(x)
}
~~~

![](sw/spl/Help/Image/quadraticBezierFunctionAt-C.svg)

* * *

See also: bernsteinBasis, BezierCurve, bezierFunction, cubicBezierFunctionAt

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BezierFunction.html)
