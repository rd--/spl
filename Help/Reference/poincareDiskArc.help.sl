# poincareDiskArc

- _poincareDiskArc([θ₁ θ₂])_

Answer an `Arc` on the unit circle, from θ₁ to θ₂, intersecting at right angles.

Draw the unit circle and an equilateral triangle:

~~~spl svg=A
[
	Circle([0 0], 1),
	([0, 2 .. 6] / 3).pi
	.partition(2, 1)
	.collect(poincareDiskArc:/1)
].LineDrawing
~~~

![](sw/spl/Help/Image/poincareDiskArc-A.svg)

Draw the unit circle and a square:

~~~spl svg=B
[
	Circle([0 0], 1),
	([0 .. 4] / 2).pi
	.partition(2, 1)
	.collect(poincareDiskArc:/1)
].LineDrawing
~~~

![](sw/spl/Help/Image/poincareDiskArc-B.svg)

Diameters are lines:

~~~spl svg=C
[
	Circle([0 0], 1),
	[0 1/2; 1/2 3/2; 1 3/2].pi
	.collect(poincareDiskArc:/1)
].LineDrawing
~~~

![](sw/spl/Help/Image/poincareDiskArc-C.svg)

* * *

See also: Arc, Circle

Guides: Geometry Functions
