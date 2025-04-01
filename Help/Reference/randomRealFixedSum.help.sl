# randomRealFixedSum

- _randomRealFixedSum(r, u, [m n])_

Answer a list of _m_ vectors,
each of _n_ places and summing to _u_,
randomly drawn from _r_.
Implemented using `staffordsAlgorithm`.

Plot a uniform distribution within a specified simplex:

~~~spl svg=A
let r = Sfc32(361782);
let t = sssTriangle(1, 1, 1);
let c = r.randomRealFixedSum(1, [99 3]);
let p = c.collect(
	t.fromBarycentricCoordinates
);
[
	t,
	p.PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/randomRealFixedSum-A.svg)

_Note:_ The shape parameter can specify further dimensions,
in which case the last entry specifies _n_.
For instance _[i j n]_ would specify an _i×j_ matrix of _n_ vectors.

* * *

See also: randomReal, staffordsAlgorithm, UniformDistribution
