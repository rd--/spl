# smootherstep

- _smootherstep(aNumber)_

`smootherstep` is the second `smoothstepFunction`.

Smootherstep function:

~~~spl svg=A
(0 -- 1).functionPlot(
	smootherstep:/1
)
~~~

![](sw/spl/Help/Image/smootherstep-A.svg)

Smoothstep and smootherstep functions:

~~~spl svg=B
(0 -- 1).functionPlot([
	smoothstep:/1,
	smootherstep:/1
])
~~~

![](sw/spl/Help/Image/smootherstep-B.svg)

`smootherstep` is `smoothstepFunction` of two:

~~~spl svg=C
(0 -- 1).functionPlot([
	smootherstep:/1,
	smoothstepFunction(2)
])
~~~

![](sw/spl/Help/Image/smootherstep-C.svg)

* * *

See also: smoothstep, smoothstepFunction

Guides: Interpolation Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Smoothstep)
