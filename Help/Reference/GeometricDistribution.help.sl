# GeometricDistribution

- _GeometricDistribution(p)_

A `Type` that represents a geometric distribution with probability parameter _p_,
the distribution of the number of failures in a sequence of trials with success probability _p_ before a success occurs.

Probability mass function:

~~~spl svg=A
1:15.collect(
	GeometricDistribution(0.2).pdf
).discretePlot
~~~

![](sw/spl/Help/Image/GeometricDistribution-A.svg)

Cumulative distribution function:

~~~spl svg=B
1:15.collect(
	GeometricDistribution(0.2).cdf
).discretePlot
~~~

![](sw/spl/Help/Image/GeometricDistribution-B.svg)

Skewness:

~~~spl svg=C
(0 -- 0.9).functionPlot { :p |
	GeometricDistribution(p).skewness
}
~~~

![](sw/spl/Help/Image/GeometricDistribution-C.svg)

Generate a sample of pseudorandom numbers from a geometric distribution:

~~~spl svg=D
let r = Sfc32(794185);
GeometricDistribution(0.1)
.randomVariate(r, 10 ^ 4)
.histogramPlot
~~~

![](sw/spl/Help/Image/GeometricDistribution-D.svg)

A coin-tossing experiment consists of tossing a fair coin repeatedly until a tail results. Simulate the process:

```
>>> let r = Sfc32(830140);
>>> GeometricDistribution(0.5)
>>> .randomVariate(r, 10)
[0 1 0 0 2 1 0 1 0 0]
```

Plot simulated coin tosses:

~~~spl svg=E
let r = Sfc32(893147);
GeometricDistribution(0.5)
.randomVariate(r, 100)
.discretePlot
~~~

![](sw/spl/Help/Image/GeometricDistribution-E.svg)

Compute the expected number of coin tosses:

```
>>> GeometricDistribution(0.5).mean
1
```

Simulate a counting process:

```
>>> let d = GeometricDistribution(0.2);
>>> let r = Sfc32(959478);
>>> let n = d.randomVariate(r, 20);
>>> (n, n.mean, d.mean)
(
	[
		4  1 13  2 20  2  9  4  0  1
		0  4  1 15  0  4  1  0  2  0
	],
	4.15,
	4
)
```

As more samples are taken the probablity that the measured mean will be distant from the expected mean becomes smaller:

```
>>> let d = GeometricDistribution(0.2);
>>> let r = Sfc32(489081);
>>> (10 ^ 1:4).collect { :k |
>>> 	d.randomVariate(r, k).mean
>>> }
[1.3 4.17 3.884 4.087]
```

Generate a 1×5 array of random numbers from a geometric distribution with probability parameter _p_ equal to 0.01:

```
>>> let r = Sfc32(376384);
>>> GeometricDistribution(0.01)
>>> .randomVariate(r, 5)
[180 199 23 192 6]
```

Evaluate mean and variance of a geometric distribution symbolically:

```
>> GeometricDistribution(`p`).mean
(+ -1 (/ 1 p))

>> GeometricDistribution(`p`).variance
(/ (- 1 p) (* p p))
```

* * *

See also: cdf, mean, pdf, randomVariate, variance

Guides: Probability Distributions, Random Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/GeometricDistribution.html),
_Mathworks_
[1](https://mathworks.com/help/stats/geometric-distribution.html)
[2](https://mathworks.com/help/stats/geornd.html),
_W_
[1](https://en.wikipedia.org/wiki/Geometric_distribution)
