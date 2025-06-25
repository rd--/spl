# unitBox

- _unitBox(x)_

The unit box function is equal to `one` for values in _(-1/2, 1/2)_ and `zero` otherwise.

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
	[x y].unitBox * 23
}
~~~

![](sw/spl/Help/Image/unitBox-B.svg)

The convolution of the rectangle function with itself is the triangle function:

~~~spl svg=C
let u = (-1 -- 1).discretize(50, unitBox:/1);
convolve(u, u).linePlot
~~~

![](sw/spl/Help/Image/unitBox-C.svg)

* * *

See also: diracDelta, dirichletWindow, unitStep, unitTriangle

Guides: Signal Processing Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RectangleFunction.html)
[2](https://reference.wolfram.com/language/ref/UnitBox.html),
_W_
[1](https://en.wikipedia.org/wiki/Rectangular_function)
