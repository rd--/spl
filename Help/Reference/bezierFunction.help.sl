# bezierFunction

- _bezierFunction(aList)_

Answers a unary function that will index the Bézier curve defined by the sequence of control points at _aList_.
In common cases _aList_ will be a either
a 3×2 matrix specifying a quadratic Bézier curve,
or a 4×2 matrix specifying a cubic Bézier curve.

For linear Bézier curves utilises `linearBezierFunctionAt`,
for quadratic Bézier curves utilises `quadraticBezierFunctionAt`,
for cubic Bézier curves utilises `cubicBezierFunctionAt`,
for quartic and higher degree Bézier curves utilises `deCasteljausAlgorithm`.

Construct a Bézier curve using a list of control points and apply the function to find a point on the curve:

```
>>> let p = [0 0; 1 1; 2 0; 3 2];
>>> let f:/1 = p.bezierFunction;
>>> f(0.5)
[1.5, 0.625]
```

A cubic Bézier curve:

~~~spl svg=A
(0 -- 1).functionPlot(
	[0 0; 1 1; 2 0; 3 2]
	.bezierFunction
)
~~~

![](sw/spl/Help/Image/bezierFunction-A.svg)

A symmetric cubic Bézier curve:

~~~spl svg=B
(0 -- 1).functionPlot(
	[0 0; 1 1; 2 -1; 3 0]
	.bezierFunction
)
~~~

![](sw/spl/Help/Image/bezierFunction-B.svg)

An arc:

~~~spl svg=C
(0 -- 1).functionPlot(
	[0 0; 1 1; 2 1; 3 0]
	.bezierFunction
)
~~~

![](sw/spl/Help/Image/bezierFunction-C.svg)

A cubic Bézier curve in one dimension:

~~~spl svg=D
(0 -- 1).discretize(64).collect(
	[0 0.25 1.75 2].bezierFunction
).discretePlot
~~~

![](sw/spl/Help/Image/bezierFunction-D.svg)

Plot the same one dimensional cubic Bézier curve in one dimension:

~~~spl svg=E
let f:/1 = [0 0.25 1.75 2].bezierFunction;
(0 -- 1).discretize(64).collect { :mu |
	let x = f(mu);
	[x 0; x 1]
}.Line
~~~

![](sw/spl/Help/Image/bezierFunction-E.svg)

* * *

See also: bernsteinBasis, bezierApproximation, BezierCurve, bezierFunctionAt, bezierTrace, cubicBezierFunctionAt, deCasteljausAlgorithm, linearBezierFunctionAt, quadraticBezierFunctionAt

Guides: Geometry Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BezierFunction.html)

Categories: Geometry
