# gergonnePoint

- _gergonnePoint(t)_

Answer the Gergonne point of the triangle _t_.

```
>>> [3 4 5].sssTriangle
>>> .gergonnePoint
[3.10909 1.30909]
```

Plot Gergonne point:

~~~
let t = [3 3.85 5].sssTriangle;
let g = t.gergonnePoint;
let i = t.incircle;
let c = t.cevianTriangle(g);
[
	t,
	PointCloud([g]),
	i,
	c
].LineDrawing
~~~

![](sw/spl/Help/Image/gergonnePoint-A.svg)

* * *

See also: centroid, contactTriangle, incenter, orthocenter, spiekerCenter, symmedianPoint, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GergonnePoint.html)
_W_
[1](https://en.wikipedia.org/wiki/Gergonne_point)
