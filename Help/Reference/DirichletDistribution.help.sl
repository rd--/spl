# DirichletDistribution

- _DirichletDistribution([α₁ α₂ …])_

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

Surface plot of `pdf`:

~~~spl svg=B
let f:/1 = DirichletDistribution([3 3 2]).pdf;
(0 -- 1).surfacePlot { :x :y |
	f([x y]) * 2
}
~~~

![](sw/spl/Help/Image/DirichletDistribution-B.svg)

Matrix plot of `pdf`:

~~~spl png=C
let f:/1 = DirichletDistribution([5 5 5]).pdf;
let i = (0 -- 1).discretize(100);
let m = { :x :y |
	f([x y])
}.table(i, i).rescale;
(1 - m).Greymap
~~~

![](sw/spl/Help/Image/DirichletDistribution-C.png)

* * *

See also: BetaDistribution, GammaDistribution

Guides: Probability Distributions, Random Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DirichletDistribution.html),
_W_
[1](https://en.wikipedia.org/wiki/Dirichlet_distribution)
