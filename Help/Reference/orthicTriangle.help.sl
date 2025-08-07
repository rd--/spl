# orthicTriangle

- _orthicTriangle(t)_

Answer the orthic triangle of the triangle _t_.

An equilateral triangle and the associated orthic triangle and orthocenter:

~~~spl svg=A
let t = [1 1 1].sssTriangle;
[
	t,
	Point(t.orthocenter),
	t.orthicTriangle
].LineDrawing
~~~

![](sw/spl/Help/Image/orthicTriangle-A.svg)

A triangle where the orthocenter is external:

~~~spl svg=B
let t = [3 4 6].sssTriangle;
[
	t,
	Point(t.orthocenter),
	t.orthicTriangle
].LineDrawing
~~~

![](sw/spl/Help/Image/orthicTriangle-B.svg)

* * *

See also: fromTrilinearVertexMatrix, orthocenter, pedalTriangle, Triangle, secant

References:
_Mathematica_
[1](https://mathworld.wolfram.com/OrthicTriangle.html)
_W_
[1](https://en.wikipedia.org/wiki/Orthocentric_system)
