# ParetoDistribution

- _ParetoDistribution(k, alpha)_

A `Type` that represents a Pareto distribution with minimum value parameter _k_ and shape parameter _α_.

Probability density function:

~~~spl svg=A
(3 -- 7).functionPlot(
	[0.5 0.75 1.5].collect { :alpha |
		let d = ParetoDistribution(
			3,
			alpha
		);
		{ :x |
			d.pdf(x).clip([0 0.35])
		}
	}
)
~~~

![](sw/spl/Help/Image/ParetoDistribution-A.svg)

Cumulative distribution function:

~~~spl svg=B
(3 -- 7).functionPlot(
	[0.5 0.75 1.5].collect { :alpha |
		let d = ParetoDistribution(
			3,
			alpha
		);
		{ :x |
			d.cdf(x)
		}
	}
)
~~~

![](sw/spl/Help/Image/ParetoDistribution-B.svg)

Generate a sample of pseudorandom numbers from a Pareto distribution:

~~~spl svg=C
let r = Sfc32(891314);
ParetoDistribution(2, 5)
.randomVariate(r, [10 ^ 4])
.histogramPlot([2 6 0.2])
~~~

![](sw/spl/Help/Image/ParetoDistribution-C.svg)

* * *

See also: cdf, pdf

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ParetoDistribution.html),
_W_
[1](https://en.wikipedia.org/wiki/Pareto_distribution)
