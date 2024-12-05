# Polyhedron

- _Polyhedron(vertexList, faceList)_

A polyhedron:

~~~
let p = Polyhedron(
	[
		+0.0 +0.0 +0.6;
		-0.3 -0.5 -0.2;
		-0.3 +0.5 -0.2;
		+0.6 +0.0 -0.2
	],
	[
		2 3 4;
		3 2 1;
		4 1 2;
		1 4 3
	]
);
(p.vertices.size, p.faces.size)
~~~

* * *

See also: Polygon

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Polyhedron.html)
[2](https://reference.wolfram.com/language/ref/Polyhedron.html)
