# UniformDistribution

- _UniformDistribution(mu, sigma)_

Answer a `Type` that represents a normal (Gaussian) distribution with mean `μ` and standard deviation `σ`.

Calculate `entropy`, `mean`, `median`, `kurtosis`, `skewness`, `standardDeviation` and `variance`:

```
>>> let d = UniformDistribution(0, 2.pi);
>>> (d.entropy, d.mean, d.median, d.kurtosis, d.skewness, d.standardDeviation, d.variance)
(2.pi.log, pi, pi, 9/5, 0, pi / 3.sqrt, (pi / 3.sqrt).squared)
```

Plot `pdf` over a subset of the reals:

~~~
let d = UniformDistribution(0, 1);
(-1 -- 2).subdivide(500).collect { :x | d.pdf(x) }.plot
~~~

Plot `cdf` over a subset of the reals:

~~~
let d = UniformDistribution(0, 1);
(-1 -- 2).subdivide(500).collect { :x | d.cdf(x) }.plot
~~~

Plot `randomVariate`:

~~~
UniformDistribution(0, 1).randomVariate(500).plot
~~~

* * *

See also: cdf, mean, pdf, randomVariate, standardDeviation

References:
_Mathematica_
[1](https://mathworld.wolfram.com/UniformDistribution.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/eda3662.htm)
_W_
[1](https://en.wikipedia.org/wiki/Continuous_uniform_distribution)
