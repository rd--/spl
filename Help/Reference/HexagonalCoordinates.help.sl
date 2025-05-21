# HexagonalCoordinates

- _HexagonalCoordinates([q, r, s])_

A `Type` representing cubical hexagonal coordinates.
_q_ is the _row_ axis,
_r_ is the axis at 60° counter-clockwise to _q_,
_s_ is the axis at 120° to _q_ (and 60° to _r_).
The coordinates have the invariant that they sum to `zero`,
allowing the _s_ coordinate to be elided.

```
>>> HexagonalCoordinates([1 3]).coordinates
[1 3 -4]
```

Calculate Manhattan and Euclidean distances:

```
>>> let a = HexagonalCoordinates([0 0]);
>>> let b = HexagonalCoordinates([3 7]);
>>> (
>>> 	a.manhattanDistance(b),
>>> 	a.euclideanDistance(b)
>>> )
(10, 8.888)
```

The six nearest neighbours of the _(0,0,0)_ cell,
in counter-clockwise order,
beginning with the cell one column to the right:

```
>>> HexagonalCoordinates([0 0 0])
>>> .nearestNeighbours
>>> .collect(coordinates:/1)
[
	+1  0 -1;
	+1 -1  0;
	 0 -1 +1;
	-1  0 +1;
	-1 +1  0;
	 0 +1 -1
]
```

Draw the six nearest neighbours of the _(0, 0, 0)_ cell:

~~~spl svg=A
HexagonalCoordinates([0 0 0])
.nearestNeighbours
.collect { :p |
	let c = p.asCartesianCoordinates.asList;
	let r = 0.9;
	6.regularPolygon(c, r, 0.5.pi)
}.LineDrawing
~~~

![](sw/spl/Help/Image/HexagonalCoordinates-A.svg)

Draw the six diagonal neighbours of the _(0,0,0)_ cell,
in counter-clockwise order,
beginning with the least clockwise diagonal neighbour:

~~~spl svg=B
HexagonalCoordinates([0 0 0])
.diagonalNeighbours
.collect { :p |
	let c = p.asCartesianCoordinates.asList;
	let r = 0.9;
	6.regularPolygon(c, r, 0.5.pi)
}.LineDrawing
~~~

![](sw/spl/Help/Image/HexagonalCoordinates-B.svg)

* * *

See also: CartesianCoordinates, fromHexagonalCoordinates, toHexagonalCoordinates

Guides: Coordinate System Functions

References:
_A.Patel_
[1](https://www.redblobgames.com/grids/hexagons/)
