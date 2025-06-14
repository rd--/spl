# smootherStep

- _smootherStep(aNumber)_

`smootherStep` is the second `smoothStepFunction`.

The function passes through `zero`, one half and `one`:

```
>>> [0 0.5 1].collect(smootherStep:/1)
[0 0.5 1]
```

Inputs smaller than 1/2 underestimate the input:

```
>>> 0.1.smootherStep
0.00856
```

Values larger than 1/2 do the opposite:

```
>>> 0.7.smootherStep
0.83692
```

SmootherStep function:

~~~spl svg=A
(0 -- 1).functionPlot(
	smootherStep:/1
)
~~~

![](sw/spl/Help/Image/smootherStep-A.svg)

Plot `smoothStep` and `smootherStep` functions:

~~~spl svg=B
(0 -- 1).functionPlot([
	smoothStep:/1,
	smootherStep:/1
])
~~~

![](sw/spl/Help/Image/smootherStep-B.svg)

`smootherStep` is `smoothStepFunction` of two:

~~~spl svg=C
(0 -- 1).functionPlot([
	smootherStep:/1,
	smoothStepFunction(2)
])
~~~

![](sw/spl/Help/Image/smootherStep-C.svg)

* * *

See also: smoothStep, smoothStepFunction

Guides: Interpolation Functions

References:
_Mathematica_
[1](https://resources.wolframcloud.com/FunctionRepository/resources/SmootherStep/),
_W_
[1](https://en.wikipedia.org/wiki/Smoothstep)
