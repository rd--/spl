# blackmanWindow

- _blackmanWindow(aNumber)_

Answer the _Blackman window_ function at _aNumber_.

```
>>> 0.1.blackmanWindow
0.84923
```

Threads over lists, zero at each end-point:

```
>>> [-1 0 1].blackmanWindow
[0 1 0]
```

Plot:

~~~spl svg=A
(-0.5 -- 0.5).functionPlot(
	blackmanWindow:/1
)
~~~

![](sw/spl/Help/Image/blackmanWindow-A.svg)

Discrete _Blackman window_ of length 15:

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
).fftPlot(512)
~~~

![](sw/spl/Help/Image/blackmanWindow-C.svg)

* * *

See also: bartlettWindow, welchWindow

Guides: Window Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BlackmanFunction.html)
[2](https://reference.wolfram.com/language/ref/BlackmanWindow.html),
_Python_
[1](https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.windows.blackman.html#scipy.signal.windows.blackman)

Categories: Windowing
