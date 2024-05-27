# aasTriangle

- _aasTriangle(alpha, beta, a)_

Answer a `Triangle` with angles _alpha_ and _beta_ and side of length _a_.
_a_ is adjacent to one angle only.
Vertices are placed so that _A_ is at the origin,
_B_ is on the positive _x_ axis,
and _C_ in the half-plane _y > 0_.

`coordinates`, `area` and `centroid` of _aas_ triangle:

```
>>> let t = aasTriangle(pi / 6, pi / 3, 1);
>>> (t.coordinates, t.area, t.centroid)
(
	[[0, 0], [2, 0], [3/2, 3.sqrt / 2]],
	3.sqrt / 2,
	[7/6, 1 / (2 * 3.sqrt)]
)
```

* * *

See also: asaTriangle, sasTriangle, sssTriangle, Triangle

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/AASTriangle.html)
