# ExponentialDistribution

- _ExponentialDistribution(lambda)_

A `Type` that represents an exponential distribution with scale inversely proportional to parameter λ.
The scale is given by the method `beta`, which answers the `reciprocal` of λ.

Probability mass function,
monotonically decreasing:

~~~spl svg=A
(0 -- 3).functionPlot(
	ExponentialDistribution(2).pdf
)
~~~

![](sw/spl/Help/Image/ExponentialDistribution-A.svg)

Cumulative distribution function:

~~~spl svg=B
(0 -- 4).functionPlot(
	ExponentialDistribution(2).cdf
)
~~~

![](sw/spl/Help/Image/ExponentialDistribution-B.svg)

Generate a sample of pseudorandom numbers from a geometric distribution:

~~~spl svg=C
let r = Sfc32(789142);
ExponentialDistribution(3.5)
.randomVariate(r, 10 ^ 4)
.histogramList
.second
.discretePlot
~~~

![](sw/spl/Help/Image/ExponentialDistribution-C.svg)

The `inverseCdf`, or percent point function:

~~~spl svg=D
(0 -- 0.99).functionPlot(
	ExponentialDistribution(2)
	.inverseCdf
)
~~~

![](sw/spl/Help/Image/ExponentialDistribution-D.svg)

The `inverseSurvivalFunction`:

~~~spl svg=E
(0.01 -- 1).functionPlot(
	ExponentialDistribution(2)
	.inverseSurvivalFunction
)
~~~

![](sw/spl/Help/Image/ExponentialDistribution-E.svg)

Compute `cdf` at specific value:

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
(- 1 (if (>= x 0) (- 1 (exp (* (* -1 x) lambda))) 0))
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
