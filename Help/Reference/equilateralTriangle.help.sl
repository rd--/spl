# equilateralTriangle

- _equilateralTriangle(center, radius, initialAngle)_

Answer an equilateral `Triangle`,
a triangle with all three sides of equal length,
and with all three angles equal.

~~~spl svg=A
[0 0].equilateralTriangle(1, 1/4.pi)
~~~

![](sw/spl/Help/Image/equilateralTriangle-A.svg)

Draw triangle vortex:

~~~spl svg=B
let r = 100;
let a = 0;
let l = [];
7.timesRepeat {
	l.add(
		[0 0].equilateralTriangle(r, a)
	);
	r := r / 3.sqrt;
	a := a + 0.5.pi
};
l.LineDrawing
~~~

![](sw/spl/Help/Image/equilateralTriangle-B.svg)

Draw iterated triangles, scaling radius and shifting angle:

~~~spl svg=C
let r = 100;
let a = 0;
let l = [];
40.timesRepeat {
	l.add(
		[0 0].equilateralTriangle(r, a)
	);
	r := r * 0.965;
	a := a + 0.02
};
l.LineDrawing
~~~

![](sw/spl/Help/Image/equilateralTriangle-C.svg)

An equilateral triangle is equivalent to a regular polygon:

~~~spl svg=D
3.regularPolygon([0 0], 1, 1/4.pi)
~~~

![](sw/spl/Help/Image/equilateralTriangle-D.svg)

* * *

See also: regularPolygon, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EquilateralTriangle.html),
_W_
[1](https://en.wikipedia.org/wiki/Equilateral_triangle)
