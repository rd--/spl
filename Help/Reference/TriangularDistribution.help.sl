# TriangularDistribution

- _TriangularDistribution(⌊ -- ⌈, c)_

A `Type` representing a symmetric triangular statistical distribution giving values between ⌊ and ⌈,
with mode at _c_.

Probability density function:

~~~spl svg=A
(0 -- 4).functionPlot(
	[0.5 2 3].collect { :c |
		TriangularDistribution(0 -- 4, c)
		.pdf
	}
)
~~~

![](sw/spl/Help/Image/TriangularDistribution-A.svg)

Cumulative distribution function:

~~~spl svg=B
(0 -- 4).functionPlot(
	[0.5 2 3].collect { :c |
		TriangularDistribution(0 -- 4, c)
		.cdf
	}
)
~~~

![](sw/spl/Help/Image/TriangularDistribution-B.svg)

Generate a sample of pseudorandom numbers from a triangular distribution:

~~~spl svg=C
let r = Sfc32(380149);
TriangularDistribution(-1 -- 2, 1)
.randomVariate(r, [10 ^ 4])
.histogramPlot
~~~

![](sw/spl/Help/Image/TriangularDistribution-C.svg)

* * *

See also: Piecewise, UniformDistribution

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/TriangularDistribution.html),
_W_
[1](https://en.wikipedia.org/wiki/Triangular_distribution)
