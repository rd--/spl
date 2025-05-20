# fromTrilinearCoordinates

- _fromTrilinearCoordinates(t)_
- _fromTrilinearCoordinates(t, [x y z])_

Given a `Triangle` _t_,
answer the Cartesian coordinates of the trilinear coordinate _(x,y,z)_.

Plot specific points:

~~~spl svg=A
let p = [1 0; 0 0; 1 3.sqrt];
let t = Triangle(p);
let c = [0 1 1; 1 0 1; 1 1 0; 1 1 1];
let q = c.collect(
	t.fromTrilinearCoordinates
);
[
	p.PointCloud,
	t,
	q.PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/fromTrilinearCoordinates-A.svg)

Compare to barycentric coordinates:

~~~spl svg=B
let p = [1 0; 0 0; 1 3.sqrt];
let t = Triangle(p);
let c = [0 1 1; 1 0 1; 1 1 0; 1 1 1];
let q = c.collect { :each |
	t.fromBarycentricCoordinates(
		each.normalizeSum
	)
};
[
	p.PointCloud,
	t,
	q.PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/fromTrilinearCoordinates-B.svg)

* * *

See also: fromBarycentricCoordinates, Triangle

Guides: Coordinate System Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TrilinearCoordinates.html),
_W_
[1](https://en.wikipedia.org/wiki/Trilinear_coordinates)
