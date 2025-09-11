# asaTriangle

- _asaTriangle(α, c, β)_

Answer a `Triangle` with angles _α_ and _β_ and a side of length _c_, _c_ is adjacent to both angles.
Vertices are placed so that _A_ is at the origin, _B_ is on the positive _x_ axis, and _C_ in the half-plane _y > 0_.

`coordinates`, `area`, `centroid` and `interiorAngles` of a _1, 1/2.pi, 2_ triangle:

```
>>> let t = asaTriangle(1/6.pi, 1, 1/3.pi);
>>> (
>>> 	t.vertexCoordinates,
>>> 	t.area,
>>> 	t.centroid,
>>> 	t.interiorAngles
>>> )
(
	[
		[0, 0],
		[1, 0],
		[3 / 4, 3.sqrt / 4]
	],
	3.sqrt / 8,
	[
		7 / 12,
		1 / (4 * 3.sqrt)
	],
	1.pi / [6 3 2]
)
```

A golden triangle,
an isosceles triangle such that the ratio of the hypotenuse to the base is equal to the golden ratio (φ):

~~~spl svg=A
let a = 2.pi / 5;
[asaTriangle(a, 1, a)].LineDrawing
~~~

![](sw/spl/Help/Image/asaTriangle-A.svg)

A golden triangle and a golden gnomon,
an obtuse isosceles triangle such that the ratio of the hypotenuse to the base is _1 / φ = φ - 1_:

~~~spl svg=B
[2.pi / 5, 1.pi / 5].collect { :a |
	asaTriangle(a, 1, a)
}.LineDrawing
~~~

![](sw/spl/Help/Image/asaTriangle-B.svg)

Varying two angles together:

~~~spl svg=C
(0.1, 0.14 .. 0.9).collect { :beta |
	asaTriangle(1 - beta, 1, 1 + beta)
}.LineDrawing
~~~

![](sw/spl/Help/Image/asaTriangle-C.svg)

* * *

See also: aasTriangle, sasTriangle, sssTriangle, Triangle

Guides: Geometry Functions, Triangle Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ASATriangle.html)

Categories: Geometry
