# pedalTriangle

- _pedalTriangle(t, p)_

Answer the pedal triangle of the reference triangle _t_,
given the point _p_.

An equilateral triangle, an interior point, and the associated pedal triangle:

~~~spl svg=A
let a = [1 1 1].sssTriangle;
let b = [0.25 0.25];
let c = a.pedalTriangle(b);
let d = c.vertexCoordinates;
let e = d.collect { :x | Line([b, x]) };
[a, Point(b), c, e].LineDrawing
~~~

![](sw/spl/Help/Image/pedalTriangle-A.svg)

If _p_ is the `orthocenter`, then the pedal triangle is the orthic triangle:

~~~spl svg=B
let a = [5 6 7].sssTriangle;
let b = a.orthocenter;
let c = a.pedalTriangle(b);
let d = c.vertexCoordinates;
let e = d.collect { :x | Line([b, x]) };
[a, Point(b), c, e].LineDrawing
~~~

![](sw/spl/Help/Image/pedalTriangle-B.svg)

If _p_ is the `circumcenter`, then the pedal triangle is the medial triangle:

~~~spl svg=C
let a = [4 5 4].sssTriangle;
let b = a.circumcenter;
let c = a.pedalTriangle(b);
let d = c.vertexCoordinates;
let e = d.collect { :x | Line([b, x]) };
let f = a.circumcircle;
[a, Point(b), c, e, Point(c.orthocenter), f]
.LineDrawing
~~~

![](sw/spl/Help/Image/pedalTriangle-C.svg)

Draw pedal triangles of the two Brocard points:

~~~spl svg=D
let t = [4 5 4].sssTriangle;
let a = t.firstBrocardPoint;
let b = t.secondBrocardPoint;
let c = t.firstBrocardTriangle;
let d = t.secondBrocardTriangle;
[
	t,
	c,
	d,
	[a, b].PointCloud,
	t.pedalTriangle(a),
	t.pedalTriangle(b)
].LineDrawing
~~~

![](sw/spl/Help/Image/pedalTriangle-D.svg)

* * *

See also: antipedalTriangle, cevianTriangle, fromTrilinearVertexMatrix, medialTriangle, orthicTriangle, orthocenter, Triangle, sec

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PedalTriangle.html),
_W_
[1](https://en.wikipedia.org/wiki/Pedal_triangle)
