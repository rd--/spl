# lanczosWindow

- _lanczosWindow(x)_

The Lanczos window function.

Evaluate numerically:

```
>>> 0.1.lanczosWindow
0.9355
```

Threads over lists, zero at each end-point:

```
>>> [-1 0 1].lanczosWindow
[0 1 0]
```

Plot:

~~~spl svg=A
(-1 -- 1).functionPlot(lanczosWindow:/1)
~~~

![](sw/spl/Help/Image/lanczosWindow-A.svg)

Translated and dilated Lanczos window:

~~~spl svg=B
(-1 -- 3).functionPlot { :x |
	((x - 1) / 2).lanczosWindow
}
~~~

![](sw/spl/Help/Image/lanczosWindow-B.svg)

Frequency response of the Lanczos window:

~~~spl svg=C
51.windowTable { :x |
	x.lanczosWindow
}.fftPlot(512, 'Centred', 'Logarithmic')
~~~

![](sw/spl/Help/Image/lanczosWindow-C.svg)

* * *

See also: bartlettWindow, hannWindow, kaiserWindow, lanczosKernel

Guides: Window Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LanczosWindow.html),
_Python_
[1](https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.windows.lanczos.html)
