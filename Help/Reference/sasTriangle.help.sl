# sasTriangle

- _sasTriangle(a, γ, b)_

Answer a `Triangle` with sides of lengths _a_ and _b_ and angle _γ_ between them.
Vertices are placed so that _A_ is at the origin, _B_ is on the positive _x_ axis, and _C_ in the half-plane _y > 0_.

`coordinates`, `area`, `centroid` and `interiorAngles` of a _1, pi/2, 2_ triangle:

```
>>> let t = sasTriangle(1, pi / 2, 2);
>>> (t.coordinates, t.area, t.centroid, t.interiorAngles)
(
	[[0, 0], [5.sqrt, 0], [4 / 5.sqrt, 2 / 5.sqrt]],
	1,
	[3 / 5.sqrt, 2 / (3 * 5.sqrt)],
	[(2 / 5.sqrt).arcCos, (1 / 5.sqrt).arcCos, pi / 2]
)
```

* * *

See also: asaTriangle, sssTriangle, Triangle

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SASTriangle.html)
