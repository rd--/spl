# bezierFunctionAt

- _bezierFunctionAt(aList, aNumber)_

Answers the Bézier curve specified in _aList_ at _aNumber_.
This method runs `bezierFunction` to generate the function,
and then immediately applies it,
discarding the generated function.
Ordinarily one would use the function directly,
or use one of the more specific methods
`linearBezierFunctionAt`,
`quadraticBezierFunctionAt`,
`cubicBezierFunctionAt`
or `deCasteljausAlgorithm`.

Construct a Bézier curve using a list of control points and apply the function to find a point on the curve:

```
>>> [0 0; 1 1; 2 0; 3 2]
>>> .bezierFunctionAt(0.5)
[1.5, 0.625]

>>> [0 0; 1 1; 2 0; 3 2]
>>> .cubicBezierFunctionAt(0.5)
[1.5, 0.625]
```

* * *

See also: bernsteinBasis, BezierCurve, bezierFunction, cubicBezierFunctionAt, deCasteljausAlgorithm, linearBezierFunctionAt, quadraticBezierFunctionAt

Guides: Geometry Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BezierFunction.html)

Categories: Geometry
