# Cuboid

- _Cuboid(min, max)_

A unit cuboid:

~~~spl svg=A
Cuboid([0 0 0], [1 1 1])
.asPerspectiveDrawing
~~~

![](sw/spl/Help/Image/Cuboid-A.svg)

Cuboids with different sizes:

~~~spl svg=B
[
	Cuboid([0 0 0], [1 3 1]),
	Cuboid([2 1 1], [4 2 3])
].PerspectiveDrawing
~~~

![](sw/spl/Help/Image/Cuboid-B.svg)

* * *

See also: Polyhedron, unitCube
