# Triangle

- _Triangle([p₁ p₂ p₃])_

A `Type` representing a triangle with corner points _(p₁, p₂, p₃)_.

Find the area,
centroid,
arc length,
interior angles,
and embedding dimension of a `Triangle`
(the dimension is in all cases two):

```
>>> let t = Triangle([0 0; 1 0; 0 1]);
>>> (
>>> 	t.area,
>>> 	t.centroid,
>>> 	t.arcLength,
>>> 	t.interiorAngles,
>>> 	t.dimension,
>>> 	t.embeddingDimension
>>> )
(
	1/2,
	[1/3 1/3],
	2 + 2.sqrt,
	1.pi / [2 4 4],
	2,
	2
)
```

Area, centroid and arc length of an equilateral triangle:

```
>>> let t = Triangle([0 0; 2 0; 1 3.sqrt]);
>>> (
>>> 	t.area,
>>> 	t.centroid,
>>> 	t.arcLength,
>>> 	t.interiorAngles
>>> )
(
	3.sqrt,
	[1, 3.sqrt / 3],
	6,
	3 # [1/3.pi]
)
```

Area, centroid and arc length of an isosceles triangle:

```
>>> let t = Triangle([0 0], [2 0], [1 3]);
>>> (
>>> 	t.area,
>>> 	t.centroid,
>>> 	t.arcLength,
>>> 	t.interiorAngles
>>> )
(
	3,
	[1, 1],
	8.3246,
	[1 / 10.sqrt, 1 / 10.sqrt, 4 / 5].arcCos
)
```

Draw a triangle in planar (two dimensional) space:

~~~spl svg=A
Triangle([0 0; 1 3; 2 0])
~~~

![](sw/spl/Help/Image/Triangle-A.svg)

Draw a triangle in three dimensional space:

~~~spl svg=B
[
	Cuboid([0 0 0], [1 1 1]),
	Triangle([0 0 0; 1 0 1; 0 1 1])
].PerspectiveDrawing
~~~

![](sw/spl/Help/Image/Triangle-B.svg)

The flag of Guyana:

~~~spl svg=C
[
	[0 0; 5 3].asRectangle,
	[0 0; 5 1.5; 0 3].Triangle,
	[0 0; 2.5 1.5; 0 3].Triangle
].LineDrawing
~~~

![](sw/spl/Help/Image/Triangle-C.svg)

The flag of Saint Lucia:

~~~spl svg=D
let a = 32;
let b = 2 * 55.sqrt;
let c = 18 - b;
let d = c + b;
let e = c + (2 * b);
let f = e - 4;
[
	[0 0; 72 36].asRectangle,
	[24 c; 48 c; 36 d].Triangle,
	[24 c; 48 c; 36 e].Triangle,
	[25.5 c; 46.5 c; 36 f].Triangle
].LineDrawing
~~~

![](sw/spl/Help/Image/Triangle-D.svg)

* * *

See also: Circle, equilateralTriangle, Line, Polygon, Rectangle, Simplex

Guides: Geometry Functions, Triangle Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Triangle.html)
[2](https://reference.wolfram.com/language/ref/Triangle.html),
_W_
[1](https://en.wikipedia.org/wiki/Triangle)

Categories: Geometry
