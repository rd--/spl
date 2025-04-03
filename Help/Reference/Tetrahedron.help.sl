# Tetrahedron

- _Tetrahedron([a b c d])_

A `Type` representing a tetrahedron with corners _a_, _b_, _c_ and _d_.

Draw a standard tetrahedron:

~~~spl svg=A
Tetrahedron(
	[0 0 0; 1 0 0; 0 1 0; 0 0 1]
).asPerspectiveDrawing
~~~

![](sw/spl/Help/Image/Tetrahedron-A.svg)

Draw a Kuhn tetrahedron:

~~~spl svg=B
Tetrahedron(
	[0 0 0; 1 0 0; 1 1 0; 1 1 1]
).asPerspectiveDrawing
~~~

![](sw/spl/Help/Image/Tetrahedron-B.svg)

* * *

See also: kuhnTriangulation, Polyhedron, Simplex, Triangle, unitTetrahedron

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Tetrahedron.html)
[2](https://mathworld.wolfram.com/RegularTetrahedron.html)
[3](https://reference.wolfram.com/language/ref/Tetrahedron.html),
_W_
[1](https://en.wikipedia.org/wiki/Tetrahedron)
