# poissonDiskSampling

- _poissonDiskSampling(r, [x y], k, n=30)_

Answer a `List` of random coordinates,
in the rectangular region _((0,0),(x,y))_,
drawn from the random number generator _r_,
such that each point is separated from all other points by a specified minimum distance _k_.
The parameter _n_ specifies the number of candidates to sample per iteration.

Draw circles centered at each sampled coordinate:

~~~spl svg=A
Sfc32(3278194)
.poissonDiskSampling([5 2], 0.2, 30)
.Circle(0.1)
.LineDrawing
~~~

![](sw/spl/Help/Image/poissonDiskSampling-A.svg)

Draw points and circles for less dense sampling,
indicate the region sampled:

~~~spl svg=B
let r = Sfc32(3278194);
let c = r.poissonDiskSampling(
	[5 2], 0.4, 30
);
[
	Rectangle([0 0], [5 2]),
	PointCloud(c),
	Circle(c, 0.2)
].LineDrawing
~~~

![](sw/spl/Help/Image/poissonDiskSampling-B.svg)

* * *

See also: randomPoint

Guides: Random Functions

References:
_Python_
[1](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.qmc.PoissonDisk.html)

Further Reading: Cook 1986, Bridson 2007
