# trapezoid

- _trapezoid(a, α, b, β)_

Answer a `Polygon` representing a trapezoid with parallel sides of lengths _a_ and _b_,
and base angles α and β.

Area and vertex coordinates of a trapezoid:

```
>>> let alpha = 60.degree;
>>> let beta = 30.degree;
>>> let p = trapezoid(2, alpha, 6, beta);
>>> (p.area, p.vertexCoordinates)
(
	4 * 3.sqrt,
	[0 0; 1 3.sqrt; 3 3.sqrt; 6 0]
)
```

Plot:

~~~spl svg=A
[
	trapezoid(2, 60.degree, 6, 30.degree),
	Rectangle([0 0], [6 6])
].LineDrawing
~~~

![](sw/spl/Help/Image/trapezoid-A.svg)

A trapezoid where _a=0_ represents a triangle:

~~~spl svg=B
[
	trapezoid(0, 45.degree, 8, 30.degree),
	Rectangle([0 0], [8 8])
].LineDrawing
~~~

![](sw/spl/Help/Image/trapezoid-B.svg)

A taller trapezoid:

~~~spl svg=C
let alpha = (90 - 2.5).degree;
let beta = (90 - 7.5).degree;
[
	trapezoid(7, alpha, 8, beta),
	Rectangle([0 0], [8 8])
].LineDrawing
~~~

![](sw/spl/Help/Image/trapezoid-C.svg)

* * *

See also: Polygon

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Trapezoid.html),
_W_
[1](https://en.wikipedia.org/wiki/Trapezoid)

Categories: Geometry
