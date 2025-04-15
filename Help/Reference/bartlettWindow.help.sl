# bartlettWindow

- _bartlettWindow(aNumber)_

Answer the _Bartlett window_ function at _aNumber_.
The _Bartlett window_ is triangular.

```
>>> 0.1.bartlettWindow
0.8
```

Threads over lists, zero at each end-point:

```
>>> [-1 0 1].bartlettWindow
[0 1 0]
```

Plot:

~~~spl svg=A
(-0.5 -- 0.5).functionPlot(
	bartlettWindow:/1
)
~~~

![](sw/spl/Help/Image/bartlettWindow-A.svg)

Discrete _Bartlett window_ of length 15:

~~~spl svg=B
(-0.5 -- 0.5).discretize(
	15,
	bartlettWindow:/1
).discretePlot
~~~

![](sw/spl/Help/Image/bartlettWindow-B.svg)

* * *

See also: bartlettHannWindow, blackmanWindow, welchWindow

Guides: Window Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BartlettFunction.html)
[2](https://reference.wolfram.com/language/ref/BartlettWindow.html),
_Mathworks_
[1](https://au.mathworks.com/help/signal/ref/bartlett.html)
[2](https://au.mathworks.com/help/signal/ref/triang.html)

Categories: Windowing
