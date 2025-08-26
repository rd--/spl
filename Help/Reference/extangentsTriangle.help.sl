# extangentsTriangle

- _extangentsTriangle(t)_

Answer the extangents triangle of the reference triangle _t_.

```
>>> let a = -2/3.pi.tan;
>>> let b = -1/3.pi.sin * 3;
>>> [1 1 1].sssTriangle
>>> .extangentsTriangle
Triangle([3 a; -2 a; 0.5 b])
```

Plot extangents triangle:

~~~spl svg=A
let a = [3 2.5 3].sssTriangle;
let b = a.extangentsTriangle;
let c = a.excenters;
[
	a,
	a.excircles,
	c.PointCloud,
	a.orthicTriangle,
	a.clawsonPoint.Point,
	b,
	b.incircle,
	b.incenter.Point,
	c.Triangle.circumcircle
].LineDrawing
~~~

![](sw/spl/Help/Image/extangentsTriangle-A.svg)

* * *

See also: excenters, excircles, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ExtangentsTriangle.html)
_W_
[1](https://en.wikipedia.org/wiki/Extangents_triangle)
