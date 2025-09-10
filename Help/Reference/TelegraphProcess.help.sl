# TelegraphProcess

- _TelegraphProcess(μ)_

A `Type` representung a telegraph process with rate μ.
The telegraph process is a memoryless continuous-time stochastic process that shows two distinct values.

Simulate the telegraph process:

~~~spl svg=A
TelegraphProcess(1.3)
.randomFunction(
	Sfc32(356714),
	[0 15 0.1],
	1
).stepPlot
~~~

![](sw/spl/Help/Image/TelegraphProcess-A.svg)

With smaller μ over a longer time period:

~~~spl svg=B
TelegraphProcess(0.15)
.randomFunction(
	Sfc32(719482),
	[0 35 0.1],
	1
).stepPlot
~~~

![](sw/spl/Help/Image/TelegraphProcess-B.svg)

* * *

See also: ExponentialDistribution, PoissonDistribution

Guides: Random Processes

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/TelegraphProcess.html),
_W_
[1](https://en.wikipedia.org/wiki/Telegraph_process)
