# asPerspectiveDrawing

- _asPerspectiveDrawing(x, f:/1)_

Answer a `LineDrawing` of the object _x_ given the projection function _f_,
which may be elided.

At `Polyhedron`, draw the _xy_ projection of the unit cube,
which is a square:

~~~spl svg=A
[0 0 0]
.unitCube
.asPerspectiveDrawing { :each |
	let [x, y, z] = each;
	[x y]
}
~~~

![](sw/spl/Help/Image/asPerspectiveDrawing-A.svg)

The unary form provides a projection function:

~~~spl svg=B
[0 0 0].unitCube.asPerspectiveDrawing
~~~

![](sw/spl/Help/Image/asPerspectiveDrawing-B.svg)

* * *

See also: asLineDrawing, CrystalStructure, LineDrawing, Polyhedron

Guides: Drawing Functions, Image Functions

Categories: Converting
