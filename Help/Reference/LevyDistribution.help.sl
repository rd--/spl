# LevyDistribution

- _LevyDistribution(μ, σ)_

A `Type` representing a Lévy distribution with location parameter μ and dispersion parameter σ.

Plot `pdf` at varying _σ_:

~~~spl svg=A
(0.01 -- 3).functionPlot(
	[0.5 1 2 4 8].collect { :sigma |
		LevyDistribution(0, sigma).pdf
	}
)
~~~

![](sw/spl/Help/Image/LevyDistribution-A.svg)

Generate a sample of pseudorandom numbers from a Lévy distribution:

~~~spl svg=B
let r = Sfc32(376812);
LevyDistribution(0, 2)
.randomVariate(r, [10 ^ 4])
.select { :x |
	x.between([0 10])
}.histogramPlot
~~~

![](sw/spl/Help/Image/LevyDistribution-B.svg)

* * *

See also: StableDistribution

Guides: Probability Distributions, Random Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LevyDistribution.html),
_W_
[1](https://en.wikipedia.org/wiki/L%C3%A9vy_distribution)
