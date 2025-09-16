# tukeyWindow

- _tukeyWindow(x, α=2/3)_

Answer the Tukey window function at _x_.
At α=0 equivalent to a rectangular window,
at α=1 equivalent to a Hann window.

At specific value:

```
>>> 0.4.tukeyWindow
0.206107
```

Threads over lists, zero at each end-point:

```
>>> [-1 -0.5 0 0.5 1].tukeyWindow(0.3)
[0 0 1 0 0]
```

Plot, the unary forms sets α=2/3:

~~~spl svg=A
(-1 -- 1).functionPlot(
	tukeyWindow:/1
)
~~~

![](sw/spl/Help/Image/tukeyWindow-A.svg)

Shape of a Tukey window using specified parameters:

~~~spl svg=B
(-1 -- 1).functionPlot(
	[0 0.5 1].collect { :alpha |
		{ :x |
			x.tukeyWindow(alpha)
		}
	}
)
~~~

![](sw/spl/Help/Image/tukeyWindow-B.svg)

Discrete Tukey window of length 15:

~~~spl svg=C
(-0.5 -- 0.5)
.discretize(15, tukeyWindow:/1)
.discretePlot
~~~

![](sw/spl/Help/Image/tukeyWindow-C.svg)

Frequency response of the Tukey window at α=1/2:

~~~spl svg=D
51.windowTable { :x |
	x.tukeyWindow(1 / 2)
}.fftPlot(512, 'Centred', 'Logarithmic')
~~~

![](sw/spl/Help/Image/tukeyWindow-D.svg)

* * *

See also: bartlettWindow, blackmanWindow, cosineWindow, hannWindow

Guides: Window Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/TukeyWindow.html),
_Mathworks_
[1](https://au.mathworks.com/help/signal/ref/tukeywin.html),
_Python_
[1](https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.windows.tukey.html)

Categories: Windowing
