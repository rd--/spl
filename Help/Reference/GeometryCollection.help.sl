# GeometryCollection

- _GeometryCollection(aList)_

A `Type` that holds a set of geometries.

Draw a collection of objects with an `embeddingDimension` of two:

~~~spl svg=A
[
	Circle([0 0], 1),
	Line([0 0; 0 -1]),
	Point([0, 1 / 2]),
	PointCloud([-0.5 -0.5; 0.5 -0.5]),
	Rectangle([-1 -1], [1 1]),
	regularPolygon(6, [0 0], 0.5, 0),
	Triangle([-1 -0.75], [0 1], [1 -0.75])
].GeometryCollection.asLineDrawing
~~~

![](sw/spl/Help/Image/GeometryCollection-A.svg)

* * *

See also: Circle, Line, Point, PointCloud, Polygon, Rectangle, Triangle

Guides: Geometry Functions
