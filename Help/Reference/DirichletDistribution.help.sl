# DirichletDistribution

- _DirichletDistribution(alphaList)_

A `Type` representing a Dirichlet distribution with shape parameters α,
and dimension _#α - 1_.
It is a multivariate generalization of the beta distribution.

~~~spl svg=A
let r = Sfc32(367823);
let d = DirichletDistribution([2 3 2]);
let p = d.randomVariate(r, [10 ^ 2]);
(p ++ [0 0; 1 1]).scatterPlot
~~~

![](sw/spl/Help/Image/DirichletDistribution-A.svg)

The beta distributions from which the variate process draws:

```
>>> DirichletDistribution([0 1 2 3])
>>> .betaDistributions
[
	BetaDistribution(0, 1 + 2 + 3),
	BetaDistribution(1, 2 + 3),
	BetaDistribution(2, 3)
]
```

* * *

See also: BetaDistribution, GammaDistribution

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DirichletDistribution.html),
_W_
[1](https://en.wikipedia.org/wiki/Dirichlet_distribution)
