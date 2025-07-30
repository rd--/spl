# PoissonProcess

- _PoissonProcess(μ)_

A `Type` representin a Poisson process with rate μ.

Simulate a Poisson process:

~~~spl svg=A
let r = Sfc32(681423);
PoissonProcess(1.3)
.randomFunction(r, [0 15], 1)
.stepPlot
~~~

![](sw/spl/Help/Image/PoissonProcess-A.svg)

Simulate an ensemble of paths:

~~~spl svg=B
let r = Sfc32(801323);
PoissonProcess(2.7)
.randomFunction(r, [0 15], 4)
.stepPlot
~~~

![](sw/spl/Help/Image/PoissonProcess-B.svg)

Compare paths for different values of process parameter:

~~~spl svg=C
let r = Sfc32(890133);
[0.6 1 3.5].collect { :mu |
	PoissonProcess(mu)
	.randomFunction(r, [0 20], 1)
	.pathList
	.first
}.stepPlot
~~~

![](sw/spl/Help/Image/PoissonProcess-C.svg)

* * *

See also: BinomialProcess, PoissonDistribution, ExponentialDistribution

Guides: Random Processes

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PoissonProcess.html),
_W_
[1](https://en.wikipedia.org/wiki/Poisson_point_process)
