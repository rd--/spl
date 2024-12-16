# unitBox

- _unitBox(aNumber)_

The unit box function is equal to 1 for values in _(-1/2, 1/2)_ and 0 otherwise.

```
>>> 0.8.unitBox
0
```

Plot:

~~~spl svg=A
(-1 -- 1).functionPlot(unitBox:/1)
~~~

![](sw/spl/Help/Image/unitBox-A.svg)

Plot in two dimensions:

~~~spl svg=B
(-1 -- 1).surfacePlot { :x :y |
	[x y].unitBox
}
~~~

![](sw/spl/Help/Image/unitBox-B.svg)

* * *

See also: diracDelta, unitStep

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/UnitBox.html)
