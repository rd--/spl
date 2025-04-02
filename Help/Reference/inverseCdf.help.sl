# inverseCdf

- _inverseCdf(d)_
- _inverseCdf(d, q)_

Answer the inverse of the cumulative distribution function for the distribution _d_,
as a function of the variable _q_.
Also called the _percent point function_.

Specific values:

```
>>> WeibullDistribution(2, 5, 0)
>>> .inverseCdf(1 / 4)
5 * (4 / 3).log.sqrt

>>> WeibullDistribution(2, 5, 0)
>>> .inverseCdf(0.4)
3.5736
```

Answer `Block` and collect over a list:

```
>>> [0.1 0.25 0.5 0.75 0.9].collect(
>>> 	NormalDistribution(1, 5)
>>> 	.inverseCdf
>>> )
[-5.4078 -2.3724 1.0000 4.3724 7.4078]
```

Determine the critical values at the 5% significance level for a test statistic with a standard normal distribution,
by computing the upper and lower 2.5% values:

```
>>> [0.025 0.975].collect(
>>> 	NormalDistribution(0, 1)
>>> 	.inverseCdf
>>> )
[-1.96 1.96]
```

Plot `inverseCdf` of `NormalDistribution`:

~~~spl svg=A
(0 -- 1).functionPlot(
	NormalDistribution(0, 1)
	.inverseCdf
	.clip(-3, 3)
)
~~~

![](sw/spl/Help/Image/inverseCdf-A.svg)

Generate random data for a distribution:

~~~spl svg=B
let r = Sfc32(789432);
UniformDistribution([0 1])
.randomVariate(r, [10 ^ 4])
.collect(
	NormalDistribution(3, 1)
	.inverseCdf
)
.histogramPlot
~~~

![](sw/spl/Help/Image/inverseCdf-B.svg)

* * *

See also: cdf, inverseErfc, inverseSurvivalFunction, pdf

Guides: Probability Distributions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/InverseCDF.html),
_Mathworks_
[1](https://mathworks.com/help/stats/prob.normaldistribution.icdf.html)
