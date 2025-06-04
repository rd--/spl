# flatTopWindow

- _flatTopWindow(x)_

Answer the FlatTop window function of _x_.

Evaluate numerically:

```
>>> 0.1.flatTopWindow
0.606872
```

Plot FlatTop window:

~~~spl svg=A
(-1 -- 1).functionPlot(flatTopWindow:/1)
~~~

![](sw/spl/Help/Image/flatTopWindow-A.svg)

Translated and dilated FlatTop window:

~~~spl svg=B
(-1 -- 3).functionPlot { :x |
	((x - 1) / 2).flatTopWindow
}
~~~

![](sw/spl/Help/Image/flatTopWindow-B.svg)

Discrete FlatTop window of length 15:

~~~spl svg=C
(-0.5 -- 0.5).discretize(
	15,
	flatTopWindow:/1
).discretePlot
~~~

![](sw/spl/Help/Image/flatTopWindow-C.svg)

* * *

See also: bartlettWindow, blackmanWindow, hannWindow, tukeyWindow

Guides: Window Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FlatTopWindow.html),
_Mathworks_
[1](https://mathworks.com/help/signal/ref/flattopwin.html)
