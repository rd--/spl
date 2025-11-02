# Parallelepiped

- _Parallelepiped(p, [v₁ v₂ v₃])_

A `Type` representing a parallelepiped with origin _p_ and directions _v_

```
>>> let p = Parallelepiped(
>>> 	[0 0 0],
>>> 	[1 0 0; 1 1 0; 0 1 1]
>>> );
>>> (
>>> 	p.vertexCoordinates,
>>> 	p.faceIndices.size,
>>> 	p.volume
>>> )
(
	[
		0 0 0;
		1 0 0;
		2 1 0;
		1 1 0;
		1 1 1;
		0 1 1;
		1 2 1;
		2 2 1
	],
	6,
	1
)
```

Draw parallelepiped:

~~~spl svg=A
Parallelepiped(
	[0 0 0],
	[
		2 0 0;
		2 3 0;
		0 3 1
	]
).asPolyhedron
~~~

![](sw/spl/Help/Image/Parallelepiped-A.svg)

A cube:

~~~spl svg=B
Parallelepiped(
	[0 0 0],
	[
		1 0 0;
		0 1 0;
		0 0 1
	]
).asPolyhedron
~~~

![](sw/spl/Help/Image/Parallelepiped-B.svg)

A parallelepiped can tile space:

~~~spl svg=C
{ :i :j :k |
	let v = [1 0 0; 1 1 0; 0 1 0.5];
	let o = (v * [i j k]).sum;
	Parallelepiped(o, v)
}.table(1:3, 1:2, 1:3)
.GeometryCollection
~~~

![](sw/spl/Help/Image/Parallelepiped-C.svg)

* * *

See also: Cuboid, Polyhedron

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Parallelepiped.html)
[2](https://reference.wolfram.com/language/ref/Parallelepiped.html),
_W_
[1](https://en.wikipedia.org/wiki/Parallelepiped)
