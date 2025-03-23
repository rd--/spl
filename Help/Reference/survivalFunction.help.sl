# survivalFunction

- _survivalFunction(d, x)_

Answer the survival function,
also called the complementary cumulative distribution function or the reliability function,
for the distribution _d_ evaluated at _x_.
It is equal to _1 - cdf(d, x)_.

Calculate at specific value:

```
>>> WeibullDistribution(2, 5, 0)
>>> .survivalFunction(4)
(16 / 25).exp./
```

A survival function for a continuous univariate distribution:

~~~spl svg=A
(-3 -- 3).functionPlot(
	NormalDistribution(0, 1)
	.survivalFunction
)
~~~

![](sw/spl/Help/Image/survivalFunction-A.svg)

A survival function for a discrete univariate distribution:

~~~spl svg=B
(-1 .. 10).collect(
	GeometricDistribution(1 / 3)
	.survivalFunction
).discretePlot
~~~

![](sw/spl/Help/Image/survivalFunction-B.svg)

* * *

See also: cdf, hazardFunction, inverseSurvivalFunction, pdf, quantile

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SurvivalFunction.html),
_W_
[1](https://en.wikipedia.org/wiki/Survival_function)
