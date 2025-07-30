# BernoulliProcess

- _BernoulliProcess(p)_

A `Type` that represents a Bernoulli process with event probability _p_.

Simulate a Bernoulli process,
entries are either `zero` or `one`:

~~~spl svg=A
let r = Sfc32(890143);
BernoulliProcess(1 / 3)
.randomFunction(r, [0 30], 1)
.stepPlot
~~~

![](sw/spl/Help/Image/BernoulliProcess-A.svg)

* * *

See also: randomBit, randomBoolean, BernoulliDistribution, BinomialProcess, randomFunction

Guides: Random Processes

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BernoulliDistribution.html)
[2](https://reference.wolfram.com/language/ref/BernoulliProcess.html),
_W_
[1](https://en.wikipedia.org/wiki/Bernoulli_process)
