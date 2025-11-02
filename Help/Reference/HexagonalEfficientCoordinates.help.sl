# HexagonalEfficientCoordinates

- _HexagonalEfficientCoordinates([a, r, c])_

A `Type` representing a point in _(a, r, c)_ in the Hexagonal Efficient coordinate system.

The six nearest neighbours of the _(0, 0, 0)_ cell,
in counter-clockwise order,
beginning with cell one column to the right:

```
>>> HexagonalEfficientCoordinates([0 0 0])
>>> .nearestNeighbours
>>> .collect(coordinates:/1)
[
	0  0  1;
	1 -1  0;
	1 -1 -1;
	0  0 -1;
	1  0 -1;
	1  0  0
]
```

Draw the six nearest neighbours of the _(0, 0, 0)_ cell:

~~~spl svg=A
HexagonalEfficientCoordinates([0 0 0])
.nearestNeighbours
.collect { :p |
	let c = p.asCartesianCoordinates.coordinates;
	let r = 3.sqrt / 3 * 0.9;
	6.regularPolygon(c, r, 0.5.pi)
}.LineDrawing
~~~

![](sw/spl/Help/Image/HexagonalEfficientCoordinates-A.svg)

* * *

See also: CartesianCoordinates, fromHexagonalEfficientCoordinates

Guides: Coordinate System Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Hexagonal_Efficient_Coordinate_System)

Further Reading: Rummelt 2011
