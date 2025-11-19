# unitTriangle

- _unitTriangle(x)_

Answer the unit triangle function on the interval _(-1,1)_.

```
>>> 0.8.unitTriangle
0.2
```

Plot:

~~~spl svg=A
(-2 -- 2).functionPlot(unitTriangle:/1)
~~~

![](sw/spl/Help/Image/unitTriangle-A.svg)

Plot in two dimensions:

~~~spl svg=B
(-1 -- 1).surfacePlot { :x :y |
	(x, y).unitTriangle * 23
}
~~~

![](sw/spl/Help/Image/unitTriangle-B.svg)

* * *

See also: diracDelta, triangleWave, unitBox, unitStep

Guides: Signal Processing Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/UnitTriangle.html)
