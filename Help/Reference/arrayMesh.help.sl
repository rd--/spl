# arrayMesh

- _arrayMesh(a)_

Answer a `PolygonMesh` given an array _a_.
Each cell in the mesh represents a nonzero value of _a_.

A nine-cell polyomino:

~~~spl svg=A
[
	1 1 0 1;
	1 1 1 1;
	0 1 0 1
].arrayMesh
~~~

![](sw/spl/Help/Image/arrayMesh-A.svg)

A seven-cell polyomino specified as a table:

~~~spl svg=B
{ :y :x |
	((x - y).abs < 2).boole
}.table(1:3, 1:3).arrayMesh
~~~

![](sw/spl/Help/Image/arrayMesh-B.svg)

An eight-cell polyomino with a hole:

~~~spl svg=C
[
	1 0 0;
	1 1 0;
	1 0 1;
	1 1 1
].arrayMesh
~~~

![](sw/spl/Help/Image/arrayMesh-C.svg)

A disconnected sparse five-cell mesh:

~~~spl svg=D
[1 5; 1 13; 5 7; 9 1; 9 9]
.collect { :c |
	c -> 1
}.SparseArray.normal.arrayMesh
~~~

![](sw/spl/Help/Image/arrayMesh-D.svg)

A mesh of an elementary cellular automaton:

~~~spl svg=E
57.elementaryCellularAutomaton(
	[1].centerArray(11, 0),
	13
).arrayMesh
~~~

![](sw/spl/Help/Image/arrayMesh-E.svg)

A chessboard:

~~~spl svg=F
{ :i :j |
	(i % 2) != (j % 2)
}.table(1:8, 1:8).boole
.arrayMesh
~~~

![](sw/spl/Help/Image/arrayMesh-F.svg)

* * *

See also: PolygonMesh

Guides: Geometry Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ArrayMesh.html)
