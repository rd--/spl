# StudentTDistribution

- _StudentTDistribution(μ, σ, ν)_

A `Type` representing a Student _t_ distribution with location parameter μ,
scale parameter σ,
and ν degrees of freedom.

For _ν=1_ the Student _t_ distribution becomes the standard Cauchy distribution.
For _ν→∞_ the Student _t_ distribution becomes the standard normal distribution.

Probability density function with standard μ and σ:

~~~spl svg=A
(-5 -- 5).functionPlot(
	[0.1 0.5 4].collect { :nu |
		StudentTDistribution(0, 1, nu)
		.pdf
	}
)
~~~

![](sw/spl/Help/Image/StudentTDistribution-A.svg)

Cumulative distribution function with standard μ and σ:

~~~spl svg=B
(-5 -- 5).functionPlot(
	[0.1 0.5 4].collect { :nu |
		StudentTDistribution(0, 1, nu)
		.cdf
	}
)
~~~

![](sw/spl/Help/Image/StudentTDistribution-B.svg)

Probability density function of a generalized Student _t_ distribution:

~~~spl svg=C
(-5 -- 5).functionPlot(
	[0.1 0.5 4].collect { :nu |
		StudentTDistribution(1, 2, nu)
		.pdf
	}
)
~~~

![](sw/spl/Help/Image/StudentTDistribution-C.svg)

Cumulative distribution function of a generalized Student _t_ distribution:

~~~spl svg=D
(-5 -- 5).functionPlot(
	[0.1 0.5 4].collect { :nu |
		StudentTDistribution(1, 2, nu)
		.cdf
	}
)
~~~

![](sw/spl/Help/Image/StudentTDistribution-D.svg)

Generate a sample of pseudorandom numbers from a Student _t_ distribution:

~~~spl svg=E
let r = Sfc32(401039);
StudentTDistribution(0, 1, 10)
.randomVariate(r, [10 ^ 4])
.histogramPlot
~~~

![](sw/spl/Help/Image/StudentTDistribution-E.svg)

* * *

See also: beta, betaRegularized, CauchyDistribution, NormalDistribution

Guides: Probability Distributions, Random Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Studentst-Distribution.html)
[2](https://reference.wolfram.com/language/ref/StudentTDistribution.html),
_W_
[1](https://en.wikipedia.org/wiki/Student%27s_t-distribution)
