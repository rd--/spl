# fromHexagonalCoordinates

- _fromHexagonalCoordinates([q, r, s=0-q-r], θ=0)_

Convert from a triple _(q,r,s)_ in the cubical hexagonal coordinate system,
to a duple _(x,y)_ in the Cartesian coordinate system.
The _s_ coordinate is constrained such that _s=0-q-r_,
and may be elided.

Given _θ=0_,
and the standard basis vectors,
the _q_-axis is is aligned with the _x_-axis:

```
>>> [1 0].fromHexagonalCoordinates(0)
[3.sqrt 0]

>>> [-3 .. 3].collect { :q |
>>> 	[q 0].fromHexagonalCoordinates
>>> }.rounded
[-5 0; -3 0; -2 0; 0 0; 2 0; 3 0; 5 0]

>>> [-5 0; -3 0; -2 0; 0 0; 2 0; 3 0; 5 0]
>>> .toHexagonalCoordinates.rounded
[
	-3 0 3;
	-2 0 2;
	-1 0 1;
	0 0 0;
	1 0 -1;
	2 0 -2;
	3 0 -3
]
```

Given _θ=0_,
and the standard basis vectors,
the _r_-axis increments along the _x_ and _y_ axes with a slope of _√3÷3_,
it is the rotation by 60° counter-clockwise of the _q_ axis:

```
>>> [0 1].fromHexagonalCoordinates(0)
[3.sqrt 60.degree].fromPolarCoordinates

>>> [-3 .. 3].collect { :r |
>>> 	[0 r].fromHexagonalCoordinates
>>> }.rounded
[-3 -4; -2 -3; -1 -1; 0 0; 1 1; 2 3; 3 4]

>>> [-3 -4; -2 -3; -1 -1; 0 0; 1 1; 2 3; 3 4]
>>> .toHexagonalCoordinates.rounded
[
	0 -3 3;
	0 -2 2;
	0 -1 1;
	0 0 0;
	0 1 -1;
	0 2 -2;
	0 3 -3
]
```

At _θ=-30°_:

```
>>> [0 1].fromHexagonalCoordinates(
>>> 	-30.degree
>>> )
[3 / 2, 3.sqrt / 2]

>>> [1 0].fromHexagonalCoordinates(
>>> 	-30.degree
>>> )
[3 / 2, 3.sqrt.- / 2]
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
].fromHexagonalCoordinates(0);
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
	let c = [q, r]
	.fromHexagonalCoordinates;
	6.regularPolygon(c, 0.9, 0.5.pi)
}.table(1:5, 1:5).LineDrawing
~~~

![](sw/spl/Help/Image/fromHexagonalCoordinates-C.svg)

Generate a 5×5 hexagonal grid,
without adjusting _q_ by _r_,
with _θ=-30°_,
meaning that the _x_-axis is rotated by 30° clockwise,
and the hexagonal shape is also rotated:

~~~spl svg=D
let theta = -30.degree;
{ :r :q |
	let c = [q, r]
	.fromHexagonalCoordinates;
	6.regularPolygon(c, 0.9, 1.pi)
}.table(1:5, 1:5).LineDrawing
~~~

![](sw/spl/Help/Image/fromHexagonalCoordinates-D.svg)

* * *

See also: HexagonalCoordinates, polygonalHexgonalGrid, toHexagonalCoordinates

Guides: Coordinate System Functions
