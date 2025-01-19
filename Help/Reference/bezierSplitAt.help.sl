# bezierSplitAt

- _bezierSplitAt(aList, aNumber)_

Split a Bézier curve into two parts at position _aNumber_,
which should be between `zero` and `one`.
The split is made using the same process as `deCasteljausAlgorithm`.

```
>>> [5 5; 1 3; 10 0; 10 10]
>>> .bezierSplitAt(0.5)
(
	[5 5; 3 4; 4.25 2.75; 6 3],
	[6 3; 7.75 3.25; 10 5; 10 10]
)
```

Draw a cubic Bézier curve and the control points:

~~~spl svg=A
let p = [5 5; 1 3; 10 0; 10 10];
[
	p.BezierCurve(3),
	p.Line
].LineDrawing
~~~

![](sw/spl/Help/Image/bezierSplitAt-A.svg)

Draw the same cubic Bézier curve split into two parts,
and both the initial and the derived control points:

~~~spl svg=B
let p = [5 5; 1 3; 10 0; 10 10];
let [q, r] = p.bezierSplitAt(0.5);
[
	q.BezierCurve(3),
	r.BezierCurve(3),
	p.Line,
	q.Line,
	r.Line
].LineDrawing
~~~

![](sw/spl/Help/Image/bezierSplitAt-B.svg)

* * *

See also: BezierCurve, deCasteljausAlgorithm
