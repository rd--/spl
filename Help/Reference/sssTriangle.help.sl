# sssTriangle

- _sssTriangle(a, b, c)_

Answer a `Triangle` with sides of lengths _a_, _b_, and _c_.
Vertices are placed so that _A_ is at the origin, _B_ is on the positive _x_ axis, and _C_ in the half-plane _y > 0_.

`coordinates`, `area` and `centroid` and `interiorAngles` of a _3,4,5_ triangle:

```
>>> let t = sssTriangle(3, 4, 5);
>>> (
>>> 	t.vertexCoordinates,
>>> 	t.area,
>>> 	t.centroid,
>>> 	t.interiorAngles
>>> )
(
	[
		0 0;
		5 0;
		16/5 12/5
	],
	6,
	[
		41/15
		4/5
	],
	[
		(4 / 5).arcCos,
		(3 / 5).arcCos,
		pi / 2
	]
)
```

Another right triangle:

```
>>> sssTriangle(1, 1.goldenRatio.sqrt, 1.goldenRatio)
>>> .interiorAngles
>>> .third
0.5.pi

>>> (1, 1.goldenRatio.sqrt, 1.goldenRatio) * 3
(3, 3.8161, 4.8541)
```

Varying one side length:

~~~spl svg=A
(5.1, 5.25 .. 5.9).collect { :c |
	sssTriangle(3, 4, c)
}.LineDrawing
~~~

![](sw/spl/Help/Image/sssTriangle-A.svg)

The _3,4,5_ triangle is the only right triangle with sides in an arithmetic series:

~~~spl svg=B
sssTriangle(3, 4, 5).asLineDrawing
~~~

![](sw/spl/Help/Image/sssTriangle-B.svg)

The _1,√φ,φ_ triangle is the only right triangle with sides in a geometric series:

~~~spl svg=C
sssTriangle(1, 1.goldenRatio.sqrt, 1.goldenRatio)
.asLineDrawing
~~~

![](sw/spl/Help/Image/sssTriangle-C.svg)

* * *

See also: asaTriangle, sasTriangle, Triangle

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SSSTriangle.html)
