# bohmanWindow

- _bohmanWindow(x)_

Answer the Bohman window function at _x_.

At specific value:

```
>>> 0.1.bohmanWindow
0.834311
```

Threads over lists, zero at each end-point:

```
>>> [-1 -0.5 0 0.5 1].bohmanWindow
[0 0 1 0 0]
```

The area under the Bohman window:

```
>>> bohmanWindow:/1
>>> .adaptiveSimpsonsMethod([-0.5 0.5])
4 / 1.pi.square
```

Plot:

~~~spl svg=A
(-1 -- 1).functionPlot(
	bohmanWindow:/1
)
~~~

![](sw/spl/Help/Image/bohmanWindow-A.svg)

Discrete Bohman window of length 15:

~~~spl svg=B
(-0.5 -- 0.5)
.discretize(15, bohmanWindow:/1)
.discretePlot
~~~

![](sw/spl/Help/Image/bohmanWindow-B.svg)

Frequency response of the Bohman window:

~~~spl svg=C
51.windowTable { :x |
	x.bohmanWindow
}.fftPlot(512, 'Centered', 'Logarithmic')
~~~

![](sw/spl/Help/Image/bohmanWindow-C.svg)

* * *

See also: bartlettWindow, blackmanWindow, cosineWindow, hannWindow

Guides: Window Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BohmanWindow.html),
_Mathworks_
[1](https://au.mathworks.com/help/signal/ref/bohmanwin.html),
_Python_
[1](https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.windows.bohman.html)

Categories: Windowing
