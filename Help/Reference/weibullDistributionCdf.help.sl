# weibullDistributionCdf

- _weibullDistributionCdf(x, gamma, alpha=1, mu=0)_

Answer the  cumulative distribution function for the Weibull distribution.

Plot over a subset of the reals:

~~~spl svg=A
(0.05 -- 5).functionPlot(
	[0.5 1 2 5].collect { :gamma |
		{ :x |
			x.weibullDistributionCdf(
				gamma
			)
		}
	}
)
~~~

![](sw/spl/Help/Image/weibullDistributionCdf-A.svg)

* * *

See also: weibullDistributionCdf, poissonDistributionCdf

References:
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda3668.htm)
