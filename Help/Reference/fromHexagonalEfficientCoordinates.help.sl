# fromHexagonalEfficientCoordinates

- _fromHexagonalEfficientCoordinates([a, r, c])_

Convert from a triple _(a, r, c)_ in the Hexagonal Efficient coordinate system,
to a duple _(x, y)_ in the Cartesian coordinate system.

Draw a 4×4 segment of a hexagonal grid:

~~~spl svg=A
let p = [
	0 1 1; 0 1 2; 0 1 3; 0 1 4;
	1 1 1; 1 1 2; 1 1 3; 1 1 4;
	0 2 1; 0 2 2; 0 2 3; 0 2 4;
	1 2 1; 1 2 2; 1 2 3; 1 2 4
].collect(fromHexagonalEfficientCoordinates:/1);
let h = p.collect { :c |
	6.regularPolygon(c, 0.5, 0.5.pi)
};
[
	p.PointCloud,
	h
].LineDrawing
~~~

![](sw/spl/Help/Image/fromHexagonalEfficientCoordinates-A.svg)

Use `mixedRadixEncode` to generate an 8×12 hexagonal grid:

~~~spl svg=B
(0 .. 2 * 4 * 12 - 1).collect { :i |
	let p = i.mixedRadixEncode([2 4 12]);
	let c = p.fromHexagonalEfficientCoordinates;
	6.regularPolygon(c, 0.5, 0.5.pi)
}.LineDrawing
~~~

![](sw/spl/Help/Image/fromHexagonalEfficientCoordinates-B.svg)

* * *

See also: fromBarycentricCoordinates, fromCylindricalCoordinates, fromHexagonalCoordinates, fromPolarCoordinates, fromSphericalCoordinates, HexagonalEfficientCoordinates

Guides: Coordinate System Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Hexagonal_Efficient_Coordinate_System)

Further Reading: Rummelt 2011
