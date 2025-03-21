# WeibullDistribution

- _WeibullDistribution(alpha, beta, mu)_

Represents a Weibull distribution with
a shape parameter α (also called γ or _k_),
a scale parameter β (also called α or λ),
and a location parameter μ.

Probability density function, varying _alpha_:

~~~spl svg=A
let d = [0.5 2 4].collect { :alpha |
	WeibullDistribution(alpha, 1, 0)
};
(0.05 -- 3).functionPlot(
	d.collect { :each |
		{ :x |
			each.pdf(x)
		}
	}
)
~~~

![](sw/spl/Help/Image/WeibullDistribution-A.svg)

Probability density function, varying _beta_:

~~~spl svg=B
let d = [1 2 4].collect { :beta |
	WeibullDistribution(2, beta, 0)
};
(0.05 -- 3).functionPlot(
	d.collect { :each |
		{ :x |
			each.pdf(x)
		}
	}
)
~~~

![](sw/spl/Help/Image/WeibullDistribution-B.svg)

Probability density function, varying _mu_:

~~~spl svg=C
let d = [-1.5 1 2].collect { :mu |
	WeibullDistribution(3, 2, mu)
};
(0 -- 6).functionPlot(
	d.collect { :each |
		{ :x |
			each.pdf(x)
		}
	}
)
~~~

![](sw/spl/Help/Image/WeibullDistribution-C.svg)

Generate a sample of pseudorandom numbers from a Weibull distribution and plot the histogram:

~~~spl svg=D
WeibullDistribution(3.5, 2, 0)
.randomVariate(Sfc32(371513), [1E4])
.histogramList
.second
.discretePlot
~~~

![](sw/spl/Help/Image/WeibullDistribution-D.svg)

Two dimensional Weibull noise:

~~~spl png=E
let r = Sfc32(180513);
WeibullDistribution(2.5, 1, 0)
.randomVariate(r, [100 100])
.asGraymap
~~~

![](sw/spl/Help/Image/WeibullDistribution-E.png)

* * *

See also: CauchyDistribution, cdf, NormalDistribution, pdf, randomVariate, UniformDistribution

References:
_Mathematica_
[1](https://mathworld.wolfram.com/WeibullDistribution.html)
[2](https://reference.wolfram.com/language/ref/WeibullDistribution.html),
_Mathworks_
[1](https://mathworks.com/help/stats/weibull-distribution.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda3668.htm),
_W_
[1](https://en.wikipedia.org/wiki/Weibull_distribution)
