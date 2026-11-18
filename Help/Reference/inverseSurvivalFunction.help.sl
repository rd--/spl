# inverseSurvivalFunction

- _inverseSurvivalFunction(d, q)_

Answer the inverse of the survival function for the distribution _d_,
as a function of the variable _q_.

At specific value:

```
>>> ExponentialDistribution(2.0)
>>> .inverseSurvivalFunction(1.0 / 4.0)
4.0.log / 2.0

>>> NormalDistribution(0.0, 1.0).
>>> inverseSurvivalFunction(1.0 / 5.0)
0.841621
```

Plot the inverse survival function for a standard normal distribution:

~~~spl svg=A
(0.0 -- 1.0).functionPlot(
	NormalDistribution(0.0, 1.0)
	.inverseSurvivalFunction
	.clip(-3.0, 3.0)
)
~~~

![](Help/Image/inverseSurvivalFunction-A.svg)

* * *

See also: cdf, inverseCdf, quantile, survivalFunction

Guides: Probability Distributions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/InverseSurvivalFunction.html)
