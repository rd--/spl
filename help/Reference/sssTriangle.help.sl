# sssTriangle

- _sssTriangle(a, b, c)_

Answer a `Triangle` with sides of lengths _a_, _b_, and _c_.
Vertices are placed so that _A_ is at the origin, _B_ is on the positive _x_ axis, and _C_ in the half-plane _y > 0_.

`coordinates`, `area` and `centroid` of a _3,4,5_ triangle:

```
>>> let t = sssTriangle(3, 4, 5);
>>> (t.coordinates, t.area, t.centroid)
(
	[0 0; 5 0; 16/5 12/5],
	6,
	[41/15 4/5]
)
```

* * *

See also: asaTriangle, sasTriangle, Triangle

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SSSTriangle.html)
