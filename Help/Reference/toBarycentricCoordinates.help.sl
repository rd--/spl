# toBarycentricCoordinates

- _toBarycentricCoordinates(t, p)_

Given a `Triangle` _t_ answer the barycentric coordinates of the cartesian coordinates _p_.
The coordinates are _normalized_,
summing to `one`.

```
>>> let t = sssTriangle(1, 1, 1);
>>> let l = [1/3 1/5 7/15];
>>> let c = t.fromBarycentricCoordinates(l);
>>> (c, t.toBarycentricCoordinates.value(c))
(
	[0.43333 0.40415],
	[1/3 1/5 7/15]
)
```

The inverse is `fromBarycentricCoordinates`.

* * *

See also: fromBarycentricCoordinates

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/triangulation.cartesiantobarycentric.html)
