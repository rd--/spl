# midpointTriangles

- _midpointTriangles([v₁ v₂ v₃ ...])_

Answer the _n_ midpoint triangles of an _n_-polygon.
The midpoint triangles are formed from each polygon vertext _v_ and the two adjacent midpoint vertices.

Scaled midpoint triangles of a five-regular polygon:

~~~spl svg=A
5.regularPolygon
.midpointTriangles
.collect { :t |
	t.scale(0.75)
}.LineDrawing
~~~

![](Help/Image/midpointTriangles-A.svg)

Midpoint polygon and every other midpoint triangle of a six-regular polygon:

~~~spl svg=B
let p = 6.regularPolygon;
let m = p.midpointPolygon;
let t = p.midpointTriangles;
[
	m,
	t[1, 3, 5]
].LineDrawing
~~~

![](Help/Image/midpointTriangles-B.svg)

The last midpoint triangle of succesive midpoint polygons of a six-regular polygon,
this is Smithsons’ _Gyrostasis_ drawing (1968):

~~~spl svg=C
let p = 6.regularPolygon;
midpointPolygon/1
.nestList(p, 7)
.collect { :x |
	x.midpointTriangles.last
}.LineDrawing
~~~

![](Help/Image/midpointTriangles-C.svg)

* * *

See also: midpoint, midpointPolygon

Guides: Geometry Functions
