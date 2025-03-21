# inverseSurvivalFunction

- _inverseSurvivalFunction(d, q)_

Answer the inverse of the survival function for the distribution _d_ as a function of the variable _q_.

At specific value:

```
>>> ExponentialDistribution(2).
>>> inverseSurvivalFunction(1 / 4)
4.log / 2

>>> NormalDistribution(0, 1).
>>> inverseSurvivalFunction(1 / 5)
0.841621
```

Plot the inverse survival function for a standard normal distribution:

~~~spl svg=A
let d = NormalDistribution(0, 1);
(0 -- 1).functionPlot { :x |
	d.inverseSurvivalFunction(x).clip(-3, 3)
}
~~~

![](sw/spl/Help/Image/inverseSurvivalFunction-A.svg)

* * *

See also: cdf, inverseCdf, quantile, survivalFunction

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/InverseSurvivalFunction.html)
