# polygonalHexagonalGrid

- _polygonalHexagonalGrid(c)_

Construct a hexagonal grid that covers the polygon given by the vertex coordinates _c_.

A square hexagonal grid:

~~~spl svg=A
let c = [-5 -5; 5 -5; 5 5; -5 5];
[
	Polygon(c),
	c.polygonalHexagonalGrid
].LineDrawing
~~~

![](sw/spl/Help/Image/polygonalHexagonalGrid-A.svg)

A triangular hexagonal grid:

~~~spl svg=B
let c = [0 0; 10 0; 10 10];
[
	c.Polygon
	c.polygonalHexgonalGrid
].LineDrawing
~~~

![](sw/spl/Help/Image/polygonalHexagonalGrid-B.svg)

* * *

See also: rectangularHexagonalGrid

Guides: Coordinate System Functions
