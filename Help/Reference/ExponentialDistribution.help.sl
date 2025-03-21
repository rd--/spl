# ExponentialDistribution

- _ExponentialDistribution(lambda)_

A `Type` that represents an exponential distribution with scale inversely proportional to parameter λ.
The scale is given by the method `beta`, which answers the `reciprocal` of λ.

Probability mass function,
monotonically decreasing:

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

The `inverseCdf`, or percent point function:

~~~spl svg=D
let d = ExponentialDistribution(2);
(0 -- 0.99).functionPlot { :x |
	d.inverseCdf(x)
}
~~~

![](sw/spl/Help/Image/ExponentialDistribution-D.svg)

The `inverseSurvivalFunction`:

~~~spl svg=E
let d = ExponentialDistribution(2);
(0.01 -- 1).functionPlot { :x |
	d.inverseSurvivalFunction(x)
}
~~~

![](sw/spl/Help/Image/ExponentialDistribution-E.svg)

Compute cdf:

```
>>> ExponentialDistribution(1 / 3000)
>>> .cdf(2500)
0.565402
```

Evaluate symbolically:

```
>> ExponentialDistribution(`lambda`)
>> .mean
(/ 1 lambda)

>> ExponentialDistribution(`lambda`)
>> .variance
(/ 1 (* lambda lambda))

>> ExponentialDistribution(`lambda`)
>> .median
(/ 0.6931471805599453 lambda)

>> ExponentialDistribution(`lambda`)
>> .skewness
2

>> ExponentialDistribution(`lambda`)
>> .kurtosis
9

>> ExponentialDistribution(`lambda`)
>> .hazardFunction(`x`)
(if (>= x 0) lambda 0)

>> ExponentialDistribution(`lambda`)
>> .survivalFunction(`x`)
(if (>= x 0) (exp (* (* -1 x) lambda)) 1)
```

* * *

See also: cdf, mean, pdf, randomVariate, variance

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ExponentialDistribution.html),
_Mathworks_
[1](https://mathworks.com/help/stats/exponential-distribution.html)
[2](https://mathworks.com/help/stats/exprnd.html),
_W_
[1](https://en.wikipedia.org/wiki/Exponential_distribution)
