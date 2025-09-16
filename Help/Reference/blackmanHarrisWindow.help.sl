# blackmanHarrisWindow

- _blackmanHarrisWindow(x)_

Answer the Blackman-Harris window function at _x_.

```
>>> 0.1.blackmanHarrisWindow
0.793834
```

Threads over lists, zero at each end-point:

```
>>> [-1 -0.5 0 0.5 1].blackmanHarrisWindow
[0 0 1 0 0]
```

Plot:

~~~spl svg=A
(-1 -- 1).functionPlot(
	blackmanHarrisWindow:/1
)
~~~

![](sw/spl/Help/Image/blackmanHarrisWindow-A.svg)

Discrete Blackman-Harris window of length 15:

~~~spl svg=B
(-0.5 -- 0.5).discretize(
	15,
	blackmanHarrisWindow:/1
)
.discretePlot
~~~

![](sw/spl/Help/Image/blackmanHarrisWindow-B.svg)

Frequency response of the Blackman-Harris window:

~~~spl svg=C
51.windowTable(
	blackmanHarrisWindow:/1
).fftPlot(512, 'Centred', 'Logarithmic')
~~~

![](sw/spl/Help/Image/blackmanHarrisWindow-C.svg)

* * *

See also: blackmanWindow

Guides: Window Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BlackmanHarrisFunction.html)
[2](https://reference.wolfram.com/language/ref/BlackmanHarrisWindow.html),
_Mathworks_
[1](https://au.mathworks.com/help/signal/ref/blackmanharris.html),
_Python_
[1](https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.windows.blackmanharris.html),
_W_
[1](https://en.wikipedia.org/wiki/Window_function#Blackman%E2%80%93Harris_window)

Further Reading: Harris 1978

Categories: Windowing
