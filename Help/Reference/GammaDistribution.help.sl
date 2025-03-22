# GammaDistribution

- _GammaDistributionn(α, β)_

A `Type` representing a gamma distribution with shape parameter α and scale parameter β.

Probability mass function:

~~~spl svg=A
(0 -- 20).functionPlot(
	[1 4 6].collect { :alpha |
		let d = GammaDistribution(
			alpha,
			2
		);
		{ :x |
			d.pdf(x).clip(0, 0.2)
		}
	}
)
~~~

![](sw/spl/Help/Image/GammaDistribution-A.svg)

Cumulative distribution function:

~~~spl svg=B
(0 -- 20).functionPlot(
	[1 4 6].collect { :alpha |
		let d = GammaDistribution(
			alpha,
			2
		);
		{ :x |
			d.cdf(x)
		}
	}
)
~~~

![](sw/spl/Help/Image/GammaDistribution-B.svg)

Mean and variance:

```
>> GammaDistribution(`α`, `β`).mean
(* α β)

>> GammaDistribution(`α`, `β`).variance
(* α (* β β))
```

* * *

See also: ExponentialDistribution, gamma, incompleteGamma

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/GammaDistribution.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda366b.htm),
_W_
[1](https://en.wikipedia.org/wiki/Gamma_distribution)
