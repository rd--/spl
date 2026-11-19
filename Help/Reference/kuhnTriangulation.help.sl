# kuhnTriangulation

- _kuhnTriangulation(n)_

Answer the Kuhn triangulation,
also called the Coxeter-Freudenthal-Kuhn triangulation,
of the _n_-dimensional unit square.

In two dimensions divides a square into two triangles:

~~~spl svg=A
2L.kuhnTriangulation
.collect(Triangle/1)
~~~

![](Help/Image/kuhnTriangulation-A.svg)

In three dimensions divides a cube into six tetrahedra:

~~~spl svg=B
let k = 3L.kuhnTriangulation;
[1L .. 6L].collect { :i |
	Tetrahedron(k[i]).translate(
		[
			i % 2.0 * 2.0,
			i % 2.0 + i * 0.75,
			0.0
		]
	)
}
~~~

![](Help/Image/kuhnTriangulation-B.svg)

* * *

See also: Tetrahedron, Triangle, permutations

Guides: Geometry Functions

Further Reading: Coxeter 1932, Kuhn 1960, Moore 1992
