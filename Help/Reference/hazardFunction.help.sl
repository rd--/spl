# hazardFunction

- _hazardFunction(d)_
- _hazardFunction(d, x)_

Answer the hazard function for the distribution _d_,
evaluated at _x_.
The hazard function is the ratio of the probability density functionto the survival function.

Calculate at specific value:

```
>>> WeibullDistribution(2, 5, 0)
>>> .hazardFunction(4)
8/25
```

Plot:

~~~spl svg=A
(0.1 -- 3).functionPlot(
	WeibullDistribution(1 / 2, 2, 0)
	.hazardFunction
)
~~~

![](sw/spl/Help/Image/hazardFunction-A.svg)

* * *

See also: cdf, pdf, survivalFunction

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HazardFunction.html)
[2](https://reference.wolfram.com/language/ref/HazardFunction.html)
