# medialTriangle

- _medialTriangle([p₁ p₂ p₃])_

The medial triangle,
also called the midpoint triangle,
of a triangle is the triangle with vertices at the midpoints of the triangle’s sides.

At `List`:

~~~spl svg=A
let p = [0 0; 0 1; 1 0];
let q = p.medialTriangle;
[
	(p ++ q).PointCloud,
	p.Triangle,
	q.Triangle
].LineDrawing
~~~

![](sw/spl/Help/Image/medialTriangle-A.svg)

At `Triangle`:

~~~spl svg=B
let t = sssTriangle(1, 1, 1);
[
	t,
	t.medialTriangle
].LineDrawing
~~~

![](sw/spl/Help/Image/medialTriangle-B.svg)

* * *

See also: midpoint, midpointPolygon, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MedialTriangle.html),
_W_
[1](https://en.wikipedia.org/wiki/Medial_triangle)
