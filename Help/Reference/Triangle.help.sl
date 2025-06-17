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
	1/3.pi # 3
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

The Svg description of a triangle is equivalent to `forSvg` of `asPolygon`:

```
>>> let t = Triangle([0 0; 1 0; 0 1]);
>>> let p = t.asPolygon;
>>> t.forSvg(precision: 0)
p.forSvg(precision: 0)
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

* * *

See also: Circle, equilateralTriangle, Line, Polygon, Rectangle, Simplex

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Triangle.html)
[2](https://reference.wolfram.com/language/ref/Triangle.html),
_W_
[1](https://en.wikipedia.org/wiki/Triangle)

Categories: Geometry
