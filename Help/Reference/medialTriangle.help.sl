# medialTriangle

- _medialTriangle(t)_
- _medialTriangle([p₁ p₂ p₃])_

The medial triangle,
also called the midpoint triangle,
of a triangle is the triangle with vertices at the midpoints of the triangle’s sides.
It is the `pedalTriangle` of the `orthocenter`.

```
>>> let a = [3 4 5].sssTriangle;
>>> let b = a.medialTriangle;
>>> let c = a.circumcenter;
>>> let d = b.orthocenter;
>>> let e = a.pedalTriangle(c);
>>> (a, b, c, d, e)
(
	Triangle([0 0; 5 0; 3.2 2.4]),
	Triangle([4.1 1.2; 1.6 1.2; 2.5 0]),
	[2.5 0],
	[2.5 0],
	Triangle([4.1 1.2; 1.6 1.2; 2.5 0])
)
```

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

See also: midpoint, midpointPolygon, pedalTriangle, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MedialTriangle.html),
_W_
[1](https://en.wikipedia.org/wiki/Medial_triangle)
