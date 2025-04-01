# ReciprocalDistribution

- _ReciprocalDistribution(a, b)_

The reciprocal distribution is characterised by its probability density function,
within the support of the distribution,
being proportional to the reciprocal of the variable.
The reciprocal distribution is also called the log-uniform distribution.

Plot `pdf` over a subset of the reals:

~~~spl svg=A
(0 -- 5).functionPlot(
	ReciprocalDistribution(1, 4).pdf
)
~~~

![](sw/spl/Help/Image/ReciprocalDistribution-A.svg)

Plot `cdf` over a subset of the reals:

~~~spl svg=B
(0 -- 5).functionPlot(
	ReciprocalDistribution(1, 4).cdf
)
~~~

![](sw/spl/Help/Image/ReciprocalDistribution-B.svg)

Plot histogram of `randomVariate`:

~~~spl svg=C
let r = Sfc32(781932);
ReciprocalDistribution(1, 4)
.randomVariate(r, [10 ^ 4])
.histogramPlot([0 5 0.25])
~~~

![](sw/spl/Help/Image/ReciprocalDistribution-C.svg)

Plot histogram of `log` of `randomVariate`:

~~~spl svg=D
let r = Sfc32(479318);
ReciprocalDistribution(1, 4)
.randomVariate(r, [10 ^ 4])
.log
.histogramPlot
~~~

![](sw/spl/Help/Image/ReciprocalDistribution-D.svg)

* * *

See also: UniformDistribution

References:
_Mathworks_
[1](https://au.mathworks.com/help/stats/loguniform-distribution.html),
_W_
[1](https://en.wikipedia.org/wiki/Reciprocal_distribution)
