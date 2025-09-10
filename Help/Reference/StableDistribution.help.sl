# StableDistribution

- _StableDistribution(α, β, μ, σ)_

A `Type` thhat represents the stable distribution with index of stability α,
skewness parameter β,
location parameter μ,
and scale parameter σ.

With α=2 and β=0 gives the normal distribution:

~~~spl svg=A
let r = Sfc32(376812);
StableDistribution(2, 0, 0, 1)
.randomVariate(r, [10 ^ 4])
.histogramPlot
~~~

![](sw/spl/Help/Image/StableDistribution-A.svg)

With α=1 and β=0 gives the Cauchy distribution:

~~~spl svg=B
let r = Sfc32(376812);
StableDistribution(1, 0, 0, 1)
.randomVariate(r, [10 ^ 4])
.select { :x |
	x.between([-5 5])
}.histogramPlot
~~~

![](sw/spl/Help/Image/StableDistribution-B.svg)

With α=½ and β=0 gives the Lévy distribution:

~~~spl svg=C
let r = Sfc32(376812);
StableDistribution(0.5, 1, 0, 1)
.randomVariate(r, [10 ^ 4])
.select { :x |
	x.between([0 10])
}.histogramPlot
~~~

![](sw/spl/Help/Image/StableDistribution-C.svg)

Map–Airy distribution:

~~~spl svg=D
let r = Sfc32(376812);
StableDistribution(
	1.5,
	-1,
	0,
	1 / ((2 ^ 1/3) * (3 ^ 2/3))
).randomVariate(r, [10 ^ 4])
.select { :x |
	x.between([-2 2])
}.histogramPlot
~~~

![](sw/spl/Help/Image/StableDistribution-D.svg)

* * *

See also: CauchyDistribution, LevyDistribution, NormalDistribution, ParetoDistribution

Guides: Probability Distributions, Random Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/StableDistribution.html)
[2](https://mathworld.wolfram.com/Map-AiryDistribution.html)
[3](https://reference.wolfram.com/language/ref/StableDistribution.html),
_W_
[1](https://en.wikipedia.org/wiki/Stable_distribution)

Further Reading: Chambers 1976
