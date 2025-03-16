# ExponentialDistribution

- _ExponentialDistribution(lambda)_

A `Type` that represents an exponential distribution with scale inversely proportional to parameter λ.
the distribution of the number of failures in a sequence of trials with success probability _p_ before a success occurs.

Probability mass function:

~~~spl svg=A
let d = ExponentialDistribution(2);
(0 -- 3).functionPlot { :x |
	d.pdf(x)
}
~~~

![](sw/spl/Help/Image/ExponentialDistribution-A.svg)

Cumulative distribution function:

~~~spl svg=B
let d = ExponentialDistribution(2);
(0 -- 4).functionPlot { :x |
	d.cdf(x)
}
~~~

![](sw/spl/Help/Image/ExponentialDistribution-B.svg)

Generate a sample of pseudorandom numbers from a geometric distribution:

~~~spl svg=C
ExponentialDistribution(3.5)
.randomVariate(Sfc32(789142), 10 ^ 4)
.histogramList
.second
.discretePlot
~~~

![](sw/spl/Help/Image/ExponentialDistribution-C.svg)

Compute cdf:

```
>>> ExponentialDistribution(1 / 3000).cdf(2500)
0.565402
```

Evaluate symbolically:

```
>> ExponentialDistribution(`lambda`).mean
(/ 1 lambda)

>> ExponentialDistribution(`lambda`).variance
(/ 1 (* lambda lambda))

>> ExponentialDistribution(`lambda`).median
(/ 0.6931471805599453 lambda)

>> ExponentialDistribution(`lambda`).skewness
2

>> ExponentialDistribution(`lambda`).kurtosis
9
```

* * *

See also: cdf, mean, pdf, randomVariate, variance

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ExponentialDistribution.html),
_Mathworks_
[2](https://au.mathworks.com/help/stats/exprnd.html),
_W_
[1](https://en.wikipedia.org/wiki/Exponential_distribution)
