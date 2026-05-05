# quantilePlot

- _quantilePlot([n₁ n₂ …], d)_

Answer a quantile plot,
also called a quantile-quantile or q-q plot,
a graphical technique for determining if two data sets come from populations with a common distribution.

~~~spl svg=A
UniformDistribution([-2 2])
.randomVariate(
	Sfc32(783914),
	100
).quantilePlot(
	NormalDistribution(0, 1)
)
~~~

![](Help/Image/quantilePlot-A.svg)

* * *

See also: ProbabilityDistribution, quantile

Guides: Plotting Functions, Probability Distributions, Statistics Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Quantile-QuantilePlot.html)
[2](https://reference.wolfram.com/language/ref/QuantilePlot.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda33o.htm),
_W_
[1](https://en.wikipedia.org/wiki/Q%E2%80%93Q_plot)
