# ProbabilityDistribution

A `Trait` for behaviours related to probablity distributions.

```
>>> system.traitDictionary.at(
>>> 	'ProbabilityDistribution'
>>> ).isTrait
true
```

Types implementing `ProbabilityDistribution`:

```
>>> system.traitTypes(
>>> 	'@ProbabilityDistribution'
>>> ).sort
[
	'ArcSinDistribution'
	'BernoulliDistribution'
	'BetaBinomialDistribution'
	'BetaDistribution'
	'BinomialDistribution'
	'CauchyDistribution'
	'DiscreteUniformDistribution'
	'EmpiricalDistribution'
	'ExponentialDistribution'
	'ExtremeValueDistribution'
	'GammaDistribution'
	'GeometricDistribution'
	'HyperbolicDistribution'
	'HypergeometricDistribution'
	'LaplaceDistribution'
	'LevyDistribution'
	'LogisticDistribution'
	'LogNormalDistribution'
	'MeixnerDistribution'
	'NoncentralBetaDistribution'
	'NoncentralChiSquareDistribution'
	'NormalDistribution'
	'ParetoDistribution'
	'PoissonDistribution'
	'SechDistribution'
	'SkewNormalDistribution'
	'StableDistribution'
	'StudentTDistribution'
	'TriangularDistribution'
	'UniformDistribution'
	'WeibullDistribution'
]
```

Methods for querying:

- `cdf`, `cumulativeDistributionFunction`
- `hazardFunction`
- `pdf`, `probabilityDensityFunction`
- `survivalFunction`

* * *

See also: cdf, hazardFunction, inverseCdf, inverseSurvivalFunction, quantile, pdf, randomVariate, survivalFunction

Guides: Probability Distributions, Random Functions
