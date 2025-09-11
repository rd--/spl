# sasTriangle

- _sasTriangle(a, γ, b)_

Answer a `Triangle` with sides of lengths _a_ and _b_ and angle _γ_ between them.
Vertices are placed so that _A_ is at the origin, _B_ is on the positive _x_ axis, and _C_ in the half-plane _y > 0_.

`coordinates`, `area`, `centroid` and `interiorAngles` of a _1, 1/2.pi, 2_ triangle:

```
>>> let t = sasTriangle(1, 1/2.pi, 2);
>>> (
>>> 	t.vertexCoordinates,
>>> 	t.area,
>>> 	t.centroid,
>>> 	t.interiorAngles
>>> )
(
	[
		[0, 0],
		[5.sqrt, 0],
		[4 / 5.sqrt, 2 / 5.sqrt]
	],
	1,
	[
		3 / 5.sqrt,
		2 / (3 * 5.sqrt)
	],
	[
		(2 / 5.sqrt).arcCos,
		(1 / 5.sqrt).arcCos,
		1/2.pi
	]
)
```

Varying one angle:

~~~spl svg=A
(0.1.pi -- 0.5.pi)
.subdivide(12)
.collect { :alpha |
	sasTriangle(1, alpha, 1)
}.LineDrawing
~~~

![](sw/spl/Help/Image/sasTriangle-A.svg)

The indicated angle is γ,
which is opposite to the side with length _c_:

~~~spl svg=B
let a = 1;
let b = 4/3.sqrt;
let t = sasTriangle(a, 30.degree, b);
let [_, _, c] = t.sideLengths;
[
	t,
	[0 0; c 0; c a].PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/sasTriangle-B.svg)

* * *

See also: asaTriangle, sssTriangle, Triangle

Guides: Geometry Functions, Triangle Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SASTriangle.html)
