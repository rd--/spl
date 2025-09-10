# StableDistribution

- _StableDistribution(α, β, μ, σ)_

A `Type` thhat represents the stable distribution with index of stability α,
skewness parameter β,
location parameter μ,
and scale parameter σ.

With α=2 and β=0 gives the normal distribution:

~~~
let r = Sfc32(376812);
StableDistribution(2, 0, 0, 1)
.randomVariate(r, [10 ^ 4])
.histogramPlot
~~~

With α=1 and β=0 gives the Cauchy distribution:

~~~
let r = Sfc32(376812);
StableDistribution(1, 0, 0, 0.025)
.randomVariate(r, [10 ^ 3])
.clip
.histogramPlot
~~~
