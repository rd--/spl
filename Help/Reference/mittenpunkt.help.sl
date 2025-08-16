# mittenpunkt

- _mittenpunkt(t)_

Answer the mittenpunkt of the triangle _t_.

```
>>> [1 1 1].sssTriangle.mittenpunkt
[0.5, 0.2887]
```

Draw the mittenpunk, excenters and medial triangle:

~~~spl svg=A
let t = [1 1 1.15].sssTriangle;
let e = t.excenters;
let m = t.mittenpunkt;
[
	t,
	t.medialTriangle,
	e.PointCloud,
	m.Point,
	e.collect { :x | Line([m x]) }
].LineDrawing
~~~

![](sw/spl/Help/Image/mittenpunkt-A.svg)

Plot mittenpunkt and related triangle centers:

~~~spl svg=B
let t = [3 3.85 5].sssTriangle;
let m = t.mittenpunkt;
let c = t.centroid;
let g = t.gergonnePoint;
let i = t.incenter;
let y = t.symmedianPoint;
let o = t.orthocenter;
let s = t.spiekerCenter;
[
	t,
	PointCloud([m c g i y o s]),
	Line([c g]),
	Line([i y]),
	Line([o s])
].LineDrawing
~~~

![](sw/spl/Help/Image/mittenpunkt-B.svg)

* * *

See also: centroid, gergonnePoint, incenter, orthocenter, spiekerCenter, symmedianPoint, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Mittenpunkt.html)
_W_
[1](https://en.wikipedia.org/wiki/Mittenpunkt)
