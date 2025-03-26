# BinomialProcess

- _BinomialProcess(p)_

A `Type` that represents a binomial process with event probability _p_.
A binomial process is the prefix sum of a Bernoulli process.

Simulate a binomial process:

~~~spl svg=A
let r = Sfc32(890143);
BinomialProcess(1 / 3)
.randomFunction(r, [0 50], 1)
.discretePlot
~~~

![](sw/spl/Help/Image/BinomialProcess-A.svg)


Simulate an ensemble of paths:

~~~spl svg=B
let r = Sfc32(890132);
BinomialProcess(2 / 5)
.randomFunction(r, [0 50], 4)
.stepPlot
~~~

![](sw/spl/Help/Image/BinomialProcess-B.svg)

* * *

See also: BernoulliProcess, BinomialDistribution, GeometricDistribution, PoissonProcess, randomFunction

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BinomialProcess.html),
_W_
[1](https://en.wikipedia.org/wiki/Binomial_process)
