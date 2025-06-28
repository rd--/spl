# swishFunction

- _swishFunction(β)_

Implement the swish function,
a family of sigmoid functions.

Plot over a subset of the reals:

~~~spl svg=A
(-5 -- 5).functionPlot(1.swishFunction)
~~~

![](sw/spl/Help/Image/swishFunction-A.svg)

Varying β:

~~~spl svg=A
(-5 -- 5).functionPlot(
	[-0.25 0 0.75].collect { :beta |
		beta.swishFunction
	}
)
~~~

![](sw/spl/Help/Image/swishFunction-B.svg)

* * *

See also: logisticSigmoid, softPlus, softSign

Guides: Sigmoid Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Swish_function)
