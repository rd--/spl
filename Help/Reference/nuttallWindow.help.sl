# nuttallWindow

- _nuttallWindow(x)_

Answer the Nuttall window function at _x_.

```
>>> 0.1.nuttallWindow
0.790755

>>> 0.1.generalCosineWindow(
>>> 	[88942 121849 36058 3151]
>>> 	/
>>> 	250000
>>> )
0.790755
```

Threads over lists, zero at each end-point:

```
>>> [-1 -0.5 0 0.5 1].nuttallWindow
[0 0 1 0 0]
```

Plot:

~~~spl svg=A
(-0.5 -- 0.5).functionPlot(
	nuttallWindow:/1
)
~~~

![](sw/spl/Help/Image/nuttallWindow-A.svg)

Discrete Nuttall window of length 15:

~~~spl svg=B
(-0.5 -- 0.5).discretize(
	15,
	nuttallWindow:/1
).discretePlot
~~~

![](sw/spl/Help/Image/nuttallWindow-B.svg)

Frequency response of the Nuttall window:

~~~spl svg=C
51.windowTable(
	nuttallWindow:/1
).fftPlot(512, 'Centered', 'Logarithmic')
~~~

![](sw/spl/Help/Image/nuttallWindow-C.svg)

* * *

See also: generalCosineWindow, blackmanNuttallWindow

Guides: Window Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NuttallWindow.html)

Categories: Windowing
