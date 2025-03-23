# BernoulliDistribution

- _BernoulliDistribution(p)_

Answer a `Type` that represents a represents a Bernoulli distribution with probability parameter _p_.

Mean and variance:

```
>> BernoulliDistribution(`p`).mean
p

>> BernoulliDistribution(`p`).variance
(* (- 1 p) p)
```

Plot `pdf` over a subset of the reals:

~~~spl svg=A
(0 -- 1).functionPlot(
	BernoulliDistribution(1 / 3).pdf
)
~~~

![](sw/spl/Help/Image/BernoulliDistribution-A.svg)

Plot `cdf` over a subset of the reals:

~~~spl svg=B
(-1 -- 1).functionPlot(
	BernoulliDistribution(1 / 3).cdf
)
~~~

![](sw/spl/Help/Image/BernoulliDistribution-B.svg)

Skewness:

~~~spl svg=C
(0.01 -- 0.99).functionPlot { :p |
	BernoulliDistribution(p).skewness
}
~~~

![](sw/spl/Help/Image/BernoulliDistribution-C.svg)

Kurtosis:

~~~spl svg=D
(0.025 -- 0.975).functionPlot { :p |
	BernoulliDistribution(p).kurtosis
}
~~~

![](sw/spl/Help/Image/BernoulliDistribution-D.svg)

Simulate a sequence of fair coin tosses:

```
>>> let r = Sfc32(839712);
>>> BernoulliDistribution(1 / 2)
>>> .randomVariate(r, 20)
[0 0 0 1 1 1 1 1 0 0 0 1 1 0 1 0 0 0 1 0]
```

Simulate throwing a die, if you are only interested in sixes:

```
>>> let r = Sfc32(739812);
>>> BernoulliDistribution(1 / 6)
>>> .randomVariate(r, 20)
[0 0 0 1 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0]
```

Simulate a symmetric random walk with values -1 and 1:

~~~spl svg=E
let r = Sfc32(579329);
let d = BernoulliDistribution(1 / 2);
let b = d.randomVariate(r, 100);
(b * 2 - 1).prefixSum.linePlot
~~~

![](sw/spl/Help/Image/BernoulliDistribution-E.svg)

* * *

See also: BernoulliProcess, CauchyDistribution, UniformDistribution, WeibullDistribution

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BernoulliDistribution.html)
[2](https://reference.wolfram.com/language/ref/BernoulliDistribution.html)
_W_
[1](https://en.wikipedia.org/wiki/Bernoulli_distribution)

Categories: Probability, Random
