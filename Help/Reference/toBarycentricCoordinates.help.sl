# toBarycentricCoordinates

- _toBarycentricCoordinates(t, p)_

Given a `Triangle` or `Tetrahedron` _t_,
answer the barycentric coordinates of the cartesian coordinates _p_.
The answer coordinates are _normalized_,
summing to `one`.

At `Triangle`:

```
>>> let t = sssTriangle(1, 1, 1);
>>> let l = [1/3 1/5 7/15];
>>> let c = t.fromBarycentricCoordinates(l);
>>> (c, t.toBarycentricCoordinates(c))
(
	[0.43333 0.40415],
	[1/3 1/5 7/15]
)
```

At `Tetrahedron`:

```
>>> let t = Tetrahedron(
>>> 	[1 1 1],
>>> 	[3 3 10],
>>> 	[3 6 1],
>>> 	[6 1 1]
>>> );
>>> t.toBarycentricCoordinates([3 3 3])
[7/25 2/9 14/45 14/75]
```

The inverse is `fromBarycentricCoordinates`.

* * *

See also: fromBarycentricCoordinates

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BarycentricCoordinates.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/triangulation.cartesiantobarycentric.html),
_W_
[1](https://en.wikipedia.org/wiki/Barycentric_coordinate_system)
