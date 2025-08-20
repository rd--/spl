# sssTriangle

- _sssTriangle(a, b, c)_
- _sssTriangle([a b c])_

Answer a `Triangle` with sides of lengths _a_, _b_, and _c_.
Vertices are placed so that _A_ is at the origin, _B_ is on the positive _x_ axis, and _C_ in the half-plane _y > 0_.

`coordinates`, `area` and `centroid` and `interiorAngles` of a _3,4,5_ triangle,
the archetypal Pythagorean triangle:

```
>>> let t = [3 4 5].sssTriangle;
>>> (
>>> 	t.vertexCoordinates,
>>> 	t.area,
>>> 	t.centroid,
>>> 	t.interiorAngles,
>>> 	t.circumradius,
>>> 	t.sideLengths
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
		1/2.pi
	],
	5/2,
	[3 4 5]
)
```

Another right triangle,
the Kepler triangle,

```
>>> let phi = 1.goldenRatio;
>>> [phi ^ -1/2, 1, phi ^ 1/2]
>>> .sssTriangle
>>> .interiorAngles
>>> .third
0.5.pi

>>> let phi = 1.goldenRatio;
>>> (1, phi ^ 1/2, phi) * 3
(3, 3.8161, 4.8541)
```

Pythagorean triples with equal area:

```
>>> [
>>> 	20 21 29;
>>> 	12 35 37
>>> 	:;
>>> 	4485 5852 7373;
>>> 	3059 8580 9109;
>>> 	1380 19019 19069
>>> ].atLevelCollect(2) { :each |
>>> 	each.sssTriangle.area
>>> }
[
	210 210;
	13123110 13123110 13123110
]
```

Varying one side length:

~~~spl svg=A
(5.1, 5.25 .. 5.9).collect { :c |
	[3 4 c].sssTriangle
}.LineDrawing
~~~

![](sw/spl/Help/Image/sssTriangle-A.svg)

The _3,4,5_ triangle is the only right triangle with sides in an arithmetic series:

~~~spl svg=B
[3 4 5].sssTriangle
~~~

![](sw/spl/Help/Image/sssTriangle-B.svg)

The _1,√φ,φ_ triangle is the only right triangle with sides in a geometric series:

~~~spl svg=C
let phi = 1.goldenRatio;
[1 phi.sqrt phi].sssTriangle
~~~

![](sw/spl/Help/Image/sssTriangle-C.svg)

Draw pythagorean triples with equal area:

~~~spl svg=D
[21 29 20; 35 37 12]
.collect(sssTriangle:/1)
.LineDrawing
~~~

![](sw/spl/Help/Image/sssTriangle-D.svg)

Draw pythagorean triples with equal area:

~~~spl svg=E
[
	5852 7373 4485;
	8580 9109 3059;
	19019 19069 1380
].collect(sssTriangle:/1)
.LineDrawing
~~~

![](sw/spl/Help/Image/sssTriangle-E.svg)

The supergolden triangle, a reciprocal proportion triangle:

~~~spl svg=F
let x = 1.supergoldenRatio;
let t = sssTriangle(x ^ -1, 1, x);
[
	t,
	t.circumcircle
].LineDrawing
~~~

![](sw/spl/Help/Image/sssTriangle-F.svg)

The Kepler triangle, a reciprocal proportion triangle:

~~~spl svg=G
let x = 1.goldenRatio.sqrt;
let t = sssTriangle(x ^ -1, 1, x);
[
	t,
	t.circumcircle
].LineDrawing
~~~

![](sw/spl/Help/Image/sssTriangle-G.svg)

The plastic triangle, a reciprocal proportion triangle:

~~~spl svg=H
let x = 1.plasticRatio;
let t = sssTriangle(x ^ -1, 1, x);
[
	t,
	t.circumcircle
].LineDrawing
~~~

![](sw/spl/Help/Image/sssTriangle-H.svg)

* * *

See also: asaTriangle, sasTriangle, Triangle

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PythagoreanTriple.html)
[2](https://mathworld.wolfram.com/SupergoldenTriangle.html)
[3](https://mathworld.wolfram.com/KeplerTriangle.html)
[4](https://reference.wolfram.com/language/ref/SSSTriangle.html)
_W_
[1](https://en.wikipedia.org/wiki/Pythagorean_triple)
[2](https://en.wikipedia.org/wiki/Kepler_triangle)
