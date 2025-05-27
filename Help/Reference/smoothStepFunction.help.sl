# smoothStepFunction

- _smoothStepFunction(anInteger)_

Answer the _n_-th smoothStep function.
The zeroeth function is a straight line.
The first function is `smoothStep`.
The second function is `smootherstep`.

Evaluate at `Fraction`:

```
>>> 3.smoothStepFunction.value(1/3)
379/2187
```

Evaluate at `SmallFloat`:

```
>>> 3.smoothStepFunction.value(0.33)
0.1682
```

Six smoothStep functions:

~~~spl svg=A
(0 -- 1).functionPlot(
	[0 1 3 7 11 17].collect(
		smoothStepFunction:/1
	)
)
~~~

![](sw/spl/Help/Image/smoothStepFunction-A.svg)

* * *

See also: binomialPascal, smootherStep, smoothStep

Guides: Interpolation Functions

References:
_Mathematica_
[1](https://resources.wolframcloud.com/FunctionRepository/resources/GeneralizedSmoothStep/),
_W_
[1](https://en.wikipedia.org/wiki/Smoothstep)
