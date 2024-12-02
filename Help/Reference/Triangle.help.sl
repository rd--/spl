# Triangle

- _Triangle(p1, p2, p3)_

A `Type` representing a filled triangle with corner points _p1_, _p2_, and _p3_.

Find the area, centroid and arc length and interior angles of a `Triangle`:

```
>>> let t = Triangle([0 0], [1 0], [0 1]);
>>> (
>>> 	t.area,
>>> 	t.centroid,
>>> 	t.arcLength,
>>> 	t.interiorAngles
>>> )
(
	1/2,
	[1/3 1/3],
	2 + 2.sqrt,
	pi / [2 4 4]
)
```

Area, centroid and arc length of an equilateral triangle:

```
>>> let t = Triangle([0 0], [2 0], [1 3.sqrt]);
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
>>> let t = Triangle([0 0], [1 0], [0 1]);
>>> t.forSvg(1)
t.asPolygon.forSvg(1)
```

* * *

See also: Circle, Line, Polygon, Rectangle

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Triangle.html)

Categories: Geometry
