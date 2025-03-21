# hazardFunction

- _hazardFunction(d, x)_

Answer the hazard function for the distribution _d_ evaluated at _x_.

```
>>> WeibullDistribution(2, 5, 0)
>>> .hazardFunction(4)
8/25
```

~~~spl svg=A
let d = WeibullDistribution(1 / 2, 2, 0);
(0.1 -- 3).functionPlot { :x |
	d.hazardFunction(x)
}

* * *

See also: cdf, pdf, survivalFunction

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/HazardFunction.html)
