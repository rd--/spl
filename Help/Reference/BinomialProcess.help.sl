# BinomialProcess

- _BinomialProcess(p)_

A `Type` that represents a binomial process with event probability _p_.
A binomial process is the prefix sum of a Bernoulli process.

Simulate a binomial process:

~~~spl svg=A
let r = Sfc32(890143);
BinomialProcess(1.0 / 3.0)
.randomFunction(r, [0.0 50.0], 1L)
.discretePlot
~~~

![](Help/Image/BinomialProcess-A.svg)

Simulate an ensemble of paths:

~~~spl svg=B
let r = Sfc32(890132);
BinomialProcess(2.0 / 5.0)
.randomFunction(r, [0.0 50.0], 4L)
.stepPlot
~~~

![](Help/Image/BinomialProcess-B.svg)

* * *

See also: BernoulliProcess, BinomialDistribution, GeometricDistribution, PoissonProcess, randomFunction

Guides: Random Processes

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BinomialProcess.html),
_W_
[1](https://en.wikipedia.org/wiki/Binomial_process)
