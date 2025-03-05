# weibullDistributionPdf

- _weibullDistributionPdf(x, gamma, alpha=1, mu=0)_

Answer the probability density function for the Weibull distribution.

Plot over a subset of the reals:

~~~spl svg=A
(0.05 -- 3).functionPlot(
	[0.5 1 2 5].collect { :gamma |
		{ :x |
			x.weibullDistributionPdf(
				gamma
			)
		}
	}
)
~~~

![](sw/spl/Help/Image/weibullDistributionPdf-A.svg)

* * *

See also: weibullDistributionCdf, poissonDistributionPdf

References:
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda3668.htm)
