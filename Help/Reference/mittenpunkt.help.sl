# mittenpunkt

- _mittenpunkt(t)_

Answer the mittenpunkt of the triangle _t_.

```
>>> [1 1 1].sssTriangle.mittenpunkt
[0.5, 0.2887]
```

Plot mittenpunkt and related triangle centers:

~~~
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

![](sw/spl/Help/Image/mittenpunkt-A.svg)

* * *

See also: centroid, gergonnePoint, incenter, orthocenter, spiekerCenter, symmedianPoint, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Mittenpunkt.html)
_W_
[1](https://en.wikipedia.org/wiki/Mittenpunkt)
