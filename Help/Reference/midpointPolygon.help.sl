# midpointPolygon

- _midpointPolygon([v₁ v₂ v₃ ...])_

Answer the midpoint polygon of a polygon,
which is a derived polygon whose vertices are the midpoints of the edges of a polygon.
Also called the Kasner polygon or inscribed polygon.

Ratios of area of inscribed regular polygons:

```
>>> 3:7.collect { :n |
>>> 	let p = n.regularPolygon;
>>> 	p.area / p.midpointPolygon.area
>>> }
[4 2 1.5278 1.3333 1.2319]
```

At `Rectangle`, here a square:

~~~spl svg=A
let r = [0 0].unitSquare;
[
	r,
	r.midpointPolygon
].LineDrawing
~~~

![](Help/Image/midpointPolygon-A.svg)

At `Polygon`, here a regular hexagon:

~~~spl svg=B
let h = 6.regularPolygon([0 0], 1, 0);
[
	h,
	h.midpointPolygon
].LineDrawing
~~~

![](Help/Image/midpointPolygon-B.svg)

At `Triangle`, also called the medial triangle:

~~~spl svg=C
let t = Triangle[0 0; 1 0; 0 1];
[
	t,
	t.midpointPolygon
].LineDrawing
~~~

![](Help/Image/midpointPolygon-C.svg)

Iteratively at `Polygon`, here a regular hexagon:

~~~spl svg=D
midpointPolygon/1.nestList(
	6.regularPolygon([0 0], 1, 0),
	6
).LineDrawing
~~~

![](Help/Image/midpointPolygon-D.svg)

* * *

See also: medialTriangle, midpoint

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MidpointPolygon.html),
_W_
[1](https://en.wikipedia.org/wiki/Midpoint_polygon)
