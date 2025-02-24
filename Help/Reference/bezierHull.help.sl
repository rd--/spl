# bezierHull

- _bezierHull(aList, aNumber)_

Hull of a quadratic Bézier curve:

```
>>> [0 0; 0 1; 1 1].bezierHull(0.5)
[
	0 0; 0 1; 1 1;
	0 0.5; 0.5 1;
	0.25 0.75
]
```

Plot curve, along with hull points and lines:

~~~spl svg=A
let p = [0 0; 0 1; 1 1];
let h = p.bezierHull(0.5);
[
	p.BezierCurve(2),
	p.PointCloud,
	h.PointCloud,
	h.atAll([1 2 3]).Line,
	h.atAll([4 5]).Line
].LineDrawing
~~~

![](sw/spl/Help/Image/bezierHull-A.svg)

Hull of a cubic Bézier curve:

```
>>> [0 0; 1 1; 2 0; 3 2].bezierHull(0.5)
[
	0 0; 1 1; 2 0; 3 2;
	0.5 0.5; 1.5 0.5; 2.5 1;
	1 0.5; 2 0.75;
	1.5 0.625
]
```

Plot curve, along with hull points and lines:

~~~spl svg=B
let p = [0 0; 1 1; 2 0; 3 2];
let h = p.bezierHull(0.5);
[
	p.BezierCurve(3),
	p.PointCloud,
	h.PointCloud,
	h.atAll([1 2 3 4]).Line,
	h.atAll([5 6 7]).Line,
	h.atAll([8 9]).Line
].LineDrawing
~~~

![](sw/spl/Help/Image/bezierHull-B.svg)

* * *

See also: BezierCurve
