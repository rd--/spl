# smoothstepFunction

- _smoothstepFunction(anInteger)_

Answer the _n_-th smoothstep function.
The zeroeth function is a straight line.
The first function is `smoothstep`.
The second function is `smootherstep`.

Six smoothstep functions:

~~~spl svg=A
(0 -- 1).functionPlot(
	[0 1 3 7 11 17].collect(
		smoothstepFunction:/1
	)
)
~~~

![](sw/spl/Help/Image/smoothstepFunction-A.svg)

* * *

See also: binomialPascal, smootherstep, smoothstep

Guides: Interpolation Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Smoothstep)
