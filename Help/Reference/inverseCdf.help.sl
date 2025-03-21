# inverseCdf

- _inverseCdf(d, p)_

Answer the inverse of the cumulative distribution function for the distribution _d_ as a function of the variable _q_.
Also called the _percent point function_.

Specific values:

```
>>> WeibullDistribution(2, 5, 0)
>>> .inverseCdf(1 / 4)
5 * (4 / 3).log.sqrt

>>> WeibullDistribution(2, 5, 0)
>>> .inverseCdf(0.4)
3.5736

>>> let d = NormalDistribution(1, 5);
>>> [0.1 0.25 0.5 0.75 0.9].collect { :x |
>>> 	d.inverseCdf(x)
>>> }
[-5.4078 -2.3724 1.0000 4.3724 7.4078]
```

Determine the critical values at the 5% significance level for a test statistic with a standard normal distribution,
by computing the upper and lower 2.5% values:

```
>>> let d = NormalDistribution(0, 1);
>>> [0.025 0.975].collect { :x |
>>> 	d.inverseCdf(x)
>>> }
[-1.96 1.96]
```

Plot `inverseCdf` of `NormalDistribution`:

~~~spl svg=A
let d = NormalDistribution(0, 1);
(0 -- 1).functionPlot { :x |
	d.inverseCdf(x).clip(-3, 3)
}
~~~

![](sw/spl/Help/Image/inverseCdf-A.svg)

* * *

See also: cdf, inverseSurvivalFunction, pdf

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/InverseCDF.html),
_Mathworks_
[1](https://mathworks.com/help/stats/prob.normaldistribution.icdf.html)
