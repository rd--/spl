# PerspectiveDrawing

- _PerspectiveDrawing(x, f/1)_

Answer a `PerspectiveDrawing` of the object _x_ given the projection function _f_,
which may be elided.

At `Polyhedron`, draw the _xy_ projection of the unit cube,
which is a square:

~~~spl svg=A
[0 0 0]
.unitCube
.PerspectiveDrawing { :each |
	let [x, y, z] = each;
	[x y]
}
~~~

![](Help/Image/PerspectiveDrawing-A.svg)

The unary form provides a projection function:

~~~spl svg=B
[0 0 0].unitCube.PerspectiveDrawing
~~~

![](Help/Image/PerspectiveDrawing-B.svg)

* * *

See also: CrystalStructure, LineDrawing, Polyhedron

Guides: Drawing Functions, Image Functions

Categories: Converting
