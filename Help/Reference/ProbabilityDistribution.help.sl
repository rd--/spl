# ProbabilityDistribution

A `Trait` for behaviours related to probablity distributions.

```
>>> system
>>> .traitDictionary['ProbabilityDistribution']
>>> .isTrait
true
```

Types implementing `ProbabilityDistribution`:

```
>>> system.traitTypes(
>>> 	'@ProbabilityDistribution'
>>> ).sort
[
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
	'HypergeometricDistribution'
	'LaplaceDistribution'
	'LevyDistribution'
	'LogisticDistribution'
	'LogNormalDistribution'
	'NoncentralBetaDistribution'
	'NoncentralChiSquareDistribution'
	'NormalDistribution'
	'ParetoDistribution'
	'PoissonDistribution'
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
