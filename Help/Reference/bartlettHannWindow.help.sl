# bartlettHannWindow

- _bartlettHannWindow(aNumber)_

Answer the _Bartlett window_ function at _aNumber_.
The _Bartlett window_ is triangular.

```
>>> 0.1.bartlettHannWindow
0.879426
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
(-0.5 -- 0.5).discretize(
	15,
	bartlettHannWindow:/1
).discretePlot
~~~

![](sw/spl/Help/Image/bartlettHannWindow-B.svg)

* * *

See also: bartlettWindow, hannWindow, blackmanWindow, welchWindow

Guides: Window Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BartlettHannWindow.html),
_Matthworks_
[1](https://mathworks.com/help/signal/ref/barthannwin.html)

Categories: Windowing
