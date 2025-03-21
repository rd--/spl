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
let d = NormalDistribution(0, 1);
(-3 -- 3).functionPlot { :x |
	d.survivalFunction(x)
}
~~~

![](sw/spl/Help/Image/survivalFunction-A.svg)

A survival function for a discrete univariate distribution:

~~~spl svg=B
let d = GeometricDistribution(1 / 3);
(-1 .. 10).collect { :x |
	d.survivalFunction(x)
}.discretePlot
~~~

![](sw/spl/Help/Image/survivalFunction-B.svg)



* * *

See also: cdf, hazardFunction, inverseSurvivalFunction, pdf, quantile

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SurvivalFunction.html)
