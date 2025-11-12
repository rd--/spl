# dirichletWindow

- _dirichletWindow(x)_

Answer the Dirichlet window function at _x_.
The Dirichlet window is rectangular.

```
>>> 0.1.dirichletWindow
1
```

Threads over lists, zero outside of _(-½,½)_:

```
>>> [-1 -0.5 0 0.5 1].dirichletWindow
[0 1 1 1 0]
```

Plot:

~~~spl svg=A
(-1 -- 1).functionPlot(dirichletWindow:/1)
~~~

![](sw/spl/Help/Image/dirichletWindow-A.svg)

Discrete Dirichlet window of length 15:

```
>>> (-0.5 -- 0.5).discretize(
>>> 	15,
>>> 	dirichletWindow:/1
>>> )
[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
```

Frequency response of the Dirichlet window:

~~~spl svg=B
51.windowTable(
	dirichletWindow:/1
).fftPlot(512, 'Centered', 'Logarithmic')
~~~

![](sw/spl/Help/Image/dirichletWindow-B.svg)

* * *

See also: bartlettWindow, gaussianWindow

Guides: Window Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DirichletWindow.html),
_Mathworks_
[1](https://au.mathworks.com/help/signal/ref/rectwin.html)

Categories: Windowing
