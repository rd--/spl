# rectangularHexagonalGrid

- _rectangularHexagonalGrid([c₁, c₂])_

Construct a hexagonal grid that covers the rectangle given by the lower left and upper right vertex coordinates _c₁_ and _c₂_.

A square hexagonal grid:

~~~spl svg=A
let c = [-5 -5; 5 5];
[
	c.asRectangle,
	c.rectangularHexagonalGrid
].LineDrawing
~~~

![](sw/spl/Help/Image/rectangularHexagonalGrid-A.svg)

A rectangular hexagonal grid:

~~~spl svg=B
let c = [-3 -3; 2 9];
[
	c.asRectangle,
	c.rectangularHexagonalGrid
].LineDrawing
~~~

![](sw/spl/Help/Image/rectangularHexagonalGrid-B.svg)

* * *

See also: polygonalHexagonalGrid

Guides: Coordinate System Functions
