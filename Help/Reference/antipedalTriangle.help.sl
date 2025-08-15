# antipedalTriangle

- _antipedalTriangle(t, p)_

Answer the antipedal triangle of the reference triangle _t_,
given the point _p_.

Plot excentral triangle:

~~~spl svg=A
let t = [4 5 4].sssTriangle;
let e = t.excentralTriangle;
[
	t,
	t.antipedalTriangle(t.incenter),
	e.vertexCoordinates.PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/antipedalTriangle-A.svg)

Plot tangential triangle:

~~~spl svg=B
let a = [3 2.75 3].sssTriangle;
let b = a.tangentialTriangle;
[
	a,
	b,
	b.vertexCoordinates.PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/antipedalTriangle-B.svg)

The antipedal triangle of the first Fermat point is equilateral:

~~~spl svg=C
let t = [4 5 4].sssTriangle;
let p = t.firstFermatPoint;
[
	t,
	t.antipedalTriangle(p),
	p.Point
].LineDrawing
~~~

![](sw/spl/Help/Image/antipedalTriangle-C.svg)

* * *

See also: anticomplementaryTriangle, pedalTriangle, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/AntipedalTriangle.html),
_W_
[1](https://en.wikipedia.org/wiki/Antipedal_triangle)
