# parzenWindow

- _parzenWindow(x)_

Answer the Parzen window function of _x_.

Evaluate numerically:

```
>>> 0.1.parzenWindow
0.808
```

Plot Parzen window:

~~~spl svg=A
(-1 -- 1).functionPlot(parzenWindow:/1)
~~~

![](sw/spl/Help/Image/parzenWindow-A.svg)

Translated and dilated Parzen window:

~~~spl svg=B
(-1 -- 3).functionPlot { :x |
	((x - 1) / 2).parzenWindow
}
~~~

![](sw/spl/Help/Image/parzenWindow-B.svg)

Discrete Parzen window of length 15:

~~~spl svg=C
(-0.5 -- 0.5).discretize(
	15,
	parzenWindow:/1
).discretePlot
~~~

![](sw/spl/Help/Image/parzenWindow-C.svg)

Compare to Gaussian window:

~~~spl svg=D
(-0.5 -- 0.5).functionPlot([
	{ :x | x.gaussianWindow(0.2) },
	parzenWindow:/1
])
~~~

![](sw/spl/Help/Image/parzenWindow-D.svg)

* * *

See also: bartlettWindow, gaussianWindow, hannWindow, kaiserWindow, tukeyWindow

Guides: Window Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ParzenWindow.html),
_Mathworks_
[1](https://mathworks.com/help/signal/ref/parzenwin.html)

Further Reading: Harris 1978
