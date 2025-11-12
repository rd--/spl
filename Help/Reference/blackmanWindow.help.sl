# blackmanWindow

- _blackmanWindow(x)_

Answer the Blackman window function at _x_.

```
>>> 0.1.blackmanWindow
0.84923
```

Threads over lists, zero at each end-point:

```
>>> [-1 -0.5 0 0.5 1].blackmanWindow
[0 0 1 0 0]
```

Plot:

~~~spl svg=A
(-0.5 -- 0.5).functionPlot(
	blackmanWindow:/1
)
~~~

![](sw/spl/Help/Image/blackmanWindow-A.svg)

Discrete Blackman window of length 15:

~~~spl svg=B
(-0.5 -- 0.5).discretize(
	15,
	blackmanWindow:/1
).discretePlot
~~~

![](sw/spl/Help/Image/blackmanWindow-B.svg)

Frequency response of the Blackman window:

~~~spl svg=C
51.windowTable(
	blackmanWindow:/1
).fftPlot(512, 'Centered', 'Logarithmic')
~~~

![](sw/spl/Help/Image/blackmanWindow-C.svg)

* * *

See also: bartlettWindow, blackmanHarrisWindow, welchWindow

Guides: Window Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BlackmanFunction.html)
[2](https://reference.wolfram.com/language/ref/BlackmanWindow.html),
_Python_
[1](https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.windows.blackman.html#scipy.signal.windows.blackman)

Categories: Windowing
