# cyclicQuadrilateral

- _cyclicQuadrilateral([θ₁ θ₂ θ₃ θ₄], o=[0 0], r=1, θ₀=0)_

Answer a `Polygon` representing a cyclic quadrilateral on the circle at origin _o_ with radius _r_ and angles _θ₁…_ offset by _θ₀_.

A symmetric cyclic quadrilateral:

~~~spl svg=A
[
	[0 0.25 0.75 1].pi
	.cyclicQuadrilateral([0 0], 1, 0),
	Circle([0 0], 1)
].LineDrawing
~~~

![](Help/Image/cyclicQuadrilateral-A.svg)

A rotated cyclic quadrilateral:

~~~spl svg=B
[
	[0 0.25 0.75 1.25].pi
	.cyclicQuadrilateral([0 0], 1, 1/2.pi),
	Circle([0 0], 1)
].LineDrawing
~~~

![](Help/Image/cyclicQuadrilateral-B.svg)

Three random cyclic quadrilaterals:

~~~spl svg=C
let r = Sfc32(371841);
[
	r.randomReal([0 2.pi], [3 4])
	.collect { :t |
		t.sort
		.cyclicQuadrilateral([0 0], 1, 0)
	},
	Circle([0 0], 1)
].LineDrawing
~~~

![](Help/Image/cyclicQuadrilateral-C.svg)

* * *

See also: circlePoints, cyclicPolygon, Polygon

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CyclicQuadrilateral.html),
_W_
[1](https://en.wikipedia.org/wiki/Cyclic_quadrilateral)
