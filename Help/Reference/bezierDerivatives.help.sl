# bezierDerivatives

- _bezierDerivatives(aList)_

Answer a `List` of the successive derivatives of the Bézier curve at _aList_.

The first, second, and third derivatives of a cubic Bézier curve:

```
>>> [0 0; 0 1; 1 1; 1 0].bezierDerivatives
[
	0 3; 3 0; 0 -3:;
	6 -6; -6 -6:;
	-12 0
]
```

Calculate a specific point at the first derivative of a cubic Bézier curve:

```
>>> let p = [1 0; 1 1; 2 0; 2 1];
>>> let d = p.bezierDerivatives;
>>> let x = 0.125;
>>> (
>>> 	p.cubicBezierFunctionAt(x),
>>> 	d[1].quadraticBezierFunctionAt(x)
>>> )
(
	[1.13867, 0.28906],
	[0.65625, 1.6875]
)
```

Draw a cubic Bézier curve and the first (quadratic) derivative (rescaled):

~~~spl svg=A
let p = [0 0; 0 1; 1 1; 1 0];
let d = p.bezierDerivatives;
let d1 = d[1] * 0.2;
[
	p.Line,
	p.BezierCurve(3),
	d1.Line,
	d1.BezierCurve(2)
].LineDrawing
~~~

![](sw/spl/Help/Image/bezierDerivatives-A.svg)

Draw a quintic Bézier curve and the first (cubic) and second (quadratic) derivatives (rescaled):

~~~spl svg=B
let p = [0 0; 0 2; 3 2; 3 0; 1 0];
let d = p.bezierDerivatives;
let d1 = d[1] * 0.2;
let d2 = d[2] * 0.2 * 0.2;
let l = (0, 0.01 .. 1).collect { :x |
	p.deCasteljausAlgorithm(x)
};
[
	p.Line,
	l.Line,
	d1.Line,
	d1.BezierCurve(3),
	d2.Line,
	d2.BezierCurve(2)
].LineDrawing
~~~

![](sw/spl/Help/Image/bezierDerivatives-B.svg)

Zero curvature (rescaled):

~~~spl svg=C
let p = [0 0; 0 2; 1 0; 2 1; 2 0];
let d = p.bezierDerivatives;
let d1 = d[1] * 0.2;
let l = (0, 0.01 .. 1).collect { :x |
	p.deCasteljausAlgorithm(x)
};
[
	p.Line,
	l.Line,
	d1.Line,
	d1.BezierCurve(3)
].LineDrawing
~~~

![](sw/spl/Help/Image/bezierDerivatives-C.svg)

Inflection (rescaled):

~~~spl svg=D
let p = [
	0 0;
	0.1 1.5;
	1 0.5;
	2 -1;
	2.9 1.5;
	3 0
];
let d = p.bezierDerivatives;
let d1 = d[1] * 0.2;
let f = { :l |
	(0, 0.01 .. 1).collect { :x |
		l.deCasteljausAlgorithm(x)
	}
};
[
	p.Line,
	f(p).Line,
	d1.Line,
	f(d1).Line
].LineDrawing
~~~

![](sw/spl/Help/Image/bezierDerivatives-D.svg)

* * *

See also: BezierCurve

Guides: Geometry Functions

Further Reading: Riesenfeld 1973
