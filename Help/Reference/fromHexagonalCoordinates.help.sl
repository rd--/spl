# fromHexagonalCoordinates

- _fromHexagonalCoordinates([q, r, s=0-q-r])_

Convert from a triple _(q,r,s)_ in the cubical hexagonal coordinate system,
to a duple _(x,y)_ in the Cartesian coordinate system.
The _s_ coordinate is constrained such that _s=0-q-r_,
and may be elided.

Given the standard basis vectors,
the _q_-axis is aligned with the _x_-axis,
or is the _row_ axis:

```
>>> [1 0].fromHexagonalCoordinates
[3.sqrt 0]

>>> [-3 .. 3].collect { :q |
>>> 	[q 0].fromHexagonalCoordinates
>>> }.rounded
[-5 0; -3 0; -2 0; 0 0; 2 0; 3 0; 5 0]

>>> [-5 0; -3 0; -2 0; 0 0; 2 0; 3 0; 5 0]
>>> .toHexagonalCoordinates.rounded
[-3 0 3; -2 0 2; -1 0 1; 0 0 0; 1 0 -1; 2 0 -2; 3 0 -3]
```

Given the standard basis vectors,
the _r_-axis increments along the _x_ and _y_ axes with a slope of _√3÷3_,
it is the rotation by 60° counter-clockwise of the _q_ axis:

```
>>> [0 1].fromHexagonalCoordinates
[3.sqrt / 2, 3 / 2]

>>> [-3 .. 3].collect { :r |
>>> 	[0 r].fromHexagonalCoordinates
>>> }.rounded
[-3 -4; -2 -3; -1 -1; 0 0; 1 2; 2 3; 3 5]

>>> [-3 -4; -2 -3; -1 -1; 0 0; 1 2; 2 3; 3 5]
>>> .toHexagonalCoordinates.rounded
[0 -3 3; 0 -2 2; 0 -1 1; 0 0 0; 0 1 -1; 0 2 -2; 0 3 -3]
```

Draw a 4×4 segment of a hexagonal grid,
eliding the _s_ coordinate which can be inferred,
threads over lists:

~~~spl svg=A
let p = [
	0 0; 1 0; 2 0; 3 0;
	0 1; 1 1; 2 1; 3 1;
	-1 2; 0 2; 1 2; 2 2;
	-1 3; 0 3; 1 3; 2 3
].fromHexagonalCoordinates;
let h = p.collect { :c |
	6.regularPolygon(c, 0.9, 0.5.pi)
};
[
	p.PointCloud,
	h
].LineDrawing
~~~

![](sw/spl/Help/Image/fromHexagonalCoordinates-A.svg)

Generate a 6×9 hexagonal grid,
eliding the _s_ coordinate which can be inferred:

~~~spl svg=B
{ :r :q |
	let h = [q - (r // 2), r];
	let c = h.fromHexagonalCoordinates;
	6.regularPolygon(c, 0.9, 0.5.pi)
}.table(1:6, 1:9).LineDrawing
~~~

![](sw/spl/Help/Image/fromHexagonalCoordinates-B.svg)

Generate a 5×5 hexagonal grid,
without adjusting _q_ by _r_:

~~~spl svg=C
{ :r :q |
	let c = [q, r].fromHexagonalCoordinates;
	6.regularPolygon(c, 0.9, 0.5.pi)
}.table(1:5, 1:5).LineDrawing
~~~

![](sw/spl/Help/Image/fromHexagonalCoordinates-C.svg)

* * *

See also: HexagonalCoordinates, polygonalHexgonalGrid, toHexagonalCoordinates

Guides: Coordinate System Functions
