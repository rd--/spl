# nagelPoint

- _nagelPoint(t)_

Answer the Nagel point of the triangle _t_.

```
>>> [3 4 5].sssTriangle
>>> .nagelPoint
[2.2 0.4]
```

Plot Nagel point:

~~~
let t = [3 3.85 5].sssTriangle;
let n = t.nagelPoint;
let c = t.centroid;
let i = t.incenter;
let e = t.cevianTriangle(n);
[
	t,
	PointCloud([n c i]),
	Line([n c i]),
	e
].LineDrawing
~~~

![](sw/spl/Help/Image/nagelPoint-A.svg)

* * *

See also: centroid, gergonnePoint, incenter, orthocenter, spiekerCenter, symmedianPoint, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NagelPoint.html)
_W_
[1](https://en.wikipedia.org/wiki/Nagel_point)
