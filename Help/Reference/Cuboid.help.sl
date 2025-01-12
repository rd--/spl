# Cuboid

- _Cuboid(min, max)_

Answer a `Polyhedron` of an axis-aligned cuboid with lower corner _min_ and upper corner _max_.

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

The same geometry with indicated projection:

~~~spl svg=C
[
	Cuboid([0 0 0], [1 3 1]),
	Cuboid([2 1 1], [4 2 3])
].PerspectiveDrawing(
	projection: [
		-1/6.pi 1;
		1/4.pi 1;
		1/2.pi 1
	].asAxonometricProjection,
	height: 100
)
~~~

![](sw/spl/Help/Image/Cuboid-C.svg)

Random cuboid collection:

~~~spl svg=D
let rng = Sfc32(397371);
let c = {
	let p = rng.randomReal(0, 7, [3]);
	Cuboid(p, p + 1)
} ! 13;
c.PerspectiveDrawing
~~~

![](sw/spl/Help/Image/Cuboid-D.svg)

* * *

See also: Polyhedron, unitCube

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Cuboid.html)
