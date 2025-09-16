# blackmanNuttallWindow

- _blackmanNuttallWindow(x)_

Answer the Blackman-Nuttall window function at _x_.

```
>>> 0.1.blackmanNuttallWindow
0.798258
```

Threads over lists, zero at each end-point:

```
>>> [-1 -0.5 0 0.5 1].blackmanNuttallWindow
[0 0 1 0 0]
```

The area under the Blackman–Nuttall window:

```
>>> blackmanNuttallWindow:/1
>>> .adaptiveSimpsonsMethod([-0.5 0.5])
0.3635819
```

Plot:

~~~spl svg=A
(-0.5 -- 0.5).functionPlot(
	blackmanNuttallWindow:/1
)
~~~

![](sw/spl/Help/Image/blackmanNuttallWindow-A.svg)

Discrete Blackman-Nuttall window of length 15:

~~~spl svg=B
(-0.5 -- 0.5).discretize(
	15,
	blackmanNuttallWindow:/1
).discretePlot
~~~

![](sw/spl/Help/Image/blackmanNuttallWindow-B.svg)

Frequency response of the Blackman-Nuttall window:

~~~spl svg=C
51.windowTable(
	blackmanNuttallWindow:/1
).fftPlot(512, 'Centred', 'Logarithmic')
~~~

![](sw/spl/Help/Image/blackmanNuttallWindow-C.svg)

* * *

See also: generalCosineWindow, nuttallWindow

Guides: Window Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BlackmanNuttallWindow.html),
_Mathworks_
[1](https://mathworks.com/help/signal/ref/nuttallwin.html),
_Python_
[1](https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.windows.nuttall.html)

Categories: Windowing
