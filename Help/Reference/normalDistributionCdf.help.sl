# normalDistributionCdf

- _normalDistributionCdf(x, mu, sigma)_

Answer the cumulative distribution function for the normal distribution.

Threads over lists:

```
>>> [0 1 2 1.96 2.58]
>>> .normalDistributionCdf(0, 1)
[0.5 0.8413 0.9772 0.9750 0.9951]
```

Plot over a subset of the reals:

~~~spl svg=A
(-5 -- 5).functionPlot { :x |
	x.normalDistributionCdf(0, 2)
}
~~~

![](sw/spl/Help/Image/normalDistributionCdf-A.svg)

* * *

See also: normalDistributionPdf, poissonDistributionPdf

References:
_J_
[1](https://code.jsoftware.com/wiki/Essays/Normal_CDF),
_Mathematica_
[1](https://mathworld.wolfram.com/NormalDistribution.html),
_W_
[1](https://en.wikipedia.org/wiki/Normal_distribution)
