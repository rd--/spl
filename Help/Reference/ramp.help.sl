# ramp

- _ramp(x)_

Answer _x_ if _x ≥ 0_ and 0 otherwise.

Evaluate numerically:

```
>>> -1.ramp
0

>>> 3.7.ramp
3.7

>>> 1/2.ramp
1/2
```

Ramp threads over lists:

```
>>> [-5 -1.5 0 1/3 1.pi].ramp
[0 0 0 1/3 1.pi]
```

Plot over a subset of the reals:

~~~spl svg=A
(-2 -- 2).functionPlot(ramp:/1)
~~~

![](sw/spl/Help/Image/ramp-A.svg)

Plot a function involving ramp:

~~~spl svg=B
(-2 -- 3.pi).functionPlot { :x |
	x.sin * ((3 * x) - 1).ramp
}
~~~

![](sw/spl/Help/Image/ramp-B.svg)

* * *

See also: heavisideTheta, logisticSigmoid, smoothStep, unitStep

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RampFunction.html)
[2](https://reference.wolfram.com/language/ref/Ramp.html)
_W_
[1](https://en.wikipedia.org/wiki/Ramp_function)
