# smoothstep

- _smoothstep(aNumber)_

Smoothstep is a family of sigmoid-like interpolation functions.
`smoothstep` interpolates between `zero` and `one` using a Hermite polynomial.
The gradient of the smoothstep function is zero at both edges.

Smoothstep function:

~~~spl svg=A
(0 -- 1).functionPlot(
	smoothstep:/1
)
~~~

![](sw/spl/Help/Image/smoothstep-A.svg)

Smoothstep and smootherstep functions:

~~~spl svg=B
(0 -- 1).functionPlot([
	smoothstep:/1,
	smootherstep:/1
])
~~~

![](sw/spl/Help/Image/smoothstep-B.svg)

Smoothstep and inverse smoothstep functions:

~~~spl svg=C
(0 -- 1).functionPlot([
	smoothstep:/1,
	inverseSmoothstep:/1
])
~~~

![](sw/spl/Help/Image/smoothstep-C.svg)

`smoothstep` is `smoothstepFunction` of `one`:

~~~spl svg=D
(0 -- 1).functionPlot([
	smoothstep:/1,
	smoothstepFunction(1)
])
~~~

![](sw/spl/Help/Image/smoothstep-D.svg)

`smootherstep` is `smoothstepFunction` of two:

~~~spl svg=E
(0 -- 1).functionPlot([
	smootherstep:/1,
	smoothstepFunction(2)
])
~~~

![](sw/spl/Help/Image/smoothstep-E.svg)

Four smoothstep functions:

~~~spl svg=F
(0 -- 1).functionPlot(
	[0 1 3 7].collect(
		smoothstepFunction:/1
	)
)
~~~

![](sw/spl/Help/Image/smoothstep-F.svg)

Smoothstep of smoothstep function:

~~~spl svg=G
(0 -- 1).functionPlot { :x |
	x.smoothstep.smoothstep
}
~~~

![](sw/spl/Help/Image/smoothstep-G.svg)

Approximate `smoothstep` using `cos`:

~~~spl svg=H
(0 -- 1).functionPlot([
	smoothstep:/1,
	{ :x | 0.5 - (x.-.pi.cos * 0.5) }
])
~~~

![](sw/spl/Help/Image/smoothstep-H.svg)


* * *

See also: easingFunction, hermiteInterpolation, smootherstep, smoothstepFunction

Guides: Interpolation Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Smoothstep)
