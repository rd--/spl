# quadraticBezierToCubicBezier

- _quadraticBezierToCubicBezier(m)_

Convert a quadratic Bézier curve to a cubic Bézier curve.
_m_ should be a matrix of three rows,
the answer will be a matrix of four rows.

```
>>> [0 0; 1 1; 2 0]
>>> .quadraticBezierToCubicBezier
[0 0; 2/3 2/3; 4/3 2/3; 2 0]
```

Draw quadratic Bézier curve:

~~~spl svg=A
let p = [0 0; 1 1; 2 0];
[
	p.BezierCurve(2),
	p.Line
]
~~~

![](Help/Image/quadraticBezierToCubicBezier-A.svg)

Draw equivalent cubic Bézier curve:

~~~spl svg=B
let p = [0 0; 1 1; 2 0];
let q = p.quadraticBezierToCubicBezier;
[
	q.BezierCurve(3),
	q.Line,
	p.Line
]
~~~

![](Help/Image/quadraticBezierToCubicBezier-B.svg)

* * *

See also: BezierCurve

Guides: Geometry Functions
