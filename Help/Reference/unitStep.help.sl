# unitStep

- _unitStep(x)_

The unit step function is equal to `one` for values `>=` `zero`,
and `zero` otherwise.

```
>>> -1.unitStep
0

>>> 0.8.unitStep
1

>>> (1, 1.pi, 5.3).unitStep
1
```

Threads over lists:

```
>>> [-1.6 3.2].unitStep
[0 1]
```

Plot:

~~~spl svg=A
(-1 -- 1).functionPlot(unitStep:/1)
~~~

![](sw/spl/Help/Image/unitStep-A.svg)

Plot in two dimensions:

~~~spl svg=B
(-1 -- 1).surfacePlot { :x :y |
	(x, y).unitStep * 23
}
~~~

![](sw/spl/Help/Image/unitStep-B.svg)

Generate a square wave:

~~~spl svg=C
(0 -- 10).functionPlot { :x |
	x.pi.sin.unitStep
}
~~~

![](sw/spl/Help/Image/unitStep-C.svg)

* * *

See also: diracDelta, isPositive, unitBox, unitize

Guides: Signal Processing Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/UnitStep.html)
