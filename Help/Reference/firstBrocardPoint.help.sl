# firstBrocardPoint

- _firstBrocardPoint(t)_

Answer the first Brocard point of the triangle _t_.

```
>>> let t = [5 4 5].sssTriangle;
>>> t.firstBrocardPoint
t.brocardPoints[1]
```

Draw first Brocard point at tangent circles:

~~~spl svg=A
let t = [5 4 5].sssTriangle;
let b = t.firstBrocardPoint;
let [p, q, r] = t.vertexCoordinates;
[
	t,
	[p q b].circleThrough,
	[p r b].circleThrough,
	[q r b].circleThrough,
	PointSet[b p q r]
].LineDrawing
~~~

![](Help/Image/firstBrocardPoint-A.svg)

* * *

See also: Triangle, firstBrocardTriangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FirstBrocardPoint.html)
