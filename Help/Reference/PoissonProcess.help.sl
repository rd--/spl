# PoissonProcess

- _PoissonProcess(μ)_

A `Type` representin a Poisson process with rate μ.

Simulate a Poisson process:

~~~spl svg=A
PoissonProcess(1.3)
.randomFunction([0 15], 1, Sfc32(681423))
.stepPlot
~~~

![](sw/spl/Help/Image/PoissonProcess-A.svg)

RandomFunction an ensemble of paths:

~~~spl svg=B
PoissonProcess(2.7)
.randomFunction([0 15], 4, Sfc32(801323))
.stepPlot
~~~

![](sw/spl/Help/Image/PoissonProcess-B.svg)

Compare paths for different values of process parameter:

~~~spl svg=C
[0.6 1 3.5].collect { :mu |
	PoissonProcess(mu)
	.randomFunction([0 20], 1, Sfc32(890133))
	.pathList
	.first
}.stepPlot
~~~

![](sw/spl/Help/Image/PoissonProcess-C.svg)

* * *

See also: BinomialProcess, PoissonDistribution, ExponentialDistribution

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PoissonProcess.html),
_W_
[1](https://en.wikipedia.org/wiki/Poisson_point_process)
