# ChiSquareDistribution

- _ChiSquareDistributionn(ν)_

Answer a `GammaDistribution` value representing a Χ² distribution with ν degrees of freedom.
The Χ² distribution is a special case of the γ distribution.

Probability density function:

~~~spl svg=A
(0 -- 6).functionPlot(
	[0.5 3 5].collect { :nu |
		ChiSquareDistribution(nu)
		.pdf
		.clip(0, 0.4)
	}
)
~~~

![](sw/spl/Help/Image/ChiSquareDistribution-A.svg)

Cumulative distribution function:

~~~spl svg=B
(0 -- 6).functionPlot(
	[0.5 3 5].collect { :nu |
		ChiSquareDistribution(nu)
		.cdf
	}
)
~~~

![](sw/spl/Help/Image/ChiSquareDistribution-B.svg)

Generate a sample of pseudo-random numbers:

~~~spl svg=C
let r = Sfc32(731482);
ChiSquareDistribution(3)
.randomVariate(r, [10 ^ 4])
.histogramPlot
~~~

![](sw/spl/Help/Image/ChiSquareDistribution-C.svg)

Mean and variance:

```
>> ChiSquareDistribution(`nu`).mean
(* (/ nu 2) 2)

>> ChiSquareDistribution(`nu`).variance
(* (/ nu 2) 4)
```

* * *

See also: GammaDistribution, StudentTDistribution

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ChiSquaredDistribution.html)
[2](https://reference.wolfram.com/language/ref/ChiSquareDistribution.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda3666.htm),
_W_
[1](https://en.wikipedia.org/wiki/Chi-squared_distribution)
