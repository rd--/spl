# flatTopWindow

- _flatTopWindow(x)_

Answer the flat-top window function of _x_.

Evaluate numerically:

```
>>> 0.1.flatTopWindow
0.606872
```

Plot flat-top window:

~~~spl svg=A
(-1 -- 1).functionPlot(flatTopWindow:/1)
~~~

![](sw/spl/Help/Image/flatTopWindow-A.svg)

Translated and dilated flat-top window:

~~~spl svg=B
(-1 -- 3).functionPlot { :x |
	((x - 1) / 2).flatTopWindow
}
~~~

![](sw/spl/Help/Image/flatTopWindow-B.svg)

Discrete flat-top window of length 15:

~~~spl svg=C
(-0.5 -- 0.5).discretize(
	15,
	flatTopWindow:/1
).discretePlot
~~~

![](sw/spl/Help/Image/flatTopWindow-C.svg)

Frequency response of the flat-top window:

~~~spl svg=D
51.windowTable(
	flatTopWindow:/1
).fftPlot(512, 'Centered', 'Logarithmic')
~~~

![](sw/spl/Help/Image/flatTopWindow-D.svg)

* * *

See also: bartlettWindow, blackmanWindow, hannWindow, tukeyWindow

Guides: Window Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FlatTopWindow.html),
_Mathworks_
[1](https://mathworks.com/help/signal/ref/flattopwin.html),
_Python_
[1](https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.windows.flattop.html)
