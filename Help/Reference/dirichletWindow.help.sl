# dirichletWindow

- _dirichletWindow(aNumber)_

Answer the _Dirichlet window_ function at _aNumber_.
The _Dirichlet window_ is rectangular.

```
>>> 0.1.dirichletWindow
1
```

Threads over lists, zero at each end-point:

```
>>> [-1 0 1].dirichletWindow
[0 1 0]
```

Plot:

~~~spl svg=A
(-1 -- 1).functionPlot(dirichletWindow:/1)
~~~

![](sw/spl/Help/Image/dirichletWindow-A.svg)

Discrete _Dirichlet window_ of length 15:

```
>>> (-0.5 -- 0.5).discretize(
>>> 	15,
>>> 	dirichletWindow:/1
>>> )
[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
```

* * *

See also: gaussianWindow

Guides: Window Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DirichletWindow.html),
_Mathworks_
[1](https://au.mathworks.com/help/signal/ref/rectwin.html)

Categories: Windowing
