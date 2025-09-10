# BinormalDistribution

- _BinormalDistribution(μ, σ, ρ)_

Answers an instance of `MultinormalDistribution` representing a bivariate normal distribution,
with mean μ and covariance matrix [σ₁² ρσ₁σ₂; ρσ₁σ₂ σ₂²].

Generate a sample of pseudo-random vectors from a bivariate normal distribution:

~~~spl svg=A
let r = Sfc32(678132);
BinormalDistribution([1 2], [1.5 2], 0.6)
.randomVariate(r, [2E2])
.scatterPlot
~~~

![](sw/spl/Help/Image/BinormalDistribution-A.svg)

Generate vectors with specified correlation:

```
>>> let r = Sfc32(678132);
>>> let d = BinormalDistribution(
>>> 	[0 0], [1 1], -0.75
>>> );
>>> let m = d.randomVariate(r, [3E2]);
>>> let [x, y] = m.transpose;
>>> x.correlation(y)
-0.7429
```

Plot correlated data:

~~~spl svg=B
let r = Sfc32(678132);
BinormalDistribution([0 0], [1 1], -0.75)
.randomVariate(r, [2E2])
.scatterPlot
~~~

![](sw/spl/Help/Image/BinormalDistribution-B.svg)

* * *

See also: MultinormalDistribution, NormalDistribution

Guides: Probability Distributions, Random Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BivariateNormalDistribution.html)
[2](https://reference.wolfram.com/language/ref/BinormalDistribution.html),
_W_
[1](https://en.wikipedia.org/wiki/Multivariate_normal_distribution)

Categories: Statistics, Random
