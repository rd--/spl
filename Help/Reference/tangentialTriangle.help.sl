# tangentialTriangle

- _tangentialTriangle(t)_

Answer the tangential triangle of the reference triangle _t_.

At an equilateral reference triangle:

~~~spl svg=A
let t = [1 1 1].sssTriangle;
[
	t,
	t.tangentialTriangle,
	t.circumcircle,
	t.orthicTriangle
].LineDrawing
~~~

![](sw/spl/Help/Image/tangentialTriangle-A.svg)

At an obtuse reference triangle:

~~~spl svg=B
let t = [3 4.75 3].sssTriangle;
[
	t,
	t.tangentialTriangle,
	t.circumcircle,
	t.orthicTriangle
].LineDrawing
~~~

![](sw/spl/Help/Image/tangentialTriangle-B.svg)

* * *

See also: circumcircle, fromTrilinearVertexMatrix, orthicTriangle, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TangentialTriangle.html),
_W_
[1](https://en.wikipedia.org/wiki/Tangential_triangle)
