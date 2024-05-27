# asaTriangle

- _asaTriangle(alpha, c, beta)_

Answer a `Triangle` with angles _alpha_ and _beta_ and sides of length _c_, _c_ is adjacent to both angles.
Vertices are placed so that _A_ is at the origin, _B_ is on the positive _x_ axis, and _C_ in the half-plane _y > 0_.

`coordinates`, `area`, `centroid` and `interiorAngles` of a _1, pi/2, 2_ triangle:

```
>>> let t = asaTriangle(pi / 6, 1, pi / 3);
>>> (t.coordinates, t.area, t.centroid, t.interiorAngles)
(
	[[0, 0], [1, 0], [3 / 4, 3.sqrt / 4]],
	3.sqrt / 8,
	[7 / 12, 1 / (4 * 3.sqrt)],
	pi / [6 3 2]
)
```

* * *

See also: sasTriangle, sssTriangle, Triangle

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ASATriangle.html)
