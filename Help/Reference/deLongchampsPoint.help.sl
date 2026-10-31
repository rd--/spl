# deLongchampsPoint

- _deLongchampsPoint(t)_

Answer the de Longchamps point of the triangle _t_.

```
>>> [3 4 5].sssTriangle
>>> .deLongchampsPoint
[1.8 -2.4]
```

Plot de Longchamps point:

~~~spl svg=A
let t = [4 2.5 4].sssTriangle;
let d = t.deLongchampsPoint;
let o = t.orthocenter;
let c = t.circumcenter;
[
	t,
	PointSet([d o c]),
	Line([o d])
].LineDrawing
~~~

![](Help/Image/deLongchampsPoint-A.svg)

* * *

See also: Triangle, centroid, gergonnePoint, incenter, orthocenter, spiekerCenter, symmedianPoint

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/deLongchampsPoint.html)
_W_
[1](https://en.wikipedia.org/wiki/De_Longchamps_point)
