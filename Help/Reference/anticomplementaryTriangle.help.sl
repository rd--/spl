# anticomplementaryTriangle

- _anticomplementaryTriangle(t)_

Answer the anticomplementary triangle of the triangle _t_.
The medial triangle of the anticomplementary triangle of _t_ is _t_.

Plot the anticomplementary triangle:

~~~spl svg=A
let a = [4 5 4].sssTriangle;
let b = a.anticomplementaryTriangle;
let m = b.medialTriangle;
[
	a,
	b,
	a.centroid.Point,
	m.vertexCoordinates.PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/anticomplementaryTriangle-A.svg)

* * *

See also: antipedalTriangle, medialTriangle, orthocenter, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/AnticomplementaryTriangle.html),
_W_
[1](https://en.wikipedia.org/wiki/Anticomplementary_triangle)
