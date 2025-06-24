# softPlus

- _softPlus(x)_

Implement the softplus function,
a smooth approximation to the ramp function.

Plot over a subset of the reals:

~~~spl svg=A
(-3 -- 3).functionPlot(softPlus:/1)
~~~

![](sw/spl/Help/Image/softPlus-A.svg)

The derivative is `logisticSigmoid`:

~~~spl svg=B
(-3 -- 3).discretize(100, softPlus:/1)
.differences
.linePlot
~~~

![](sw/spl/Help/Image/softPlus-B.svg)

* * *

See also: logisticSigmoid, softMax, softSign, ramp

References:
_W_
[1](https://en.wikipedia.org/wiki/Softplus)
