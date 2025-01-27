# bezierFunctionAt

- _bezierFunctionAt(aList, aNumber)_

Answers the Bézier curve specified in _aList_ at _aNumber_.

A two-dimensional cubic Bézier curve:

~~~spl svg=A
let c = [0 0; 1 1; 2 0; 3 2];
(0 -- 1).functionPlot { :x |
	c.bezierFunctionAt(x)
}
~~~

![](sw/spl/Help/Image/bezierFunctionAt-A.svg)

A symmetric cubic Bézier curve:

~~~spl svg=B
let c = [0 0; 1 1; 2 -1; 3 0];
(0 -- 1).functionPlot { :x |
	c.bezierFunctionAt(x)
}
~~~

![](sw/spl/Help/Image/bezierFunctionAt-B.svg)

An arc:

~~~spl svg=C
let c = [0 0; 1 1; 2 1; 3 0];
(0 -- 1).functionPlot { :x |
	c.bezierFunctionAt(x)
}
~~~

![](sw/spl/Help/Image/bezierFunctionAt-C.svg)

* * *

See also: bernsteinBasis, BezierCurve, bezierFunction, cubicBezierFunctionAt, quadraticBezierFunctionAt

Guides: Geometry Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BezierFunction.html)

Categories: Geometry
