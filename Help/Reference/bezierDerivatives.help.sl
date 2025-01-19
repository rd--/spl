# bezierDerivatives

- _bezierDerivatives(aList)_

Answer a `List` of the successive derivatives of the Bézier curve at _aList_.

The first, second, and third derivatives of a cubic Bézier curve:

```
>>> [0 0; 0 1; 1 1; 1 0].bezierDerivatives
[
	0 3; 3 0; 0 -3:;
	6 -6; -6 -6:;
	-12 0:;
	:;
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

Draw a cubic Bézier curve and the first (quadratic) derivative:

~~~spl svg=A
let p = [0 0; 0 1; 1 1; 1 0];
let d = p.bezierDerivatives;
[
	p.Line,
	p.BezierCurve(3),
	d[1].Line,
	d[1].BezierCurve(2)
].LineDrawing
~~~

![](sw/spl/Help/Image/bezierDerivatives-A.svg)

Draw a quintic Bézier curve and the first (cubic) and second (quadratic) derivatives:

~~~spl svg=B
let p = [0 0; 0 2; 3 2; 3 0; 1 0];
let d = p.bezierDerivatives;
let l = (0, 0.01 .. 1).collect { :x |
	p.deCasteljausAlgorithm(x)
};
[
	p.Line,
	l.Line,
	d[1].Line,
	d[1].BezierCurve(3),
	d[2].Line,
	d[2].BezierCurve(2)
].LineDrawing
~~~

![](sw/spl/Help/Image/bezierDerivatives-B.svg)

Zero curvature:

~~~spl svg=C
let p = [0 0; 0 2; 1 0; 2 1; 2 0];
let d = p.bezierDerivatives;
let l = (0, 0.01 .. 1).collect { :x |
	p.deCasteljausAlgorithm(x)
};
[
	p.Line,
	l.Line,
	d[1].Line,
	d[1].BezierCurve(3)
].LineDrawing
~~~

![](sw/spl/Help/Image/bezierDerivatives-C.svg)

Inflection:

~~~spl svg=D
let p = [0 0; 0.1 1.5; 1 0.5; 2 -1; 2.9 1.5; 3 0];
let d = p.bezierDerivatives;
let f = { :l |
	(0, 0.01 .. 1).collect { :x |
		l.deCasteljausAlgorithm(x)
	}
};
[
	p.Line,
	f(p).Line,
	d[1].Line,
	f(d[1]).Line
].LineDrawing
~~~

![](sw/spl/Help/Image/bezierDerivatives-D.svg)

* * *

See also: BezierCurve

Further Reading: Riesenfeld 1973

