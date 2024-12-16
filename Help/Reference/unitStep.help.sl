# unitStep

- _unitStep(aNumber)_

The unit box function is equal to 1 for values in `>` `zero` and 0 otherwise.

```
>>> -1.unitStep
0

>>> 0.8.unitStep
1
```

Plot:

~~~spl svg=A
(-1 -- 1).functionPlot(unitStep:/1)
~~~

![](sw/spl/Help/Image/unitStep-A.svg)

Plot in two dimensions:

~~~spl svg=B
(-1 -- 1).surfacePlot { :x :y |
	[x y].unitStep
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

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/UnitStep.html)
