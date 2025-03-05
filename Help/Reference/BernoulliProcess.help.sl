# BernoulliProcess

- _BernoulliProcess(p)_

A `Type` that represents a Bernoulli process with event probability _p_.

Simulate a Bernoulli process:

~~~spl svg=A
Sfc32(890143).randomFunction(
	BernoulliProcess(1 / 3),
	[0 30 1],
	1
).discretePlot
~~~

![](sw/spl/Help/Image/BernoulliProcess-A.svg)

* * *

See also: randomFunction, WienerProcess

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BernoulliDistribution.html)
[2](https://reference.wolfram.com/language/ref/BernoulliProcess.html),
_W_
[1](https://en.wikipedia.org/wiki/Bernoulli_process)
