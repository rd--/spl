# gaussianPrimeSpiral

- _gaussianPrimeSpiral(z, k=10^6, d=1J0)_

Starting at _z_,
initially facing in direction _d_,
construct a _spiral_ by turning left whenever _z_ is a Gaussian prime.
Answer the list of visited Gaussian primes _p_,
and the count of visited Gaussian integers _k_.

A spiral with _p=29_ and _k=204_:

~~~spl svg=A
let [p, _] = 12J-7.gaussianPrimeSpiral;
p.realImaginary.Polygon
~~~

![](Help/Image/gaussianPrimeSpiral-A.svg)

A spiral with _p=102_ and _k=412_:

~~~spl svg=B
let [p, _] = 3J5.gaussianPrimeSpiral;
p.realImaginary.Polygon
~~~

![](Help/Image/gaussianPrimeSpiral-B.svg)

A spiral with _p=238_ and _k=1,536_:

~~~spl svg=C
let [p, _] = 5J23.gaussianPrimeSpiral;
p.realImaginary.Polygon
~~~

![](Help/Image/gaussianPrimeSpiral-C.svg)

A rectangular spiral with _p=5_ and _k=12_:

~~~spl svg=D
let [p, _] = 8J13.gaussianPrimeSpiral;
[
	p.realImaginary.PointCloud,
	p.realImaginary.Polygon
].GeometryCollection
~~~

![](Help/Image/gaussianPrimeSpiral-D.svg)

A spiral with _p=261_ and _k=1,316_:

~~~spl svg=E
let [p, _] = 11J20.gaussianPrimeSpiral;
p.realImaginary.Polygon
~~~

![](Help/Image/gaussianPrimeSpiral-E.svg)

A spiral with _p=2,958_ and _k=23,252_:

~~~spl png=F
let [p, _] = 12J28.gaussianPrimeSpiral;
p.realImaginary.denseScatterPlot
~~~

![](Help/Image/gaussianPrimeSpiral-F.png)

The first few terms of a spiral with _k=316,268_:

~~~spl svg=G
let [p, _] = 232J277.gaussianPrimeSpiral(
	5000, 1J0
);
p.realImaginary.Line
~~~

![](Help/Image/gaussianPrimeSpiral-G.svg)

* * *

See also: isGaussianPrime

Guides: Prime Number Functions
