# aasTriangle

- _aasTriangle(α, β, a)_

Answer a `Triangle` with angles _α_ and _β_ and side of length _a_.
_a_ is adjacent to one angle only.
Vertices are placed so that _A_ is at the origin,
_B_ is on the positive _x_ axis,
and _C_ in the half-plane _y > 0_.

Calculate the `coordinates`, `area` and `centroid` of an _aas_ triangle:

```
>>> let t = aasTriangle(pi / 6, pi / 3, 1);
>>> (
>>> 	t.vertexCoordinates,
>>> 	t.area,
>>> 	t.centroid,
>>> 	t.interiorAngles
>>> )
(
	[[0, 0], [2, 0], [3/2, 3.sqrt / 2]],
	3.sqrt / 2,
	[7/6, 1 / (2 * 3.sqrt)],
	pi / [6 3 2]
)
```

Varying an angle:

~~~spl svg=A
(0.1, 0.14 .. 0.9).collect { :beta |
	aasTriangle(1, 1 + beta, 1)
}.LineDrawing
~~~

![](sw/spl/Help/Image/aasTriangle-A.svg)

* * *

See also: asaTriangle, sasTriangle, sssTriangle, Triangle

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/AASTriangle.html)

Categories: Geometry
