# PolygonWithHoles

- _PolygonWithHoles(o, i)_

A `Type` representing an outer polygon with vertex coordinates given by _o_,
and a list of inner polygons given by _i_.
The outer polygon vertices should be specified in counter-clockwise order,
the inner polygon vertices should be specified in clockwise order.

Draw a polygon with one hole:

~~~spl svg=A
let o = [0 0; 5 0; 2.5 4];
let i = [2 1; 2 2; 3 2; 3 1];
PolygonWithHoles(o, [i])
~~~

![](sw/spl/Help/Image/PolygonWithHoles-A.svg)

Retrieve the outer and inner polygons:

```
>>> let o = [0 0; 5 0; 2.5 4];
>>> let i = [2 1; 2 2; 3 2; 3 1];
>>> let p = PolygonWithHoles(o, [i]);
>>> (p.outerPolygon, p.innerPolygons)
(
	Polygon(o),
	[Polygon(i)]
)
```

Get the `area` of a polygon with holes:

```
>>> let o = [0 0; 5 0; 2.5 4];
>>> let i = [2 1; 2 2; 3 2; 3 1];
>>> (
>>> 	PolygonWithHoles(o, [i]).area,
>>> 	Polygon(o).area,
>>> 	Polygon(i).signedArea
>>> )
(9, 10, -1)
```

* * *

See also: area, innerPolygons, outerPolygon, Polygon

Guides: Geometry Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Polygon.html),
_W_
[1](https://en.wikipedia.org/wiki/Polygon_with_holes)

Categories: Geometry
