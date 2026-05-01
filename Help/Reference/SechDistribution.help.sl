# SechDistribution

- _SechDistribution(μ, σ)_

The hyperbolic secant distribution with location parameter μ and scale parameter σ.

Probability density function, varying _σ_:

~~~spl svg=A
(-1 -- 7).functionPlot(
	[0.5 1 2].collect { :sigma |
		SechDistribution(
			3, sigma
		).pdf
	}
)
~~~

![](Help/Image/SechDistribution-A.svg)

Cumulative distribution function, varying _σ_:

~~~spl svg=B
(-1 -- 7).functionPlot(
	[0.5 1 2].collect { :sigma |
		SechDistribution(
			3, sigma
		).cdf
	}
)
~~~

![](Help/Image/SechDistribution-B.svg)

Symbolic evaluation:

```
>> SechDistribution(`mu`, `sigma`)
>> .pdf(`x`)
(/
 (sech (/ (* (- x mu) π) (* 2 sigma)))
 (* 2 sigma))
```

* * *

See also: NormalDistribution, sech

Guides: Probability Distributions, Random Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SechDistribution.html),
_W_
[1](https://en.wikipedia.org/wiki/Hyperbolic_secant_distribution)

Further Reading: Harkness 1968
