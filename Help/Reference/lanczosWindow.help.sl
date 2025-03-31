# lanczosWindow

- _lanczosWindow(x)_

The Lanczos window function.

Evaluate numerically:

```
>>> 0.1.lanczosWindow
0.9355
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

* * *

See also: bartlettWindow, hannWindow, kaiserWindow, lanczosKernel

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LanczosWindow.html)
