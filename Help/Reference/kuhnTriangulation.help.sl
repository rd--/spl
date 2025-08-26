# kuhnTriangulation

- _kuhnTriangulation(n)_

Answer the Kuhn triangulation,
also called the Coxeter-Freudenthal-Kuhn triangulation,
of the _n_-dimensional unit square.

In two dimensions divides a square into two triangles:

~~~spl svg=A
2.kuhnTriangulation
.collect(Triangle:/1)
.LineDrawing
~~~

![](sw/spl/Help/Image/kuhnTriangulation-A.svg)

In three dimensions divides a cube into six tetrahedra:

~~~spl svg=B
let k = 3.kuhnTriangulation;
[1 .. 6].collect { :i |
	Tetrahedron(k[i]).translate(
		[
			i % 2 * 2,
			i % 2 + i * 0.75,
			0
		]
	)
}.PerspectiveDrawing
~~~

![](sw/spl/Help/Image/kuhnTriangulation-B.svg)

* * *

See also: permutations, Tetrahedron, Triangle

Further Reading: Coxeter 1932, Kuhn 1960, Moore 1992
