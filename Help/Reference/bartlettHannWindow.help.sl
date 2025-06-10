# bartlettHannWindow

- _bartlettHannWindow(x)_

Answer the _Bartlett window_ function at _x_.
The _Bartlett window_ is triangular.

```
>>> 0.1.bartlettHannWindow
0.879426
```

Threads over lists, zero at each end-point:

```
>>> [-1 0 1].bartlettHannWindow
[0 1 0]
```

Plot:

~~~spl svg=A
(-1 -- 1).functionPlot(
	bartlettHannWindow:/1
)
~~~

![](sw/spl/Help/Image/bartlettHannWindow-A.svg)

Discrete _Bartlett window_ of length 15:

~~~spl svg=B
15.windowTable(
	bartlettHannWindow:/1
).discretePlot
~~~

![](sw/spl/Help/Image/bartlettHannWindow-B.svg)

Frequency response of the Bartlett-Hann window:

~~~spl svg=C
51.windowTable(
	bartlettHannWindow:/1
).fftPlot(512)
~~~

![](sw/spl/Help/Image/bartlettHannWindow-C.svg)

* * *

See also: bartlettWindow, hannWindow, blackmanWindow, welchWindow

Guides: Window Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BartlettHannWindow.html),
_Mathworks_
[1](https://mathworks.com/help/signal/ref/barthannwin.html),
_Python_
[1](https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.windows.barthann.html),
_W_
[1](https://en.wikipedia.org/wiki/Window_function#Bartlett%E2%80%93Hann_window)

Categories: Windowing
