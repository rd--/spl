# fromBarycentricCoordinates

- _fromBarycentricCoordinates(t)_
- _fromBarycentricCoordinates(t, λ)_

Given a `Triangle` or `Tetrahedron` _t_,
answer the Cartesian coordinates of the barycentric coordinates λ.
Barycentric coordinates were introduced by August Möbius in 1827.

The homogeneous barycentric coordinates of the centroid are _1,1,1_:

```
>>> let t = sssTriangle(1, 1, 1);
>>> t.fromBarycentricCoordinates([1 1 1] / 3)
t.centroid
```

Plot specific points:

~~~spl svg=A
let t = sssTriangle(1, 1, 1);
let c = [
	1 0 0; 0 1 0; 0 0 1;
	1/2 1/2 0; 0 1/2 1/2; 1/2 0 1/2;
	1/2 1/4 1/4; 1/4 1/2 1/4; 1/4 1/4 1/2;
	1/3 1/3 1/3
].asFloat;
[
	t,
	c.collect(
		t.fromBarycentricCoordinates
	).PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/fromBarycentricCoordinates-A.svg)

Plot grid of points:

~~~spl svg=B
let t = sssTriangle(1, 1, 1);
let f:/1 = t.fromBarycentricCoordinates;
let c = [0, 0.1 .. 1].tuples(2).select { :each |
	each.sum <= 1
};
[
	t,
	c.collect { :each |
		let [p, q] = each;
		f([p, q, 1 - (p + q)])
	}.PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/fromBarycentricCoordinates-B.svg)

Plot grid of points on a triangle embedded in three-dimensional space:

~~~spl svg=C
let t = Triangle([0 0 0], [1 0 1], [0 1 1]);
let f:/1 = t.fromBarycentricCoordinates;
let c = [0, 0.1 .. 1].tuples(2).select { :each |
	each.sum <= 1
};
[
	Cuboid([0 0 0], [1 1 1]),
	t,
	PointCloud(
		c.collect { :each |
			let [p, q] = each;
			f([p, q, 1 - (p + q)])
		}
	)
].PerspectiveDrawing
~~~

![](sw/spl/Help/Image/fromBarycentricCoordinates-C.svg)

The inverse is `toBarycentricCoordinates`.

* * *

See also: fromTrilinearCoordinates, toBarycentricCoordinates, Triangle

Guides: Coordinate System Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BarycentricCoordinates.html),
_Mathworks_
[1](https://au.mathworks.com/help/matlab/ref/triangulation.cartesiantobarycentric.html),
_W_
[1](https://en.wikipedia.org/wiki/Barycentric_coordinate_system)
