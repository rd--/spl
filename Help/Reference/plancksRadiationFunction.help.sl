# plancksRadiationFunction

- _plancksRadiationFunction(x)_

Plancks radiation function.

At specific values:

```
>>> [0 1 2 3].collect(
>>> 	plancksRadiationFunction:/1
>>> )
[0 0.08962 0.007418 0.0016018]
```

Maximum:

```
>>> 0.201405.plancksRadiationFunction
3.2648
```

Inflections:

```
>>> 0.11842.plancksRadiationFunction
1.4225

>>> 0.283757.plancksRadiationFunction
2.5424
```

Plot over a subset of the reals:

~~~spl svg=A
(0 -- 2).functionPlot(
	plancksRadiationFunction:/1
)
~~~

![](sw/spl/Help/Image/plancksRadiationFunction-A.svg)

* * *

See also: e, pi, planckRadiationLaw

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PlancksRadiationFunction.html)
