# smoothStep

- _smoothStep(x)_

SmoothStep is a family of sigmoid-like interpolation functions.
`smoothStep` interpolates between `zero` and `one` using a Hermite polynomial.
The gradient of the smoothStep function is zero at both edges.

The function passes through `zero`, one half and `one`:

```
>>> [0 0.5 1].collect(smoothStep:/1)
[0 0.5 1]
```

Inputs smaller than 1/2 underestimate the input:

```
>>> 0.1.smoothStep
0.028
```

Values larger than 1/2 do the opposite:

```
>>> 0.7.smoothStep
0.784

>>> 2/3.smoothStep
20/27

>>> 0.66.smoothStep
0.7318
```

SmoothStep function:

~~~spl svg=A
(0 -- 1).functionPlot(
	smoothStep:/1
)
~~~

![](sw/spl/Help/Image/smoothStep-A.svg)

The `smoothStep` and `smootherStep` functions:

~~~spl svg=B
(0 -- 1).functionPlot([
	smoothStep:/1,
	smootherStep:/1
])
~~~

![](sw/spl/Help/Image/smoothStep-B.svg)

SmoothStep and inverse smoothStep functions:

~~~spl svg=C
(0 -- 1).functionPlot([
	smoothStep:/1,
	inverseSmoothStep:/1
])
~~~

![](sw/spl/Help/Image/smoothStep-C.svg)

`smoothStep` is `smoothStepFunction` of `one`:

~~~spl svg=D
(0 -- 1).functionPlot([
	smoothStep:/1,
	smoothStepFunction(1)
])
~~~

![](sw/spl/Help/Image/smoothStep-D.svg)

`smootherStep` is `smoothStepFunction` of two:

~~~spl svg=E
(0 -- 1).functionPlot([
	smootherStep:/1,
	smoothStepFunction(2)
])
~~~

![](sw/spl/Help/Image/smoothStep-E.svg)

Four smoothStep functions:

~~~spl svg=F
(0 -- 1).functionPlot(
	[0 1 3 7].collect(
		smoothStepFunction:/1
	)
)
~~~

![](sw/spl/Help/Image/smoothStep-F.svg)

SmoothStep of smoothStep function:

~~~spl svg=G
(0 -- 1).functionPlot { :x |
	x.smoothStep.smoothStep
}
~~~

![](sw/spl/Help/Image/smoothStep-G.svg)

Approximate `smoothStep` using `cos`:

~~~spl svg=H
(0 -- 1).functionPlot([
	smoothStep:/1,
	{ :x | 0.5 - (x.-.pi.cos * 0.5) }
])
~~~

![](sw/spl/Help/Image/smoothStep-H.svg)

* * *

See also: easingFunction, hermiteInterpolation, inverseSmoothStep, smootherStep, smoothStepFunction

Guides: Interpolation Functions, Sigmoid Functions

References:
_Mathematica_
[1](https://resources.wolframcloud.com/FunctionRepository/resources/SmoothStep/)
[2](https://resources.wolframcloud.com/FunctionRepository/resources/RationalSmoothStep/),
_W_
[1](https://en.wikipedia.org/wiki/Smoothstep)
