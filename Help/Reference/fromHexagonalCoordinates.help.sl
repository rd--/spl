# fromHexagonalCoordinates

- _fromHexagonalCoordinates([q, r, s])_

Convert from a triple _(q,r,s)_ in the cubical hexagonal coordinate system,
to a duple _(x,y)_ in the Cartesian coordinate system.

Draw a 4×4 segment of a hexagonal grid,
eliding the _s_ coordinate which can be inferred:

~~~spl svg=A
let p = [
	0 0; 1 0; 2 0; 3 0;
	0 1; 1 1; 2 1; 3 1;
	-1 2; 0 2; 1 2; 2 2;
	-1 3; 0 3; 1 3; 2 3
].collect(fromHexagonalCoordinates:/1);
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
