# feuerbachPoint

- _feuerbachPoint(t)_

Answer the de Longchamps point of the triangle _t_.

```
>>> [3 4 5].sssTriangle
>>> .feuerbachPoint
[3.6 0.2]
```

Plot Feuerbach point:

~~~
let t = [4 2.5 4].sssTriangle;
let f = t.feuerbachPoint;
let o = t.orthocenter;
let c = t.circumcenter;
[
	t,
	t.feuerbachPoint.Point,
	t.incircle,
	t.ninePointCircle
].LineDrawing
~~~

![](sw/spl/Help/Image/feuerbachPoint-A.svg)

* * *

See also: centroid, gergonnePoint, incenter, orthocenter, spiekerCenter, symmedianPoint, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FeuerbachPoint.html)
_W_
[1](https://en.wikipedia.org/wiki/Feuerbach_point)
