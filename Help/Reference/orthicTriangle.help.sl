# orthicTriangle

- _orthicTriangle(t)_

Answer the orthic triangle of the reference triangle _t_.

The orthic triangle is both the pedal triangle and Cevian triangle with respect to the  orthocenter.

```
>>> let t = [3 4.5 6].sssTriangle;
>>> let p = t.orthocenter;
>>> t.pedalTriangle(p)
t.cevianTriangle(p)
```

An equilateral triangle and the associated orthic triangle and orthocenter,
the `excenters` of the orthic triangle of an acute triangle _t_ are the vertices of _t_:

~~~spl svg=A
let a = [1 1 1].sssTriangle;
let b = a.orthicTriangle;
[
	a,
	Point(a.orthocenter),
	b,
	b.excenters.PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/orthicTriangle-A.svg)

In an obtuse triangle the orthocenter is external,
and the incenter of the orthic triangle is the obtuse vertex:

~~~spl svg=B
let a = [3 4.5 6].sssTriangle;
let b = a.orthicTriangle;
[
	a,
	b,
	Point(a.orthocenter),
	Point(b.incenter)
].LineDrawing
~~~

![](sw/spl/Help/Image/orthicTriangle-B.svg)

The orthic triangle of a right triangle does not exist:

~~~spl svg=C
let t = [3 4 5].sssTriangle;
let c = t.orthicTriangle.vertexCoordinates;
[t, PointCloud(c)].LineDrawing
~~~

![](sw/spl/Help/Image/orthicTriangle-C.svg)

* * *

See also: fromTrilinearVertexMatrix, orthocenter, pedalTriangle, Triangle, sec

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/OrthicTriangle.html),
_W_
[1](https://en.wikipedia.org/wiki/Orthocentric_system)
