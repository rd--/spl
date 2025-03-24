# GammaDistribution

- _GammaDistributionn(α, β)_

A `Type` representing a gamma distribution with shape parameter α and scale parameter β.

Probability density function of a gamma distribution:

~~~spl svg=A
(0 -- 20).functionPlot(
	[1 4 6].collect { :alpha |
		GammaDistribution(
			alpha,
			2
		).pdf.clip(0, 0.2)
	}
)
~~~

![](sw/spl/Help/Image/GammaDistribution-A.svg)

Cumulative distribution function:

~~~spl svg=B
(0 -- 20).functionPlot(
	[1 4 6].collect { :alpha |
		GammaDistribution(
			alpha,
			2
		).cdf
	}
)
~~~

![](sw/spl/Help/Image/GammaDistribution-B.svg)

Generate a sample of pseudo-random numbers from a gamma distribution:

~~~spl svg=C
let r = Sfc32(731482);
GammaDistribution(3.5, 2)
.randomVariate(r, [10 ^ 4])
.histogramPlot
~~~

![](sw/spl/Help/Image/GammaDistribution-C.svg)

Mean and variance:

```
>> GammaDistribution(`α`, `β`).mean
(* α β)

>> GammaDistribution(`α`, `β`).variance
(* α (* β β))
```

* * *

See also: BetaDistribution, ExponentialDistribution, gamma, gammaRegularized

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/GammaDistribution.html),
_Mathworks_
[1](https://au.mathworks.com/help/stats/gamrnd.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda366b.htm),
_W_
[1](https://en.wikipedia.org/wiki/Gamma_distribution)

Further Reading: Marsaglia 2000
