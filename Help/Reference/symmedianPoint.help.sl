# symmedianPoint

- _symmedianPoint(t)_

Answer the symmedian point,
also called the Lemoine point or the Grebe point,
of the triangle _t_.

```
>>> [3 4 5].sssTriangle
>>> .symmedianPoint
[3.2 1.2]
```

The symmedian point of a triangle _t_ is the centroid of its own pedal triangle:

```
>>> let t = [3 4 5].sssTriangle;
>>> let p = t.symmedianPoint;
>>> p ~ t.pedalTriangle(p).centroid
true
```

Plot symmedian point and related triangle centers,
the symmedian point _s_ of the triangle _t_ is the centroid of the pedal triangle of _(t,s)_:

~~~
let t = [3 3.85 5].sssTriangle;
let s = t.symmedianPoint;
let p = t.pedalTriangle(s);
let c = p.centroid;
[
	t,
	p,
	PointCloud([s c])
].LineDrawing
~~~

![](sw/spl/Help/Image/symmedianPoint-A.svg)

* * *

See also: centroid, gergonnePoint, incenter, orthocenter, schouteCenter, spiekerCenter, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SymmedianPoint.html),
_W_
[1](https://en.wikipedia.org/wiki/Lemoine_point)
