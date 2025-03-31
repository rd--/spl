# fromBarycentricCoordinates

- _fromBarycentricCoordinates(t)_
- _fromBarycentricCoordinates(t, λ)_

Given a `Triangle` _t_ answer the Cartesian coordinates of the barycentric coordinates λ.
Barycentric coordinates were introduced by August Möbius in 1827.

Plot specific points:

~~~spl svg=A
let t = sssTriangle(1, 1, 1);
let c = [
	1 0 0; 0 1 0; 0 0 1;
	1/2 1/2 0; 0 1/2 1/2; 1/2 0 1/2;
	1/2 1/4 1/4; 1/4 1/2 1/4; 1/4 1/4 1/2;
	1/3 1/3 1/3
].asFloat;
c.collect(
	t.fromBarycentricCoordinates
).PointCloud.asLineDrawing
~~~

![](sw/spl/Help/Image/fromBarycentricCoordinates-A.svg)

~~~spl svg=B
let t = sssTriangle(1, 1, 1);
let f:/1 = t.fromBarycentricCoordinates;
let c = [0, 0.1 .. 1].tuples(2).select { :each |
	each.sum <= 1
};
c.collect { :each |
	let [p, q] = each;
	f([p, q, 1 - (p + q)])
}.PointCloud.asLineDrawing
~~~

![](sw/spl/Help/Image/fromBarycentricCoordinates-B.svg)

The inverse is `toBarycentricCoordinates`.

* * *

See also: toBarycentricCoordinates, Triangle

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BarycentricCoordinates.html),
_Mathworks_
[1](https://au.mathworks.com/help/matlab/ref/triangulation.cartesiantobarycentric.html),
_W_
[1](https://en.wikipedia.org/wiki/Barycentric_coordinate_system)
